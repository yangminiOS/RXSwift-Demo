//
//  LoginApi.swift
//  RXTest
//
//  Created by mini on 2018/9/22.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginApi: NSObject {
    
    static func token(username: String, password: String) -> Observable<String> {
        
        return .just(password)
        
    }
    
    static func userInfo(token: String) ->Observable<String> {
        
        if(token == "000"){
            
            return .just("获取用户信息成功")
        }else {
            return .just("获取用户信息失败")
        }
    }
}
