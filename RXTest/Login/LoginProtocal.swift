//
//  LoginProtocal.swift
//  RXTest
//
//  Created by mini on 2018/9/1.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum TFResult{
    case empty
    
    case success
    
    case failed(error: String)
}

extension TFResult {
    var isValid: Bool {
        switch self {
        case  .success:
            return true
        default:
            return false
        }
    }
}

extension TFResult {
    var textColor: UIColor {
        switch self {
        case .success:
            return UIColor(red: 138.0 / 255.0, green: 221.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
        case .empty:
            return UIColor.black
        case .failed:
            return UIColor.red
        }
    }
}

extension TFResult {
    var description: String {
        switch self {
        case .success:
            return ""
        case .empty:
            return ""
        case let .failed(message):
            return message
        }
    }
}

extension Reactive where Base: UILabel {
    var validationResult: UIBindingObserver<Base, TFResult> {
        return UIBindingObserver(UIElement: base) { label, result in
            label.textColor = result.textColor
            if(result.description.count <= 11) {
                label.text = result.description
            }
            
        }
    }
}
