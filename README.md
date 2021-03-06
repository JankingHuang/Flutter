# 项目结构
* 可以使用flutter-pro-cli 生成目录结构。

# 组件Widget
## 常用组件
* Text： 文本显示组件
* Image： 图片显示组件
* Icon： Icon库，一些小图标
* FlatButton：包含点击动作的组件
* Row：布局组件，水平布局
* Column：布局组件，垂直布局
* Container：布局组件，容器组件，类似于前端body
* Expanded： 可以按比例 扩展，Row、Column 和 Flex子组件占用，类似于雨权重。
* Padding：可填充空白区域组件，就是一个内边距。
* ClipRRect： 圆角组件。
## 无状态组件
* 外部传入的数据化转化为界面展示的内容，只会渲染一次
## 有状态组件
* 定义交互逻辑和业务逻辑
* 具有动态可交互的内容界面，会根据数据的变化进行多次渲染

### 生命周期

## 组件组合
* 动态组件下的字组件过多，组件更新的时候，其子组件会全部更新，从而引发性能问题。
* 尽可能减少动态组件下静态组件。
* 数据来源相同的部分组件和为同一组件。
* 使用行或者列作为合并的条件。
* 功能相同的部分，转化为基础组件。
* 合并后根节点多的为Container。

## 组件设计
* 标记界面元素
* 记录组件名称，及其动态数据。
* 合并组件，将功能一致的组件合并。
* 创建组件树，并优化该树。

# Scheme
## 内部跳转
* 一种APP内跳转协议。
* 通过Scheme协议在APP内实现一些页面的相互跳转。

`
[scheme]://[host][path]?[query]
`

## 外部跳转
* 使用uni_links第三方库协助。
* 外部跳转需要，根据平台的不同而配置。
* 大部分APP内部Scheme时被禁用的，因此用户体验差。
* 注册的Scheme相同导致冲突。

## 其他
* 可使用APP Links 和Univerial Link。



# 动画
## Animation
* 监听动画每一帧以及执行状态的变化。
* addListener(), 添加帧监听器，每一帧都会被调用。
* addStatusListener(),添加动画状态改变监听器，开始、结束、正向、反向都会触发。
## Curve
* 描述动画过程，是匀速、匀加速等，匀速动画称为线性的（Curves.linear)，而非匀速称为非线性的。
* 使用CurvedAnimation 指定动画曲线。
## Controller
* AnimationController, 用于控制动画，启动forward()、停止stop()、反向播放reverse()等。
* AnimationController, 会在动画的每一帧，就会生成一个新的值。默认区间[0.0,1.0]，可以通过lowerBound和upperBound来指定。
* AnimationController派生自Animation<double>。
* 动画开始执行后，开始生成当前动画帧，屏幕每刷新一次就是一个动画帧。每一帧根据动画曲线来生成当前的动画值（Animation.value)。再根据动画构建UI。
## Tween
* 定义从输入范围到输出范围的映射。
* 继承自Animatable<T>。




# 事件循环机制
## Dart单线程
### 微任务队列
* 执行过程会产生新的事件任务，插入到事件任务队列
### 事件队列
* 执行过程也会产生新的微任务,插入到微任务队列

任务执行完成后会先检查微任务队列，有就执行，没有就检查事件队列。


# 状态选型对比
## InheritedWidget
* 提升到根节点，InheritedWidget 会判判断状态是否更新，以及会判断子组件是否有依赖；
* 状态变化时，如果未使用该状态组件，则不会发生build。
* 使用了该状态组件，如果组件的状态没有发生变化，也不会发build。
## Redux
* 单向数据流框架，第三方库，需要修改依赖。
* 将所有的状态存储在store中，所有数据改变都是通过Action。
* 然后Action触发Store存储，store变化触发所有应用的build操作。
## Provider
* 官方推荐
### 使用步骤
* 创建状态管理类name_model。
* 在name_game中增加provider的支持。
* 在子组件中获取provider的name数据以及changeName方法。

# 事件处理
## 触摸事件
* Listener 来监听原始触发事件。
 
### 命中测试（Hit test）
* 手指按下，触发PointerDownEvent事件，按照DFS遍历渲染树（render object),
* 对一每一个渲染对象进行命中测试（hit test），测试通过，则该渲染对象会被添加到HitTestResult列表中。

### 事件分发（Event dispatch）
* 测试完成后，会遍历HitTesResult列表，调用渲染对象的方法（handleEvent）来处理PointerDownEvent事件
* 手指移动时，便会分发PointerMoveEvent事件。

### 事件清理
* 当手指抬起（PointerUpEvent）或者取消（PointerCancelEvent），会先对相应对事件进行分发，
  分发完毕后清空HitTestResult列表
# 手势识别
* 手势系统有两个独立层。
* * 第一层为原始指针（Pointer）事件，用于描述屏幕指针的移动位置。
* * 第二层为手势，描述由一个或多个指针移动组成的语义动作（拖拽、缩放、双击等）。
* GestureDetector 用于手势识别的功能性组件,内部使用一个或多个GestureDetector来识别各种手势。
* GestureRecognizer 指针事件的语义化封装，通过Listener将原始指针事件转化为语义手势。
## 手势冲突
* Flutter 手势识别引入Arena概念。
* 每一个手势识别器（GestureRecognizer）都是一个竞争者（GestureArenaMember)。

# Isolate 多线程
* 利用消息机制实现多线程。




