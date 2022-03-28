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
  },
  data() {
    return {
      date: null,
    };
  },
  validations() {
    return {
      date: {
        required,
      },
    };
  },
};
</script>

<template>
  <div class="date-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid: v$.date.$dirty && v$.date.required.$invalid && isRequired,
        valid: !v$.date.required.$invalid,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <input
      :id="id"
      class="input-field"
      :class="{
        invalid: v$.date.$dirty && v$.date.required.$invalid && isRequired,
        valid: !v$.date.required.$invalid,
      }"
      :required="isRequired"
      type="date"
      v-model="date"
    />
    <small
      v-if="v$.date.$dirty && v$.date.required.$invalid && isRequired"
      class="message-error"
      >Это поле обязательно для заполнения</small
    >
  </div>
</template>

<style lang="scss">
.form-input.date-input {
  .input-field {
    width: 200px;
  }
}
</style>
