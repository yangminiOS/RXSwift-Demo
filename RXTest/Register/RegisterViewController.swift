//
//  RegisterViewController.swift
//  RXTest
//
//  Created by mini on 2018/9/23.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usenameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var repeatPasswordTF: UITextField!
    
    @IBOutlet weak var usenameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        configViewModel()
    }
    
    private func configViewModel() {
        
        let registerModel = RegisterViewModel(input: (username: usenameTF.rx.text.orEmpty.asObservable(), password: passwordTF.rx.text.orEmpty.asObservable(), repeadPassword: repeatPasswordTF.rx.text.orEmpty.asObservable(), loginTaps: registerButton.rx.tap.asObservable())
            
            , dependency: (API: RetisterDefaultAPI.api, validationService: RegisterDefaultValidationService.service))
        
        registerModel.validateUsername.bind(to: usenameLabel.rx.labelValidationResult).disposed(by:disposeBag)
        
        registerModel.validatePassword.bind(to: passwordLabel.rx.labelValidationResult).disposed(by: disposeBag)
        
        registerModel.validatePasswordRepeated.bind(to: repeatPasswordLabel.rx.labelValidationResult).disposed(by: disposeBag)
        
        registerModel.signupEnable.bind(to: registerButton.rx.isEnabled).disposed(by: disposeBag)
        
        registerModel.signedIn.subscribe({ singedin in
            print(singedin)
        }).disposed(by: disposeBag)
        
    }

}
