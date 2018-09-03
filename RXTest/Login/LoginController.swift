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
    
    var viewMoldel: LoginViewModel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        loginButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    private func setupUI() {
        
        
        
        let viewModel = LoginViewModel()
        
        nameTF.rx.text.orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        viewModel.userNameAble.bind(to: remindName.rx.validationResult).disposed(by: disposeBag)
        
    }
    
    
    @objc private func clickButton() {
        let alertVC = UIAlertController.init(title: "弹窗测试", message: "Akulaku akan menjaga keamanan akun Anda, simpan dengan baik kata sandi pembayaran Anda untuk menghindari penyalahgunaan pemakaian akun, ataupun pemesanan.\n Ambil hadiah pake voucher 10k dan lanjutkan berbelanja", preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "kelual", style: .default, handler: nil)
        
        let done = UIAlertAction.init(title: "Ambil hadiah 10k", style: .default, handler: nil)
        
        alertVC.addAction(cancel)
        
        alertVC.addAction(done)
        
        self.present(alertVC, animated: true, completion: nil)
    }


}

