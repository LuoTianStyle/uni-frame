<route lang="json5" type="page">
{
  layout: 'base',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '注册',
  },
}
</route>

<template>
  <view class="register-page-container">
    <view class="bg-container">
      <image class="bg-image" src="/static/images/register.png" />
    </view>
    <view class="back-icon">
      <wd-icon name="arrow-left" size="48rpx" @click="linTo" />
    </view>
    <view class="register-page">
      <wd-form ref="form" :model="registerInfo">
        <view class="register-page-inner">
          <view class="welcome">欢迎注册递道供货</view>
          <wd-card class="register-card" style="margin-bottom: 28rpx" title="注册信息">
            <wd-cell-group border>
              <wd-input
                size="large"
                label="账号"
                label-width="200rpx"
                prop="account"
                clearable
                v-model="registerInfo.account"
                placeholder="请输入登录账号"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入登录账号' }]"
              />
              <wd-input
                size="large"
                label="密码"
                label-width="200rpx"
                prop="password"
                clearable
                v-model="registerInfo.password"
                placeholder="请输入密码"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入密码' }]"
              />
              <wd-input
                size="large"
                label="手机号"
                label-width="200rpx"
                prop="phone"
                clearable
                v-model="registerInfo.phone"
                placeholder="请输入绑定手机号"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入绑定手机号' }]"
              />
            </wd-cell-group>
          </wd-card>
        </view>
        <view class="register-page-inner register-page-bg">
          <wd-card class="register-card" style="margin-bottom: 26rpx" title="认证信息">
            <wd-cell-group border>
              <wd-picker
                label="供应商类型"
                label-width="200rpx"
                prop="supplierType"
                v-model="registerInfo.supplierType"
                :columns="supplierTypeList"
                placeholder="请选择供应商类型"
              />
              <wd-cell
                class="sole-up"
                vertical
                style="padding-left: 14rpx"
                title="门头图片"
                prop="img"
              >
                <wd-upload
                  :file-list="registerInfo.img"
                  action="https://ftf.jd.com/api/uploadImg"
                  @change="({ e }) => (registerInfo.img = e)"
                  :limit="1"
                >
                  <view class="register-banner">
                    <image class="upload-image" src="/static/images/upload.png" />
                  </view>
                </wd-upload>
              </wd-cell>
              <wd-picker
                label="注册类型"
                label-width="200rpx"
                prop="registerType"
                v-model="registerInfo.registerType"
                :columns="registerTypeList"
                placeholder="请选择注册类型"
              />
              <view class="idcard-container" v-if="registerInfo.registerType == '1'">
                <wd-cell
                  class="idcard-wrapper border-full"
                  vertical
                  style="padding-left: 14rpx"
                  prop="idcard"
                >
                  <wd-upload
                    :file-list="registerInfo.idcard"
                    action="https://ftf.jd.com/api/uploadImg"
                    @change="({ e }) => (registerInfo.idcard = e)"
                    :limit="1"
                  >
                    <view class="register-double-up">
                      <image class="upload-image" src="/static/images/idcard.png" />
                    </view>
                  </wd-upload>
                </wd-cell>
                <wd-cell class="idcard-wrapper" vertical style="padding-left: 0" prop="idcardBack">
                  <wd-upload
                    :file-list="registerInfo.idcardBack"
                    action="https://ftf.jd.com/api/uploadImg"
                    @change="({ e }) => (registerInfo.idcardBack = e)"
                    :limit="1"
                  >
                    <view class="register-double-up">
                      <image class="upload-image" src="/static/images/idcard1.png" />
                    </view>
                  </wd-upload>
                </wd-cell>
              </view>

              <wd-cell
                v-else
                class="idcard-wrapper"
                vertical
                style="padding-left: 14rpx"
                prop="business"
              >
                <wd-upload
                  :file-list="registerInfo.business"
                  action="https://ftf.jd.com/api/uploadImg"
                  @change="({ e }) => (registerInfo.business = e)"
                  :limit="1"
                >
                  <view class="register-double-up">
                    <image class="upload-image" src="/static/images/business.png" />
                  </view>
                </wd-upload>
              </wd-cell>
              <wd-input
                size="large"
                :label="registerInfo.registerType == '1' ? '个人姓名' : '企业姓名'"
                label-width="200rpx"
                prop="operators"
                clearable
                v-model="registerInfo.operators"
                :placeholder="`请输入${registerInfo.registerType == '1' ? '个人姓名' : '企业姓名'}`"
                :rules="[
                  {
                    required: false,
                    pattern: /\d{6}/,
                    message: `请输入${registerInfo.registerType == '1' ? '个人姓名' : '企业姓名'}`,
                  },
                ]"
              />
              <wd-input
                size="large"
                label="联系人姓名"
                label-width="200rpx"
                prop="connectUserName"
                clearable
                v-model="registerInfo.connectUserName"
                placeholder="请输入密码"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入联系人姓名' }]"
              />

              <wd-input
                size="large"
                label="联系人手机号"
                label-width="200rpx"
                prop="connectUserPhone"
                clearable
                v-model="registerInfo.connectUserPhone"
                placeholder="请输入联系人手机号"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入联系人手机号' }]"
              />
              <wd-input
                size="large"
                label="经营场所"
                label-width="200rpx"
                prop="businessPremises"
                clearable
                v-model="registerInfo.businessPremises"
                placeholder="请输入经营场所"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入经营场所' }]"
              />
              <wd-input
                size="large"
                label="经营范围"
                label-width="200rpx"
                prop="businessScope"
                clearable
                v-model="registerInfo.businessScope"
                placeholder="请输入经营范围"
                :rules="[{ required: false, pattern: /\d{6}/, message: '请输入经营范围' }]"
              />
            </wd-cell-group>
          </wd-card>
          <wd-checkbox
            class="text-left register-check"
            :modelValue="agree"
            shape="square"
            @change="agreeChange"
          >
            <text class="file-text">我已阅读并同意</text>
            <text class="file-text file-active">《用户协议》</text>
            <text class="file-text">和</text>
            <text class="file-text file-active">《隐私政策》</text>
          </wd-checkbox>
        </view>
      </wd-form>
      <view class="register-button-wrapper">
        <wd-button
          style="height: 88rpx"
          :disabled="true"
          type="primary"
          size="large"
          :round="false"
          block
        >
          提交审核
        </wd-button>
      </view>
    </view>
  </view>
</template>

<script lang="ts" setup>
const linTo = () => uni.navigateTo({ url: '/pages/login/index' })
const registerInfo = reactive<{
  account: string
  password: string
  phone: string
  supplierType: string
  img: any[]
  idcard: any[]
  idcardBack: any[]
  business: any[]
  registerType: string
  operators: string
  connectUserName: string
  connectUserPhone: string
  businessPremises: string
  businessScope: string
}>({
  account: '',
  password: '',
  phone: '',
  supplierType: '',
  img: [],
  idcard: [],
  idcardBack: [],
  business: [],
  registerType: '1',
  operators: '',
  connectUserName: '',
  connectUserPhone: '',
  businessPremises: '',
  businessScope: '',
})

const form = ref()
const supplierTypeList = ref<any>([
  {
    value: '1',
    label: '类型1',
  },
  {
    value: '2',
    label: '类型2',
  },
])
const registerTypeList = ref<any>([
  {
    value: '1',
    label: '身份证认证',
  },
  {
    value: '2',
    label: '营业执照认证',
  },
])

const agree = ref<boolean>(true)

function agreeChange({ value }) {
  agree.value = value
}
</script>

<style lang="scss" scoped>
.register-page-container {
  position: relative;
  min-height: 100%;
  background: $uni-bg-color-grey;

  .bg-container {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 520rpx;

    .bg-image {
      width: 100%;
      height: 100%;
    }
  }

  .back-icon {
    position: absolute;
    top: 80rpx;
    left: 0;
    z-index: 2;
    padding: 24rpx 28rpx 16rpx;
  }

  .register-page {
    position: absolute;
    top: 168rpx;
    left: 0;
    z-index: 3;
    width: 100%;

    .register-page-inner {
      width: calc(100% - 56rpx);
      padding: 0 28rpx;

      &.register-page-bg {
        background: $uni-bg-color-grey;
      }

      .welcome {
        padding: 30rpx 0 34rpx 20rpx;
        font-size: 44rpx;
      }

      .register-card {
        :deep(.wd-card__footer) {
          display: none;
        }
      }

      .register-banner {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 638rpx;
        height: 260rpx;
        background: #f6f6f6;
        border-radius: 8rpx;

        .upload-image {
          width: 172rpx;
          height: 40rpx;
        }
      }

      .sole-up {
        :deep(.wd-upload__preview) {
          width: 638rpx;
          height: 260rpx;
          margin: 0;
        }

        :deep(.wd-icon-error-fill) {
          width: 40rpx;
          height: 40rpx;
          font-size: 40rpx;
        }
      }

      .register-double-up {
        width: 312rpx;
        height: 196rpx;

        .upload-image {
          width: 312rpx;
          height: 196rpx;
        }
      }

      .idcard-container {
        display: flex;
        align-items: center;
        justify-content: space-between;

        .border-full {
          :deep(.wd-cell__wrapper) {
            &::after {
              z-index: 2;
              width: calc(100% + 16rpx) !important;
            }
          }
        }
      }

      .idcard-wrapper {
        :deep(.wd-cell__right) {
          margin-top: 0;
        }

        :deep(.wd-upload__preview) {
          width: 312rpx;
          height: 196rpx;
          margin: 0;
        }

        :deep(.wd-icon-error-fill) {
          width: 34rpx;
          height: 34rpx;
          font-size: 34rpx;
        }
      }

      .register-check {
        display: flex;
        align-items: center;
        height: 34rpx;
        padding: 0 0 44rpx 26rpx;

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

    .register-button-wrapper {
      box-sizing: border-box;
      width: 100%;
      height: 120rpx;
      padding: 16rpx;
      text-align: center;
      background: #fff;
      box-shadow: 0 -12rpx 20rpx 2rpx rgb(233 237 250 / 50%);
    }
  }
}
</style>
