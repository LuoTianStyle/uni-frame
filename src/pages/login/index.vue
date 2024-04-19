<route lang="json5" type="page">
{
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '登录',
  },
}
</route>

<template>
  <view class="login-page-container">
    <view class="login-page-inner">
      <view class="logo-container">
        <image class="logo-image" src="/static/images/logo.png" />
      </view>
      <wd-form class="login-form" ref="form" :model="loginInfo">
        <wd-cell-group border>
          <wd-input
            class="login-input"
            prop="username"
            size="large"
            clearable
            v-model="loginInfo.username"
            placeholder="请输入账号/手机号"
          />
          <wd-input
            class="login-input m-t-4"
            prop="password"
            size="large"
            show-password
            clearable
            v-model="loginInfo.password"
            placeholder="请输入密码"
          />
        </wd-cell-group>
        <wd-checkbox
          class="text-left login-check"
          :modelValue="agree"
          shape="square"
          @change="agreeChange"
        >
          <text class="file-text">我已阅读并同意</text>
          <text class="file-text file-active">《用户协议》</text>
          <text class="file-text">和</text>
          <text class="file-text file-active">《隐私政策》</text>
        </wd-checkbox>
        <view class="m-t-6">
          <wd-button
            :disabled="!loginInfo.username || !loginInfo.password || !agree"
            type="primary"
            size="large"
            :round="false"
            @click="login"
            block
          >
            登录
          </wd-button>
        </view>
      </wd-form>
      <view class="register" @click="linkTo()">立即注册</view>
      <view class="wechat-container">
        <image class="wechat-image" src="/static/images/wechat.png" />
      </view>
    </view>
  </view>
</template>

//
<script lang="ts" setup>
// import { currRoute } from '@/utils'

// import { useUserStore } from '@/store'

// const userStore = useUserStore()
// const login = () => {
//   userStore.setUserInfo({ nickname: '菲鸽', avatar: '', token: 'abcdef' })
//   const { query } = currRoute()
//   uni.redirectTo({ url: query.redirect })
// }

// onLoad((opt) => {
//   console.log('login onLoad', opt)
// })
//
// const { success: showSuccess } = useToast()
const agree = ref<boolean>(true)

function agreeChange({ value }) {
  agree.value = value
}

const loginInfo = reactive<{
  username: string
  password: string
}>({
  username: '',
  password: '',
})

const form = ref()

const login = () => {
  //   uni.showToast({
  //     title: '用户名或者密码错误',
  //     image: '/src/static/images/wechat.png',
  //   })
  uni.switchTab({ url: '/pages/index/index' })
}
const linkTo = () => uni.navigateTo({ url: '/pages/register/index' })
</script>

<style lang="scss" scoped>
.login-page-container {
  display: flex;
  align-items: center;
  height: 100%;
  padding: 0 70rpx;
  text-align: center;

  .login-page-inner {
    flex: 1;

    .logo-container {
      width: 190rpx;
      height: 190rpx;
      margin: 0 auto;

      .logo-image {
        width: 100%;
        height: 100%;
      }
    }

    .login-form {
      margin-top: 60rpx;

      .login-input {
        padding: 20rpx 34rpx;
        background: #f6f6f6;
        border-radius: 4rpx;

        &::after {
          display: none;
        }

        :deep(.wd-input__icon) {
          background: transparent;
        }

        :deep(.wd-input__clear) {
          background: transparent;
        }
      }

      .login-check {
        display: flex;
        align-items: center;
        height: 34rpx;
        margin: 26rpx 0 70rpx;

        .file-text {
          font-size: 24rpx;
          color: #999;
        }

        .file-active {
          color: $uni-color-primary;
          cursor: pointer;
        }
      }
    }

    .register {
      height: 40rpx;
      margin-top: 34rpx;
      font-size: 28rpx;
      color: $uni-color-primary;
      cursor: pointer;
    }

    .wechat-container {
      width: 88rpx;
      height: 88rpx;
      margin: 274rpx auto 0;

      .wechat-image {
        width: 100%;
        height: 100%;
      }
    }
  }
}
</style>
