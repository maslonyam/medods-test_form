<script>
import FormItemAbout from "./form-elems/FormItemAbout.vue";
import TextInput from "./form-elems/TextInput.vue";
import SelectInput from "./form-elems/SelectInput.vue";
import NumberInput from "./form-elems/NumberInput.vue";
import DateInput from "./form-elems/DateInput.vue";

export default {
  components: {
    FormItemAbout,
    TextInput,
    SelectInput,
    NumberInput,
    DateInput,
  },
  data() {
    return {
      info: {
        header: "Паспортные данные",
        description:
          "Укажите паспортные данные клиента согласно документу, удостоворяющему личность.",
        hints: ["Поля обязательные для заполнения отмечены звездочкой (*)."],
      },
      documentOptions: [
        "Паспорт",
        "Свидетельство о рождении",
        "Водительское удостоверние",
      ],
    };
  },
};
</script>

<template>
  <fieldset class="form__passport fieldset">
    <FormItemAbout :info="info" />
    <div class="passport__input-wrapper">
      <SelectInput
        label="Тип документа *"
        id="document"
        :isRequired="true"
        :options="documentOptions"
      />
      <NumberInput
        label="Серия"
        id="passport-series"
        placeholder="1234"
        :isRequired="false"
      />
      <NumberInput
        label="Номер"
        id="passport-number"
        placeholder="123456"
        :isRequired="false"
      />
      <TextInput
        label="Кем выдан"
        id="passport-organisation"
        placeholder="ОУФМС в Ивановском районе"
        :isRequired="false"
      />
      <DateInput label="Дата выдачи *" id="passport-date" :isRequired="true" />
    </div>
  </fieldset>
</template>
