# RXSwift-Demo
一 、RXSwift 学习资料

* RxSwift 中文文档

1. https://beeth0ven.github.io/RxSwift-Chinese-Documentation/

* RxSwift 学习Git地址

1. https://github.com/jhw-dev/RxSwift-CN

二、  RXSwift 关键词理解

#### Observer - 观察者
观察者 是用来监听事件，然后它需要这个事件做出响应。例如：弹出提示框就是观察者，它对点击按钮这个事件做出响应。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observer.html

#### Observable - 可被监听的序列

所有的事物都是序列,Observable 可以用于描述元素异步产生的序列。这样我们生活中许多事物都可以通过它来表示

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/rxswift_core/observable.html

#### filter 

仅仅发出 Observable 中通过判定的元素, 操作符将通过提供的判定方法过滤一个 Observable

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/filter.html

#### flatMap

将 Observable 的元素转换成其他的 Observable，然后将这些 Observables 合并

flatMap 操作符将源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。 然后将这些 Observables 的元素合并之后再发送出来。

这个操作符是非常有用的，例如，当 Observable 的元素本身拥有其他的 Observable 时，你可以将所有子 Observables 的元素发送出来。

https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/decision_tree/flatMap.html
