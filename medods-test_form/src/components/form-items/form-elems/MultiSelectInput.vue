<script>
import useVuelidate from "@vuelidate/core";
import { required } from "@vuelidate/validators";

export default {
  setup() {
    return { v$: useVuelidate() };
  },
  props: {
    id: {
      type: String,
      required: true,
    },
    label: {
      type: String,
      required: true,
    },
    isRequired: {
      type: Boolean,
      required: true,
    },
    options: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      selected: [],
    };
  },
  validations() {
    return {
      selected: {
        required,
      },
    };
  },
};
</script>

<template>
  <div class="mselect-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid:
          v$.selected.$dirty && v$.selected.required.$invalid && isRequired,
        valid: !v$.selected.required.$invalid,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <select
      :id="id"
      class="input-field"
      :class="{
        invalid:
          v$.selected.$dirty && v$.selected.required.$invalid && isRequired,
        valid: !v$.selected.required.$invalid,
      }"
      :required="isRequired"
      v-model="selected"
      multiple
    >
      <option v-bind:key="option" v-for="option in options">
        {{ option }}
      </option>
    </select>
    <small
      v-if="v$.selected.$dirty && v$.selected.required.$invalid && isRequired"
      class="message-error"
      >Это поле обязательно для заполнения</small
    >
  </div>
</template>

<style lang="scss">
.mselect-input.form-input {
  .input-field {
    height: fit-content;
    max-height: 80px;
  }
}
</style>
