<route lang="json5">
{
  layout: 'base',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '订单',
  },
}
</route>
<template>
  <view class="overflow-hidden index-container" :style="{ marginTop: safeAreaInsets?.top + 'px' }">
    <view class="text-justify max-w-100 m-auto text-4 indent mb-2">{{ description }}</view>
  </view>
</template>

<script lang="ts" setup>
// 获取屏幕边界到安全区域距离
const { safeAreaInsets } = uni.getSystemInfoSync()

const text = ref('测试')
const description = ref('hello world')

onLoad(() => {
  console.log(text)
})
</script>

<style>
.index-container {
  min-height: 100%;
  background: #f8f8f8;
}
</style>
