<template>
  <wd-config-provider :theme-vars="themeVars" class="w-full h-full">
    <slot />
  </wd-config-provider>
</template>
<script lang="ts" setup>
import themeVars from '@/style/theme'
</script>
<style lang="scss"></style>
