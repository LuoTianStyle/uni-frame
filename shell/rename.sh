# pnpm build:app 之后会生成 unpackage/dist/build/app
# 我要把它改名为 unpackage/dist/build/dd_app_build

# 只有存在新的 app 文件时，才执行这些操作！！否则会误删！！
if test -d ./dist/build/app; then
    echo '存在新打包出来的app'

    cd ./dist/build/

    # 1、删除旧的 rename 后的文件夹
    if test -d './dd_app_build'; then
        rm -rf ./dd_app_build
    fi

    # 2、把 app 命名为 dd_app_build
    mv ./app ./dd_app_build
fi
