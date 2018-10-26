//
//  DefaultImplementations.swift
//  RXTest
//
//  Created by mini on 2018/10/12.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift

class RegisterDefaultValidationService: RegisterValidationService {
    
    
    let minPswCount = 8
    let maxPswCount = 16
    
    static let service = RegisterDefaultValidationService()
    
    let api = RetisterDefaultAPI.api
    
    func validateUsername(_ username: String) -> Observable<ValidationResult> {
        
        
        if username.isEmpty {
            return .just(.failed(message: "用户名不能为空"))
        }
        
        if username.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted)  != nil {
            
            return .just(.failed(message: "内容只能包含数字和字母"))
        }
        
        return api.usernameAvailabel(username)
            .map({ available  in
                
                if available {
                    return .ok(message:"用户名可用")
                }else{
                    return .failed(message: "用户名已经存在")
                }
        })
    }
    
    func validatePassword(_ password: String) -> ValidationResult {
        let pswCount = password.count
        
        if(pswCount < minPswCount  || pswCount > maxPswCount) {
            
            return .failed(message: "密码应为 8 -16 个字符")
        }
        
        return .ok(message: "密码可用")
    }
    
    func validateRepeatedPassword(_ password: String, _ repeatedPassword: String) -> ValidationResult {
        let pswCount = repeatedPassword.count
        
        if(pswCount < minPswCount  || pswCount > maxPswCount) {
            
            return .failed(message: "密码应为 8 -16 个字符")
        }
        
        if repeatedPassword == password {
            
            return .ok(message: "")
        }else{
            
            return .failed(message: "两次密码不一样")
        }
    }

}



class RetisterDefaultAPI: RegisterAPI {
    
    static let api = RetisterDefaultAPI()

    func usernameAvailabel(_ username: String) -> Observable<Bool> {
        let availabel = arc4random() % 7 == 0 ? false : true
        return .just(availabel)
        
    }
    
    func singup(_ username: String, password: String) -> Observable<Bool> {
         let signupResult = arc4random() % 2 == 0 ? false : true
        
        return .just(signupResult)
    }
    
    
}
