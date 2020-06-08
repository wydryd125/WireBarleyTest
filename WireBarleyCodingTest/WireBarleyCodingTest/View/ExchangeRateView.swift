//
//  ExchangeRateView.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit

class ExchangeRateView: UIView {
    
    private let exchangeLabel = UILabel()
    private let sendMoneyLabel = UILabel()
    private let receiptMoneyLabel = UILabel()
    private let receivingCountryTextField = UITextField()
    private let exchangeRateLabel = UILabel()
    private let exchangeRateAmountLabel = UILabel()
    private let checkTimeLabel = UILabel()
    private let remittanceLabel = UILabel()
    private let remittanceBoxLabel = UILabel()
    private let USDLabel = UILabel()
    private let selectResultLabel = UILabel()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstrainrts()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        
    }
    func setConstrainrts() {
        
    }
    
}
