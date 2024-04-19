<h1 align="center">
  <a href="https://github.com/codercup/unibest" target="_blank">unibest - 最好的 uniapp 跨端解决方案</a>
</h1>

<h1 align="center">
  <a href="https://wot-design-uni.gitee.io" target="_blank">Wot Design Uni - 高颜值、轻量化的uni-app组件库</a>
</h1>

`unibest` 是一个 uniapp 跨端解决方案，由 `uniapp` + `Vue3` + `Ts` + `Vite4` + `UnoCss` + `VSCode`(可选 `webstorm`) 实现。它使用了最新的前端技术栈，无需依靠 `HBuilderX`，通过命令行方式运行 `web`、`小程序` 和 `App`。

`unibest` 内置了 `约定式路由`、`layout布局`、`请求封装`、`请求拦截`、`登录拦截`、`UnoCSS`、`i18n多语言` 等基础功能，提供了 `代码提示`、`自动格式化`、`统一配置`、`代码片段` 等辅助功能，让你编写 `uniapp` 拥有 `best` 体验 （ `unibest 的由来`）。

<p align="center">
<a href="https://cn.vuejs.org/" target="_blank">
      <img src="https://img.shields.io/badge/-Vue3-34495e?logo=vue.js" />
  </a>
  <a href="https://cn.vitejs.dev/" target="_blank">
      <img src="https://img.shields.io/badge/-Vite4-646cff?logo=vite&logoColor=white" />
  </a>
  <a href="https://www.typescriptlang.org/zh/" target="_blank">
      <img src="https://img.shields.io/badge/-TypeScript5-blue?logo=typescript&logoColor=white" />
  </a>
  <a href="https://eslint.org/" target="_blank">
      <img src="https://img.shields.io/badge/-ESLint8-4b32c3?logo=eslint&logoColor=white" />
  </a>
  <a href="https://stylelint.io/" target="_blank">
      <img src="https://img.shields.io/badge/-StyleLint16-4b32c3?logo=stylelint&logoColor=white" />
  </a>
  <a href="https://pnpm.io/" target="_blank">
      <img src="https://img.shields.io/badge/-pnpm8-F69220?logo=pnpm&logoColor=white" />
  </a>
  <a href="https://unocss.dev/" target="_blank">
      <img src="https://img.shields.io/badge/-UnoCSS-4d4d4d?logo=unocss" />
  </a>
  <a href="https://icones.js.org/" target="_blank">
      <img src="https://img.shields.io/badge/-icones-1769aa?logo=Iconify" />
  </a>
  <a href="https://ext.dcloud.net.cn/plugin?id=8559" target="_blank">
      <img src="https://svg.hamm.cn/badge.svg?key=Platform&value=uni-app"/>
  </a>
  </p>

## ⚙️ 环境

- node>=18
- pnpm>=7.30

## &#x1F4C2; 安装

执行 `pnpm i` 安装依赖

## 📦 运行（支持热更新）

- web平台： `pnpm dev:h5`, 然后打开 [http://localhost:9001/](http://localhost:9001/)。
- weixin平台：`pnpm dev:mp-weixin` 然后打开微信开发者工具，导入本地文件夹，选择本项目的`dist/dev/mp-weixin` 文件。
- APP平台：`pnpm dev:app`, 然后打开 `HBuilderX`，导入刚刚生成的`dist/dev/app` 文件夹，选择运行到模拟器(开发时优先使用)，或者运行的安卓/ios基座。

## 🔗 发布

- web平台： `pnpm build:h5`，打包后的文件在 `dist/build/h5`，可以放到web服务器，如nginx运行。如果最终不是放在根目录，可以在 `manifest.config.ts` 文件的 `h5.router.base` 属性进行修改。
- weixin平台：`pnpm build:mp-weixin`, 打包后的文件在 `dist/build/mp-weixin`，然后通过微信开发者工具导入，并点击右上角的“上传”按钮进行上传。
- APP平台：`pnpm build:app`, 然后打开 `HBuilderX`，导入刚刚生成的`dist/build/app` 文件夹，选择发行 - APP云打包。

## 打包注意事项

本模板使用的是 `3.8.12` 的库版本(`"@dcloudio/uni-app": "3.0.0-3081220230817001",`)，所以尽量使用 `3.8.12` 版本的 `HBuilderX` 来打包，否则可能有未知的风险，出现情况如下图。

点击 `ignore` 后可以正常使用，万一以后出现什么特殊情况，记得看看是不是版本问题。
