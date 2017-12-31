<template>
  <footer class="py-4 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">{{ message }}</p>
    </div>
  </footer>
</template>

<script>
export default {
  data() {
    return {
      message: `Copyright © My Rails Blog ${new Date().getFullYear()}`
    };
  }
};
</script>
