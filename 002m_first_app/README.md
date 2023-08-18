# first_app2p

增加侧边栏；

## 准备工作

创建样板工程`flutter create`
添加依赖库
`flutter pub add english_words provider`
复制代码

## 将现有界面提取为独立Widget

将Scaffold的body参数：Center，通过重构，提取为一个新的widget:GeneratorPage。

## 在HomePage增加侧边栏

侧边栏和原界面放到一个row内；侧边栏本身包含2个目标区；原界面通过Expanded占据屏幕剩余空间。

