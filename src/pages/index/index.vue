<!-- 使用 type="home" 属性设置首页，其他页面不需要设置，默认为page；推荐使用json5，更强大，且允许注释 -->
<route lang="json5" type="home">
{
  layout: 'base',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '首页',
  },
}
</route>
<template>
  <view class="overflow-hidden index-container" :style="{ marginTop: safeAreaInsets?.top + 'px' }">
    <view class="index-container-inner">
      <wd-sticky :offset-top="-44" @click="linTo">
        <view class="index-title">首页</view>
        <wd-search disabled class="search-input" hide-cancel />
      </wd-sticky>
      <view class="index-notice">
        <view class="index-notice-left">
          <image class="index-notice-left-image" src="/static/images/message.png" />
        </view>
        <!-- <view class="">
          <view class="">请于今日9:00-14:00完成报价</view>
          <view class="">
            非时段内不可报价，如果价格变动，会进入待上架，审核通过后会重新上架，被驳回的会进入已下架。
          </view>
        </view> -->
      </view>
      <view class="">发货地缺失</view>
      <wd-tabs v-model="tab">
        <block
          v-for="item in [
            { id: 1, label: '已上架' },
            { id: 2, label: '待上架' },
            { id: 3, label: '已下架' },
          ]"
          :key="item.id"
        >
          <wd-tab :title="item.label">
            <view v-if="tab === 0" class="content">
              <view
                v-for="item in [
                  {
                    id: 1,
                    label: '全部',
                  },
                  {
                    id: 2,
                    label: '待更新',
                  },
                  {
                    id: 3,
                    label: '已更新',
                  },
                  {
                    id: 4,
                    label: '长期报价',
                  },
                ]"
                :key="item.id"
              >
                {{ item.label }}
              </view>
            </view>
          </wd-tab>
        </block>
      </wd-tabs>
      <view class="">一键刷新（保持昨日报价）</view>
      <view class="">
        <view class="">
          <image class="history-delete" src="/static/images/message.png" />
        </view>
        <view class="">
          <view class="">苹果2斤/箱</view>
          <view class="">
            <view class="">毛重:2 | 斤/箱</view>
            <view class="">净重:2 | 斤/箱</view>
            <view class="">包装0 | 斤/箱</view>
          </view>
          <view class="">￥10.00/箱</view>
          <view class="">长期报价</view>
        </view>
      </view>
      <wd-fab type="primary" position="right-bottom" direction="top">
        <wd-button custom-class="custom-button" type="primary" round>
          <wd-icon name="github-filled" size="22px"></wd-icon>
        </wd-button>
        <wd-button custom-class="custom-button" type="success" round>
          <wd-icon name="star" size="22px"></wd-icon>
        </wd-button>
      </wd-fab>
    </view>
  </view>
</template>

<script lang="ts" setup>
import PLATFORM from '@/utils/platform'
// 获取屏幕边界到安全区域距离
const { safeAreaInsets } = uni.getSystemInfoSync()
console.log(PLATFORM)
console.log(safeAreaInsets)
const text = ref('测试')
const tab = ref<number>(0)

onLoad(() => {
  console.log(text)
})

const linTo = () => uni.navigateTo({ url: '/pages/search/index' })
</script>

<style lang="scss" scoped>
.index-container {
  position: relative;
  min-height: 100%;
  background: $uni-bg-color-grey;

  &::before {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 570rpx;
    content: '';
    background-image: url('/static/images/bg.jpg');
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
  }

  .index-container-inner {
    position: relative;
    z-index: 2;
    box-sizing: border-box;
    padding: 0 28rpx;

    .index-title {
      font-size: 36rpx;
      font-weight: 500;
      line-height: 88rpx;
      color: #333;
    }

    .search-input {
      width: calc(100vw - 56rpx) !important;
      height: 86rpx !important;
      padding: 0 !important;
      background: transparent !important;

      :deep(.wd-search__cover) {
        height: 86rpx;
        background: #fff;
        border-radius: 8rpx;
        box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);
      }

      :deep(.wd-search__field) {
        height: 86rpx;
        background: #fff;
        border-radius: 8rpx;
        box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);
      }
    }

    .index-notice {
      display: flex;
      align-items: center;
      background: #fff;
      box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

      .index-notice-left {
        width: 154rpx;
        height: 154rpx;
        padding: 36rpx 12rpx 34rpx 16rpx;

        .index-notice-left-image {
          width: 84rpx;
          height: 84rpx;
        }
      }
    }
  }
}
</style>
