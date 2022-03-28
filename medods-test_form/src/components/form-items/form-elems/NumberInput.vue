<template>
  <div class="number-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid:
          v$.numberValue.$dirty &&
          v$.numberValue.required.$invalid &&
          isRequired,
        valid: !v$.numberValue.required.$invalid,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <input
      :id="id"
      class="input-field"
      :class="{
        invalid:
          v$.numberValue.$dirty &&
          v$.numberValue.required.$invalid &&
          isRequired,
        valid: !v$.numberValue.required.$invalid,
      }"
      :placeholder="placeholder"
      :required="isRequired"
      type="number"
      v-model="numberValue"
      @blur="v$.numberValue.$touch"
    />
    <small
      v-if="
        v$.numberValue.$dirty && v$.numberValue.required.$invalid && isRequired
      "
      class="message-error"
      >Это поле обязательно для заполнения</small
    >
  </div>
</template>

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
    placeholder: {
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
      numberValue: null,
    };
  },
  validations() {
    return {
      numberValue: {
        required,
      },
    };
  },
};
</script>
