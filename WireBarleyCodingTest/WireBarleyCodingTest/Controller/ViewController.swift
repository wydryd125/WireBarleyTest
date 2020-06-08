//
//  ViewController.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let exchangeView = ExchangeRateView()
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        
    }
    //MARK: UI
    private func setUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        [exchangeView].forEach {
            view.addSubview($0)
        }
        exchangeView.setRemittanceTextFieldDelegate(delegate: self)
        
    }
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        exchangeView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(guide)
        }
    }
    
}
//MARK: UITextField Delegate
extension ViewController: UITextFieldDelegate {
    
    // 송금액 창에 숫자만 입력 받도록 함.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return Int(string) != nil
    }
    
}

