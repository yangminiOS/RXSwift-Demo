# RXSwift-Demo
一 、RXSwift 学习资料

* RxSwift 中文文档

1. https://beeth0ven.github.io/RxSwift-Chinese-Documentation/

* RxSwift 学习Git地址

1. https://github.com/jhw-dev/RxSwift-CN

二、  RXSwift 关键词理解

#### Variable

在 Swift 中我们经常会用 var 关键字来声明变量。RxSwift 提供的 Variable 实际上是 var 的 Rx 版本，你可以将它看作是 RxVar

第一种使用 var 的方式十分常见，在 ViewController 中监听 Model 的变化，然后刷新页面。

第二种使用 Variable 则是 RxSwift 独有的。Variable 几乎提供了 var 的所有功能。另外，加上一条非常重要的特性，就是可以通过调用 asObservable() 方法转换成序列。然后你可以对这个序列应用操作符，来合成其他的序列。所以，如果我们声明的变量需要提供 Rx 支持，那就选用 Variable 这个类型。

说明
Variable 封装了一个 BehaviorSubject，所以它会持有当前值，并且 Variable 会对新的观察者发送当前值。它不会产生 error 事件。Variable 在 deinit 时，会发出一个 completed 事件。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observable_and_observer/variable.html

#### Observer - 观察者
观察者 是用来监听事件，然后它需要这个事件做出响应。例如：弹出提示框就是观察者，它对点击按钮这个事件做出响应。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observer.html

#### Observable - 可被监听的序列

所有的事物都是序列,Observable 可以用于描述元素异步产生的序列。这样我们生活中许多事物都可以通过它来表示

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observable.html

#### filter 

仅仅发出 Observable 中通过判定的元素, 操作符将通过提供的判定方法过滤一个 Observable

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/filter.html

#### Map
通过一个转换函数，将 Observable 的每个元素转换一遍
map 操作符将源 Observable 的每个元素应用你提供的转换方法，然后返回含有转换结果的 Observable

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/map.html

#### flatMap

将 Observable 的元素转换成其他的 Observable，然后将这些 Observables 合并

flatMap 操作符将源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。 然后将这些 Observables 的元素合并之后再发送出来。

这个操作符是非常有用的，例如，当 Observable 的元素本身拥有其他的 Observable 时，你可以将所有子 Observables 的元素发送出来。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/flatMap.html

#### flatMapLatest

将 Observable 的元素转换成其他的 Observable，然后取这些 Observables 中最新的一个

flatMapLatest 操作符将源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。一旦转换出一个新的 Observable，就只发出它的元素，旧的 Observables 的元素将被忽略掉。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/flatMapLatest.html

#### distinctUntilChanged

阻止 Observable 发出相同的元素

distinctUntilChanged 操作符将阻止 Observable 发出相同的元素。如果后一个元素和前一个元素是相同的，那么这个元素将不会被发出来。如果后一个元素和前一个元素不相同，那么这个元素才会被发出来。


https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/distinctUntilChanged.html

#### withLatestFrom

将两个 Observables 最新的元素通过一个函数组合起来，当第一个 Observable 发出一个元素，就将组合后的元素发送出来

withLatestFrom 操作符将两个 Observables 中最新的元素通过一个函数组合起来，然后将这个组合的结果发出来。当第一个 Observable 发出一个元素时，就立即取出第二个 Observable 中最新的元素，通过一个组合函数将两个最新的元素合并后发送出去。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/withLatestFrom.html

#### BehaviorSubject

当观察者对 BehaviorSubject 进行订阅时，它会将源 Observable 中最新的元素发送出来（如果不存在最新的元素，就发出默认元素）。然后将随后产生的元素发送出来

如果源 Observable 因为产生了一个 error 事件而中止， BehaviorSubject 就不会发出任何元素，而是将这个 error 事件发送出来

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observable_and_observer/behavior_subject.html
#### combineLatest

当多个 Observables 中任何一个发出一个元素，就发出一个元素。这个元素是由这些 Observables 中最新的元素，通过一个函数组合起来的

combineLatest 操作符将多个 Observables 中最新的元素通过一个函数组合起来，然后将这个组合的结果发出来。这些源 Observables 中任何一个发出一个元素，他都会发出一个元素（前提是，这些 Observables 曾经发出过元素）

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/combineLatest.html

#### connect 

通知 ConnectableObservable 可以开始发出元素了

ConnectableObservable 和普通的 Observable 十分相似，不过在被订阅后不会发出元素，直到 connect 操作符被应用为止。这样一来你可以等所有观察者全部订阅完成后，才发出元素。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/connect.html

#### catchError

从一个错误事件中恢复，将错误事件替换成一个备选序列

catchError 操作符将会拦截一个 error 事件，将它替换成其他的元素或者一组元素，然后传递给观察者。这样可以使得 Observable 正常结束，或者根本都不需要结束

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/catchError.html


####完成记录

1. init

2.RxSwift 部分关键词学习

3.完成登录的协议

4.协议方法的实现

5.loginVM 的实现

6. 优化RegisterVM文件

将两个 Observables 最新的元素通过一个函数组合起来，当第一个 Observable 发出一个元素，就将组合后的元素发送出来
