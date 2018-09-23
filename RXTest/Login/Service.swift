//
//  Service.swift
//  RXTest
//
//  Created by mini on 2018/9/1.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ValidationService: NSObject {
    static let instance = ValidationService()
    private override init() {}
    
    let pswMax = 16
    let pswMin = 8
    let nameMax = 11
    let nameMin = 6
    
    func loginUsernameValid(_ username: String) ->Observable<TFResult> {
        if username.count == 0 {
            return .just(.empty)
        }
        
        if(username.count < nameMin) {
            return .just(.failed(error: "用户名至少\(nameMin)个字符"))
        }
        
        if(username.count > 11) {
            return .just(.failed(error: "用户名不得多于\(nameMax)个字符"))
        }
        
        return .just(.success)
    }
    
    
    func passwordvValidate(_ password: String) ->TFResult {
        
        if(password.count < pswMin  || password.count > pswMax) {
            
            return .failed(error: "密码长度为\(pswMin)-\(pswMax)位")
        }
        
        return .success
    }
    
    func login(_ username: String, password: String) ->Observable<TFResult> {
        
        if password != "123" {
            
            return .just(.failed(error: "用户名或者密码有误"))
        }
        return .just(.success)
    }
    

}
