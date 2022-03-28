<script>
import FormItemAbout from "./form-elems/FormItemAbout.vue";
import TextInput from "./form-elems/TextInput.vue";
import DateInput from "./form-elems/DateInput.vue";
import PhoneInput from "./form-elems/PhoneInput.vue";
import SelectInput from "./form-elems/SelectInput.vue";
import MultiSelectInput from "./form-elems/MultiSelectInput.vue";
import CheckboxInput from "./form-elems/CheckboxInput.vue";

export default {
  components: {
    FormItemAbout,
    TextInput,
    DateInput,
    PhoneInput,
    SelectInput,
    MultiSelectInput,
    CheckboxInput,
  },
  data() {
    return {
      info: {
        header: "Личная информация",
        description:
          "Укажите личную информацию согласно документу, удостоверяющему личность.",
        hints: [
          "Чтобы выделить несколько вариантов в поле «Группа клиентов», зажмите Ctrl и выберите необходимые категории.",
          "Поля обязательные для заполнения отмечены звездочкой (*).",
        ],
      },
      doctorOptions: ["Иванов", "Захаров", "Чернышева"],
      clientsOptions: ["VIP", "Проблемные", "ОМС"],
    };
  },
};
</script>

<template>
  <fieldset class="form__personal-data fieldset">
    <FormItemAbout :info="info" />
    <div class="personal-data__input-wrapper">
      <TextInput
        label="Фамилия *"
        id="surname"
        placeholder="Иванов"
        :isRequired="true"
      />
      <TextInput
        label="Имя *"
        id="name"
        placeholder="Иван"
        :isRequired="true"
      />
      <TextInput
        label="Отчество"
        id="patron"
        placeholder="Иванович"
        :isRequired="false"
      />
      <DateInput label="Дата рождения *" id="birthday" :isRequired="true" />
      <PhoneInput
        label="Номер телефона *"
        id="phone"
        placeholder="7-(999)-999-99-99"
        :isRequired="true"
      />
      <SelectInput
        label="Лечащий врач"
        id="doctor"
        :isRequired="false"
        :options="doctorOptions"
      />
      <MultiSelectInput
        label="Группа клиентов *"
        id="client"
        :isRequired="true"
        :options="clientsOptions"
      />
      <CheckboxInput
        label="Не отправлять СМС"
        id="sms-check"
        isRequired="false"
      />
    </div>
  </fieldset>
</template>
