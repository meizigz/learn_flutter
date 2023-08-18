# first_app2p

增加侧边栏；

## 1. 准备工作

创建样板工程`flutter create`
添加依赖库
`flutter pub add english_words provider`
复制代码

## 2. 将现有界面提取为独立Widget

将Scaffold的body参数：Center，通过重构，提取为一个新的widget:GeneratorPage。

## 3. 在HomePage增加侧边栏

侧边栏和原界面放到一个row内；侧边栏本身包含2个目标区；原界面通过Expanded占据屏幕剩余空间。

## 4. 转换Homepage为有状态组件

通过仅和此Widget相关的私有状态保存当前选择的功能，避免都塞到Provider中。

选中MyHomePage，重构，转为statefulWidget，会自动生成状态对象；

在state对象build函数外增加变量curFuncIndex，保存当前选中的功能；

修改NavigationRail的selectedIndex参数为curFuncIndex，这样就可以在NavigationRail中显示当前选中的功能了。

onDestinationSelected增加回调，通过给setState传递一个函数，在这个函数中修改状态值，并且setState触发重新build，于是UI就可以看到当前选择的变化了。

