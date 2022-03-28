<script>
export default {
  props: {
    info: {
      type: Object,
      required: true,
    },
  },
};
</script>

<template>
  <div class="form__about about">
    <h2 class="about-header">{{ info.header }}</h2>
    <p class="about-description">{{ info.description }}</p>
    <p class="about-hints" :key="hint" v-for="hint in info.hints">{{ hint }}</p>
  </div>
</template>

<style lang="scss">
$dark-gray: #3e3e3e;
$light-gray: #aaaaaa;

.about {
  &-header {
    margin-top: 0;
    color: $dark-gray;
    font-size: 20px;
    text-align: start;
  }
  &-description,
  &-hints {
    color: $light-gray;
    font-weight: 400;
    font-size: 15px;
  }
}
</style>
