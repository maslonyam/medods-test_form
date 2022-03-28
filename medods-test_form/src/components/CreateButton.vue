<script>
export default {
  props: {
    msg: {
      type: String,
      required: true,
    },
  },
};
</script>

<template>
  <button class="button" type="submit">
    {{ msg }}
  </button>
</template>

<style lang="scss">
$white: #ffffff;
$dark-blue: #5889c2;

.button {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: auto;
  margin-right: 50px;
  width: 200px;
  height: 50px;
  color: $white;
  font-weight: 700;
  font-size: 20px;
  background: $dark-blue;
  border: none;
  border-radius: 10px;
}
</style>
