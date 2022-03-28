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
      textValue: null,
    };
  },
  validations() {
    return {
      textValue: {
        required,
      },
    };
  },
};
</script>

<template>
  <div class="text-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid:
          v$.textValue.$dirty && v$.textValue.required.$invalid && isRequired,
        valid: !v$.textValue.required.$invalid,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <input
      :id="id"
      class="input-field"
      :class="{
        invalid:
          v$.textValue.$dirty && v$.textValue.required.$invalid && isRequired,
        valid: !v$.textValue.required.$invalid,
      }"
      :placeholder="placeholder"
      :required="isRequired"
      type="text"
      v-model="textValue"
      @blur="v$.textValue.$touch"
    />
    <small
      v-if="v$.textValue.$dirty && v$.textValue.required.$invalid && isRequired"
      class="message-error"
      >Это поле обязательно для заполнения</small
    >
  </div>
</template>
