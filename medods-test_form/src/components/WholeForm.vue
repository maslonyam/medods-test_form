<script>
import PersonalData from "./form-items/PersonalData.vue";
import AddressData from "./form-items/AddressData.vue";
import PassportData from "./form-items/PassportData.vue";
import CreateButton from "./CreateButton.vue";
import SuccessWarn from "./SuccessWarn.vue";

export default {
  components: {
    PersonalData,
    AddressData,
    PassportData,
    CreateButton,
    SuccessWarn,
  },
  methods: {
    submitForm() {
      const requiredFields = document.querySelectorAll(
        "input[required], select[required], label[data-required='true']"
      );
      const success = document.querySelector(".success-wrapper");
      let isValid;

      requiredFields.forEach((field) => {
        isValid = this.checkRequiredFields(field);
      });

      if (isValid) {
        success.classList.add("show");
      }
    },
    checkRequiredFields(field) {
      let isValid = true;
      if (!field.value) {
        isValid = false;
        field.classList.add("invalid");
        window.scrollTo(0, 0);
      }
      return isValid;
    },
  },
};
</script>

<template>
  <div class="container">
    <h1 class="header">Новый клиент</h1>
    <form
      class="form"
      @submit.prevent="submitForm"
      autocomplete="off"
      novalidate
    >
      <PersonalData />
      <AddressData />
      <PassportData />
      <CreateButton msg="Создать" />
    </form>
    <SuccessWarn />
  </div>
</template>

<style lang="scss">
@import "../assets/sass/input.scss";

$dark-gray: #3e3e3e;
$light-gray: #e5e5e5;
$gray: #565656;
$green: #94d454;
$red: #ef5d5d;
$light-blue: #c7e1ff;

.container {
  width: 1000px;
  margin: 50px auto;
  font-family: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif;

  .header {
    margin: 40px 0 20px;
    color: $dark-gray;
    font-size: 22px;
    text-align: center;
  }

  .fieldset {
    display: flex;
    gap: 50px;
    padding: 40px 55px;
    border: none;
    border-top: 2px solid $light-gray;
  }
}

@media (max-width: 1100px) {
  .container {
    width: 660px;

    .fieldset {
      padding: 20px;
    }
  }
}

@media (max-width: 680px) {
  .container {
    width: 100%;

    .fieldset {
      flex-direction: column;
      align-items: center;
      gap: 0px;
    }
  }
}

@media (max-width: 420px) {
  .container {
    .fieldset {
      align-items: stretch;
    }
  }
}
</style>
