//
//  LoginViewModel.swift
//  RXTest
//
//  Created by mini on 2018/9/1.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {

    let username = Variable<String>("")
    let password = Variable<String>("")
    let loginTaps = PublishSubject<Void>()
    
    let userNameAble: Observable<TFResult>
    //let passWordAble: Observable<TFResult>
    //let loginButtonAabel: Observable<Bool>
    //let loginResult: Observable<TFResult>
    
    init() {
        let service = ValidationService.instance
        
        userNameAble = username.asObservable()
            .flatMapLatest{ username in
                return service.loginUsernameValid(username)
                    .observeOn(MainScheduler.instance)
                    .catchErrorJustReturn(.failed(error: "username检测出错"))
            }
            .share(replay: 1)


    }
    
}






























