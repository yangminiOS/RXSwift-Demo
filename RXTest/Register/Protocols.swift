//
//  Protocols.swift
//  RXTest
//
//  Created by mini on 2018/9/23.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import RxSwift
import RxCocoa

enum ValidationResult {
    
    case empty
    
    case validating
    
    case ok(message: String)
    
    case failed(message: String)
    
}

protocol RegisterAPI {
    
    func usernameAvailabel(_ username: String) -> Observable<Bool>
    
    func singup(_ username: String, password: String) -> Observable<Bool>
}

protocol RegisterValidationService {
    
    func validateUsername(_ username: String) -> Observable<ValidationResult>
    
    func validatePassword(_ password: String) -> ValidationResult
    
    func validateRepeatedPassword(_ password: String, _ repeatedPassword: String) -> ValidationResult
}


extension ValidationResult {
    
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}
