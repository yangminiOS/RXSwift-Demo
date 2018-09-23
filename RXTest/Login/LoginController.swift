//
//  ViewController.swift
//  RXTest
//
//  Created by mini on 2018/8/31.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class viewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var remindName: UILabel!
    
    @IBOutlet weak var pswTF: UITextField!
    
    @IBOutlet weak var remindPsw: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let minUsernameCount = 6
    let minPswCount = 8
    let maxPswCount = 16
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    private func setupUI() {
        
        let usernameVaild = nameTF.rx.text.orEmpty
            .map{$0.count >= self.minUsernameCount}
            .share(replay: 1)
      
        usernameVaild.bind(to: remindName.rx.isHidden).disposed(by: disposeBag)
        
        let passwordVaild = pswTF.rx.text.orEmpty
            .map{ $0.count >= 3 && $0.count <= self.maxPswCount}
            .share(replay:1)
        
        passwordVaild.bind(to: remindPsw.rx.isHidden).disposed(by: disposeBag)
        
        let loginVaild = Observable.combineLatest(usernameVaild, passwordVaild){$0 && $1}
            .share(replay:1)
        
        loginVaild.bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext:{[weak self] in self?.clickButton()})
            .disposed(by: disposeBag)
        
    }
    
    
    @objc private func clickButton() {
        
        LoginApi.token(username: nameTF.text!, password: pswTF.text!).flatMapLatest(LoginApi.userInfo).subscribe(onNext: { (userInfo) in
            
            self.alertView(title: userInfo)
            
        }, onError: { (error) in
            
            print("error")
            
        }).dispose()
       
       
    }
    
    func alertView(title: String) {
        
        let alertVC = UIAlertController.init(title: "提示", message: title, preferredStyle: .alert)
        
        let cancel = UIAlertAction.init(title: "取消", style: .default, handler: nil)
        
        let done = UIAlertAction.init(title: "确定", style: .default, handler: nil)
        
        alertVC.addAction(cancel)
        
        alertVC.addAction(done)
        
        self.present(alertVC, animated: true, completion: nil)
    }


}

