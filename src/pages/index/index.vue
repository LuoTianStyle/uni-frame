<!-- 使用 type="home" 属性设置首页，其他页面不需要设置，默认为page；推荐使用json5，更强大，且允许注释 -->
<route lang="json5" type="home">
{
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '首页',
  },
}
</route>
<template>
  <view
    class="bg-white overflow-hidden pt-2 px-4"
    :style="{ marginTop: safeAreaInsets?.top + 'px' }"
  >
    <view class="mt-12">
      <image src="/static/logo.svg" alt="" class="w-28 h-28 block mx-auto" />
    </view>

    <view class="text-justify max-w-100 m-auto text-4 indent mb-2">{{ description }}</view>
    <view class="mt-8 text-center">
      <text class="text-green-400">当前模板分支：base</text>
    </view>
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
.main-title-color {
  color: #d14328;
}
</style>
