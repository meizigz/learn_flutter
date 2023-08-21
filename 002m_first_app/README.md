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

## 5. 实现侧边栏和主界面联动

根据侧边栏的选择，调整加载哪个主界面。
声明一个变量；根据当前选择的功能给变量赋值；将expanded中的固定child换为变量；
Placeholder用来临时占位

## 6. 实现侧边栏自适应

将Scaffold重构用Builder包裹；
修改builder为LayoutBuilder；
修改build函数，增加constraints参数；
通过constraints获取屏幕宽度，如果>=600，则侧边栏extended为true，显示文字。
改变窗口大小可以看到效果；

在flutter中1cm大概包含38逻辑像素。

## 7. 实现显示收藏的单词对

输入st，看提示，创建一个StatelessWidget；
从state获取单词对列表，然后创建ListView，用ListTile显示单词对；