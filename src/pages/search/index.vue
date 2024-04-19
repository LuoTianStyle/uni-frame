<route lang="json5" type="page">
{
  layout: 'base',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '搜索',
  },
}
</route>

<template>
  <view class="search-page-container">
    <!-- <view class="back-icon">
      <wd-icon name="arrow-left" size="48rpx" @click="linTo" />
    </view> -->
    <view class="search-page">
      <wd-sticky>
        <wd-search
          class="search-input"
          v-model="searchInfo.value"
          @search="search"
          @change="change"
          @clear="clear"
          hide-cancel
        />
      </wd-sticky>

      <view v-if="searchInfo.value" class="search-box">
        <view
          class="search-item"
          :style="{ borderTop: index ? '2rpx solid #ECF0F9' : 'none' }"
          v-for="(item, index) in searchInfo.list"
          :key="item.id"
        >
          {{ item.name }}
        </view>
      </view>
      <view v-if="!searchInfo.value && searchInfo.history.length" class="history-box">
        <view class="history-header">
          <view class="">历史记录</view>
          <view class="history-delete-box" @click="deleteHandle">
            <image class="history-delete" src="/static/images/delete.png" />
          </view>
        </view>
        <view class="history-content">
          <view class="history-item" v-for="item in searchInfo.history" :key="item.id">
            {{ item.name }}
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script lang="ts" setup>
// const linTo = () => uni.navigateTo({ url: '/pages/login/index' })

const search = () => {
  console.log(searchInfo.value)
}
const clear = () => {
  searchInfo.value = ''
}
const change = (e: { value: any }) => {
  searchInfo.value = e.value
}

const searchInfo = reactive<{
  value: string
  list: any[]
  history: any[]
}>({
  value: '',
  history: [
    {
      id: 1,
      name: '草莓34斤/箱',
    },
    {
      id: 2,
      name: '草莓草莓34斤/箱',
    },
    {
      id: 3,
      name: '草莓草莓3斤/箱',
    },
    {
      id: 4,
      name: '草莓',
    },
    {
      id: 5,
      name: 'aaa',
    },
    {
      id: 6,
      name: 'bbb',
    },
    {
      id: 7,
      name: 'aaa',
    },
    {
      id: 8,
      name: 'bbb',
    },
  ],
  list: [
    {
      id: 1,
      name: 'aaa',
    },
    {
      id: 2,
      name: 'bbb',
    },
    {
      id: 3,
      name: 'aaa',
    },
    {
      id: 4,
      name: 'bbb',
    },
    {
      id: 5,
      name: 'aaa',
    },
    {
      id: 6,
      name: 'bbb',
    },
    {
      id: 7,
      name: 'aaa',
    },
    {
      id: 8,
      name: 'bbb',
    },
  ],
})
const deleteHandle = () => {
  uni.showModal({
    content: '确认删除全部历史记录？',
    success(res) {
      if (res.confirm) {
        searchInfo.history = []
        console.log('用户点击确定')
      } else if (res.cancel) {
        console.log('用户点击取消')
      }
    },
  })
}
</script>

<style lang="scss" scoped>
.search-page-container {
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

  .back-icon {
    position: absolute;
    top: 80rpx;
    left: 0;
    z-index: 2;
    padding: 24rpx 28rpx 16rpx;
  }

  .search-page {
    position: relative;
    z-index: 2;

    .search-input {
      box-sizing: border-box;
      width: 100vw !important;
      height: 86rpx !important;
      padding: 0 28rpx !important;
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

    .search-box {
      padding: 0 28rpx !important;
      margin: 114rpx 28rpx 0;
      background: #fff;
      border-radius: 8rpx;
      box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

      .search-item {
        padding: 0 26rpx 0 28rpx;
        line-height: 102rpx;
      }
    }

    .history-box {
      padding: 0 14rpx 18rpx !important;
      margin: 114rpx 28rpx 0;
      background: #fff;
      border-radius: 8rpx;
      box-shadow: 0 16rpx 40rpx 2rpx rgb(100 80 52 / 6%);

      .history-header {
        box-sizing: border-box;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 22rpx 0 18rpx 12rpx;
        font-size: 26rpx;
        font-weight: 500;
        line-height: 26rpx;

        .history-delete-box {
          width: 25rpx;
          height: 28rpx;

          .history-delete {
            width: 25rpx;
            height: 28rpx;
            cursor: pointer;
          }
        }
      }

      .history-content {
        display: flex;
        flex-wrap: wrap;
        align-items: center;

        .history-item {
          box-sizing: border-box;
          height: 48rpx;
          padding: 0 10rpx 0 12rpx;
          margin: 6rpx 12rpx;
          font-size: 26rpx;
          line-height: 48rpx;
          color: #666;
          cursor: pointer;
          background: #f5f5f5;
          border-radius: 4rpx;
        }
      }
    }
  }
}
</style>
