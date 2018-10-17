//
//  RegisterViewModel.swift
//  RXTest
//
//  Created by mini on 2018/9/26.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RegisterViewModel: NSObject {
    
    
    //output
    
    let validateUsername: Observable<ValidationResult>
    
    let validatePassword: Observable<ValidationResult>
    
    let validatePasswordRepeated: Observable<ValidationResult>
    
    let signupEnable: Observable<Bool>
    
    let signedIn: Observable<Bool>
    
    //输入  --->输出
    
    init(input: (username: Observable<String>,
        password: Observable<String>,
        repeadPassword: Observable<String>,
        loginTaps: Observable<Void>),
         
         dependency: (API:RegisterAPI,
        validationService: RegisterValidationService)
         ) {
        
        let API = dependency.API
        
        let validationService = dependency.validationService
        
        
        validateUsername = input.username.flatMapLatest({ username in
            
            return validationService.validateUsername(username)
            
        }).share(replay: 1)
        
        validatePassword = input.password.map({ password in
            
            return validationService.validatePassword(password)
        }).share(replay: 1)
        
        validatePasswordRepeated = Observable.combineLatest(input.password, input.repeadPassword) {  passwd, repeatPassword in
            
                return validationService.validateRepeatedPassword(passwd, repeatPassword)
            
            }.share(replay: 1)
        
        
        signupEnable = Observable.combineLatest(validateUsername, validatePassword, validatePasswordRepeated) { (username, password, repeatPassword) in
            
            username.isValid &&
            password.isValid &&
            repeatPassword.isValid
            }.distinctUntilChanged()
            .share(replay:1)
        
        let usernameAndPassword = Observable.combineLatest(input.username, input.password){(username: $0, password: $1)}
        
        signedIn = input.loginTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest{ pair in
            
            return API.singup(pair.username, password: pair.password)
            
        }
    }
    

}
