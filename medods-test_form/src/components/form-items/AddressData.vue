<script>
import FormItemAbout from "./form-elems/FormItemAbout.vue";
import TextInput from "./form-elems/TextInput.vue";
import NumberInput from "./form-elems/NumberInput.vue";

export default {
  components: {
    FormItemAbout,
    TextInput,
    NumberInput,
  },
  data() {
    return {
      info: {
        header: "Адрес",
        description:
          "По желанию клиента указывается адрес прописки (согласно документу, удостоверяющему личность) или фактический адрес проживания.",
        hints: ["Поля обязательные для заполнения отмечены звездочкой (*)."],
      },
    };
  },
};
</script>

<template>
  <fieldset class="form__address fieldset">
    <FormItemAbout :info="info" />
    <div class="address__input-wrapper">
      <NumberInput
        label="Индекс"
        id="index"
        placeholder="123456"
        :isRequired="false"
      />
      <TextInput
        label="Страна"
        id="country"
        placeholder="Россия"
        :isRequired="false"
      />
      <TextInput
        label="Область"
        id="area"
        placeholder="Московская"
        :isRequired="false"
      />
      <TextInput
        label="Город *"
        id="city"
        placeholder="Коломна"
        :isRequired="true"
      />
      <TextInput
        label="Улица"
        id="street"
        placeholder="Пушкина"
        :isRequired="false"
      />
      <TextInput label="Дом" id="house" placeholder="150" :isRequired="false" />
    </div>
  </fieldset>
</template>
