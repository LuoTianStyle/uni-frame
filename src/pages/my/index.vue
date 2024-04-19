<route lang="json5">
{
  layout: 'base',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '我的',
  },
}
</route>
<template>
  <view class="overflow-hidden index-container" :style="{ marginTop: safeAreaInsets?.top + 'px' }">
    <view @click="linkTo">登录</view>
  </view>
</template>

<script lang="ts" setup>
// 获取屏幕边界到安全区域距离
const { safeAreaInsets } = uni.getSystemInfoSync()
const linkTo = () => uni.navigateTo({ url: '/pages/login/index' })
</script>

<style>
.index-container {
  min-height: 100%;
  background: #f8f8f8;
}
</style>
