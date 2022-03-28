<template>
  <div class="check-input form-input">
    <label
      :for="id"
      class="label"
      :class="{
        invalid:
          v$.isChecked.$dirty && v$.isChecked.required.$invalid && isRequired,
        valid:
          (v$.isChecked.$dirty && !v$.isChecked.required.$invalid) || isChecked,
      }"
      :data-required="isRequired"
      >{{ label }}</label
    >
    <input
      :id="id"
      class="check-field"
      :class="{
        invalid:
          v$.isChecked.$dirty && v$.isChecked.required.$invalid && isRequired,
        valid: v$.isChecked.$dirty && !v$.isChecked.required.$invalid,
      }"
      :isRequired="isRequired"
      type="checkbox"
      v-model="isChecked"
    />
    <small
      v-if="v$.isChecked.$dirty && v$.isChecked.required.$invalid && isRequired"
      class="message-error"
      >Это поле обязательно для заполнения</small
    >
  </div>
</template>

<script>
import useVuelidate from '@vuelidate/core';
import { required } from '@vuelidate/validators';

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
      type: String,
      required: true,
    },
  },
  data() {
    return {
      isChecked: null,
    };
  },
  validations() {
    return {
      isChecked: {
        required,
      },
    };
  },
};
</script>

<style lang="scss">
$dark-blue: #5889c2;
$black: #000000;
$green: #82dc28;
$red: #ef5d5d;

.form-input.check-input {
  flex-direction: row;
  align-items: center;
  .label {
    color: $black;
    order: 2;

    &.invalid {
      color: $red;
    }

    &.valid {
      color: $green;
    }
  }

  .check-field {
    width: 20px;
    height: 20px;
    order: 1;

    &:checked {
      background: $dark-blue;
    }
  }
}
</style>
