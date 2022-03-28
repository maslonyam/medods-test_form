<template>
  <div class="phone-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid:
          (v$.tel.$dirty && v$.tel.required.$invalid && isRequired) ||
          v$.tel.numeric.$invalid,
        valid: !v$.tel.required.$invalid && !v$.tel.numeric.$invalid,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <input
      :id="id"
      class="input-field"
      :class="{
        invalid:
          (v$.tel.$dirty && v$.tel.required.$invalid && isRequired) ||
          v$.tel.numeric.$invalid,
        valid: !v$.tel.required.$invalid && !v$.tel.numeric.$invalid,
      }"
      :placeholder="placeholder"
      :required="isRequired"
      type="tel"
      v-model="tel"
      @blur="v$.tel.$touch"
    />
    <small
      v-if="v$.tel.$dirty && v$.tel.required.$invalid"
      class="message-error"
      >Введите телефон</small
    >
    <small v-if="v$.tel.numeric.$invalid" class="message-error"
      >Телефон должен состоять из цифр</small
    >
  </div>
</template>

<script>
import useVuelidate from '@vuelidate/core';
import { required, numeric } from '@vuelidate/validators';

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
      tel: null,
    };
  },
  validations() {
    return {
      tel: {
        required,
        numeric,
      },
    };
  },
};
</script>
