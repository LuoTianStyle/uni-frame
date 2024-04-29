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
      <view class="index-title">首页</view>
      <wd-search disabled class="search-input" hide-cancel @click="linTo('/pages/search/index')" />
      <view class="index-notice">
        <view class="index-notice-delete">
          <image class="index-notice-delete-image" src="/static/images/message_delete.png" />
        </view>
        <view class="index-notice-left">
          <image class="index-notice-left-image" src="/static/images/message.png" />
        </view>
        <view class="index-notice-right">
          <view class="index-notice-right-title">请于今日9:00-14:00完成报价</view>
          <view class="index-notice-right-describe">
            非时段内不可报价，如果价格变动，会进入待上架，审核通过后会重新上架，被驳回的会进入已下架。
          </view>
        </view>
      </view>
      <!-- <wd-sticky :offset-top="-44"> -->
      <view class="index-tab-box">
        <wd-tabs v-model="tab" class="index-tab-tab" :lineWidth="24" :lineHeight="6">
          <block
            v-for="item in [
              { id: 0, label: '已上架' },
              { id: 1, label: '待上架' },
              { id: 2, label: '已下架' },
            ]"
            :key="item.id"
          >
            <wd-tab :title="item.label">
              <view v-if="tab === 0" class="index-tab-content">
                <view
                  :class="
                    item.id === 1 ? 'index-tab-content-item active' : 'index-tab-content-item'
                  "
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
        <view v-if="tab === 0" class="index-tab-address">
          <image class="index-tab-address-image" src="/static/images/address.png" />
          <text>发货地缺失</text>
        </view>
      </view>
      <!-- </wd-sticky> -->
      <view v-if="tab === 0" class="reload-box">
        <view class="reload-image-box">
          <image class="reload-image" src="/static/images/reload.png" />
        </view>
        <view class="reload-text">一键刷新（保持昨日报价）</view>
      </view>
      <view class="list-container">
        <view class="list-box-wrapper" v-for="item in [1, 2, 3, 4, 5, 6, 7, 8]" :key="item">
          <view v-if="tab === 2" class="list-box-right-delete">删除</view>
          <view :class="tab !== 2 ? 'list-box' : 'list-box list-box-disabled'">
            <view class="list-box-left">
              <image class="list-box-left-image" src="/static/images/avater.png" />
            </view>
            <view class="list-box-right">
              <view
                :class="
                  tab !== 2
                    ? 'list-box-right-title ellipsis-2'
                    : 'list-box-right-title ellipsis-2 list-box-right-title-pr'
                "
              >
                {{
                  '苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤苹果2斤'.slice(
                    0,
                    Math.floor(Math.random() * 100),
                  )
                }}
              </view>
              <view class="list-box-right-tag">
                <view class="mr1">毛重:2 | 斤/箱</view>
                <view>净重:2 | 斤/箱</view>
              </view>
              <view class="list-box-right-tag">
                <view>包装0 | 斤/箱</view>
              </view>
              <view class="list-box-right-content">
                <view class="list-box-right-price">￥10.00/箱</view>
                <view class="list-box-right-type">长期报价</view>
              </view>
            </view>
          </view>
        </view>
      </view>

      <wd-fab type="primary" activeIcon="add" @click="linTo('/pages/add/index')"></wd-fab>
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

const linTo = (url: string) => uni.navigateTo({ url })
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
      padding-top: 88rpx;
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
        border-radius: 16rpx;
        box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);
      }

      :deep(.wd-search__field) {
        height: 86rpx;
        background: #fff;
        border-radius: 16rpx;
        box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);
      }
    }

    .index-notice {
      position: relative;
      display: flex;
      margin-top: 24rpx;
      background: #fff;
      border-radius: 16rpx;
      box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

      .index-notice-delete {
        position: absolute;
        top: 0;
        right: 0;
        width: 34rpx;
        height: 30rpx;
        cursor: pointer;

        .index-notice-delete-image {
          display: block;
          width: 34rpx;
          height: 30rpx;
        }
      }

      .index-notice-left {
        box-sizing: border-box;
        padding: 36rpx 12rpx 34rpx 16rpx;

        .index-notice-left-image {
          width: 84rpx;
          height: 84rpx;
        }
      }

      .index-notice-right {
        padding-right: 28rpx;

        .index-notice-right-title {
          padding-top: 26rpx;
          padding-bottom: 6rpx;
          font-size: 26rpx;
          font-weight: 500;
          line-height: 36rpx;
          color: #333;
        }

        .index-notice-right-describe {
          padding-bottom: 24rpx;
          font-size: 22rpx;
          font-weight: 400;
          line-height: 30rpx;
          color: #999;
        }
      }
    }

    .index-tab-box {
      position: relative;
      width: calc(100vw - 56rpx);
      margin-top: 20rpx;

      .index-tab-address {
        position: absolute;
        top: 24rpx;
        right: 28rpx;
        display: flex;
        align-items: center;
        font-size: 24rpx;
        color: $uni-color-primary;

        .index-tab-address-image {
          width: 18rpx;
          height: 22rpx;
          margin-right: 8rpx;
        }
      }

      .index-tab-tab {
        :deep(.wd-tabs__nav-container) {
          width: 60%;
        }
      }

      .index-tab-content {
        display: flex;
        padding: 8rpx 0 28rpx 10rpx;

        .index-tab-content-item {
          padding: 0 24rpx;
          margin: 0 14rpx;
          font-size: 24rpx;
          font-weight: 500;
          line-height: 52rpx;
          color: #666;
          background: #f5f5f9;
          border-radius: 32rpx;

          &.active {
            color: $uni-color-primary;
            background: #fff4e3;
          }
        }
      }
    }

    .reload-box {
      display: flex;
      justify-content: center;
      padding: 18rpx 0 16rpx;
      margin-top: 20rpx;
      font-size: 24rpx;
      line-height: 28rpx;
      color: $uni-color-primary;
      background: #fff;
      border-radius: 16rpx;
      box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

      .reload-image-box {
        width: 27rpx;
        height: 28rpx;
        margin-right: 12rpx;

        .reload-image {
          display: block;
          width: 27rpx;
          height: 28rpx;
        }
      }
    }

    .list-container {
      padding-bottom: 136rpx;

      .list-box-wrapper {
        position: relative;

        .list-box-right-delete {
          position: absolute;
          top: 14rpx;
          right: 28rpx;
          z-index: 2;
          font-size: 24rpx;
          line-height: 42rpx;
          color: $uni-color-primary;
          text-align: right;
        }
      }

      .list-box {
        display: flex;
        margin-top: 20rpx;
        background: #fff;
        border-radius: 16rpx;
        box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

        &.list-box-disabled {
          opacity: 0.5;
        }

        .list-box-left {
          width: 220rpx;
          height: 220rpx;
          margin-right: 20rpx;

          .list-box-left-image {
            display: block;
            width: 220rpx;
            height: 220rpx;
          }
        }

        .list-box-right {
          position: relative;
          flex: 1;
          padding-right: 28rpx;

          .list-box-right-title {
            padding: 14rpx 0 6rpx;
            font-size: 30rpx;
            line-height: 42rpx;
            color: #333;

            &.list-box-right-title-pr {
              padding-right: 70rpx;
            }
          }

          .list-box-right-tag {
            display: flex;
            font-size: 22rpx;
            font-weight: 400;
            color: #666;
          }

          .list-box-right-content {
            position: absolute;
            bottom: 14rpx;
            left: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: calc(100% - 28rpx);

            .list-box-right-price {
              font-size: 26rpx;
              font-weight: 500;
              color: #f94a66;
            }

            .list-box-right-type {
              font-size: 24rpx;
              line-height: 24rpx;
              color: #666;
            }
          }
        }
      }
    }
  }
}
</style>
