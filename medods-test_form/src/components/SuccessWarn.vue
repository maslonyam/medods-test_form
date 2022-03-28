<template>
  <div class="success-wrapper">
    <div class="success-warn">
      <p class="success-warn__message">Новый клиент успешно создан!</p>
    </div>
  </div>
</template>

<style lang="scss">
$white: #ffffff;
$dark-blue: #5889c2;
$black: #000000;

.success-wrapper {
  .success-warn {
    position: fixed;
    z-index: 3;
    top: -50%;
    display: flex;
    align-items: center;
    width: 600px;
    height: 500px;
    background: $white;
    border-radius: 40px;
    transform: translate(-50%, -50%);
    transition: 0.3s;
    &__message {
      margin: 50px;
      text-align: center;
      font-size: 40px;
      color: $black;
    }
  }

  &.show {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100vw;
    height: 100vh;
    background-color: rgba($black, 0.5);
    backdrop-filter: blur(3px);
    transition: 0.3s;
    .success-warn {
      top: 50%;
      left: 50%;
      margin-right: 50%;
    }
  }
}

@media (max-width: 680px) {
  .success-wrapper {
    .success-warn {
      width: 400px;
      height: 300px;
      &__message {
        margin: 20px;
        font-size: 20px;
      }
    }
  }
}

@media (max-width: 420px) {
  .success-wrapper {
    .success-warn {
      width: 280px;
    }
  }
}
</style>
