//
//  ExchangeRateView.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit
import SnapKit

class ExchangeRateView: UIView {
    
    private let exchangeLabel = UILabel()
    
    private let sendMoneyCountryLabel = UILabel()
    private let sendMoneyCountry = UILabel()
    
    private let recipientCountryLabel = UILabel()
    private let recipientCountry = UILabel()
    
    private let recipientCountryPicker = UIPickerView()
    
    private let exchangeRateLabel = UILabel()
    private let exchangeRate = UILabel()
    
    private let checkTimeLabel = UILabel()
    private let checkTime = UILabel()
    
    private let remittanceLabel = UILabel()
    private let remittanceTextField = UITextField()
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
    
    //MARK: UI
    private func setUI() {
        let mainFont = UIFont.dynamicFont(fontSize: 48, weight: .medium)
        let textFont = UIFont.dynamicFont(fontSize: 16, weight: .regular)
        let resultFont = UIFont.dynamicFont(fontSize: 20, weight: .medium)
        
        [exchangeLabel,sendMoneyCountryLabel,sendMoneyCountry,recipientCountryLabel,recipientCountry,exchangeRateLabel,exchangeRate,checkTimeLabel,checkTime,remittanceLabel,remittanceTextField,USDLabel,selectResultLabel].forEach {
            addSubview($0)
        }
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        exchangeLabel.text = "환율 계산"
        exchangeLabel.font = mainFont
        
        sendMoneyCountryLabel.text = "송금국가 : "
        sendMoneyCountryLabel.font = textFont
        
        sendMoneyCountry.text = "미국 (USD)"
        sendMoneyCountry.font = textFont
        
        recipientCountryLabel.text = "수취국가 : "
        recipientCountryLabel.font = textFont
        
        recipientCountry.text = "한국 (KRW)"
        recipientCountry.font = textFont
        
        exchangeRateLabel.text = "환율 : "
        exchangeRateLabel.font = textFont
        
        exchangeRate.text = "1,130,05 KRW / USD"
        exchangeRate.font = textFont
        
        checkTimeLabel.text = "조회시간 : "
        checkTimeLabel.font = textFont
        
        checkTime.text = "2020-06-08 16:13"
        checkTime.font = textFont
        
        remittanceLabel.text = "송금액 : "
        remittanceLabel.font = textFont
        
        remittanceTextField.textAlignment = .right
        remittanceTextField.font = textFont
        remittanceTextField.layer.borderWidth = 0.48
        remittanceTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        USDLabel.text = "USD"
        USDLabel.font = textFont
        
        selectResultLabel.text = "수취금액은 호노로로로놀 입니다."
        selectResultLabel.font = resultFont
        
        
        
    }
    private func setConstrainrts() {
        
        let topMargin: CGFloat = .dynamicHeight(height: 48)
        let labelLeadingMargin: CGFloat = .dynamicWidth(width: 32)
        let leadingMargin: CGFloat = .dynamicHeight(height: 3)
        let padding: CGFloat = .dynamicHeight(height: 20)
        
        exchangeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(topMargin)
            $0.centerX.equalToSuperview()
        }
        
        sendMoneyCountryLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeLabel.snp.bottom).offset(padding)
            $0.leading.equalToSuperview().inset(labelLeadingMargin)
        }
        sendMoneyCountry.snp.makeConstraints {
            $0.top.equalTo(sendMoneyCountryLabel.snp.top)
            $0.leading.equalTo(sendMoneyCountryLabel.snp.trailing).offset(leadingMargin)
        }
        
        recipientCountryLabel.snp.makeConstraints {
            $0.top.equalTo(sendMoneyCountryLabel.snp.bottom).offset(padding)
            $0.trailing.equalTo(sendMoneyCountryLabel.snp.trailing)
        }
        
        recipientCountry.snp.makeConstraints {
            $0.top.equalTo(recipientCountryLabel.snp.top)
            $0.leading.equalTo(recipientCountryLabel.snp.trailing).offset(leadingMargin)
        }
        
        exchangeRateLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryLabel.snp.bottom).offset(padding)
            $0.trailing.equalTo(sendMoneyCountryLabel.snp.trailing)
        }
        
        exchangeRate.snp.makeConstraints {
            $0.top.equalTo(exchangeRateLabel.snp.top)
            $0.leading.equalTo(exchangeRateLabel.snp.trailing).offset(leadingMargin)
        }
        
        checkTimeLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateLabel.snp.bottom).offset(padding)
            $0.trailing.equalTo(sendMoneyCountryLabel.snp.trailing)
        }
        
        checkTime.snp.makeConstraints {
            $0.top.equalTo(checkTimeLabel.snp.top)
            $0.leading.equalTo(checkTimeLabel.snp.trailing).offset(leadingMargin)
        }
        
        remittanceLabel.snp.makeConstraints {
            $0.top.equalTo(checkTimeLabel.snp.bottom).offset(padding)
            $0.trailing.equalTo(sendMoneyCountryLabel.snp.trailing)
        }
        
        remittanceTextField.snp.makeConstraints {
            $0.top.equalTo(remittanceLabel.snp.top)
            $0.leading.equalTo(remittanceLabel.snp.trailing).offset(leadingMargin)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        USDLabel.snp.makeConstraints {
            $0.top.equalTo(remittanceLabel.snp.top)
            $0.leading.equalTo(remittanceTextField.snp.trailing).offset(leadingMargin)
        }
        
        selectResultLabel.snp.makeConstraints {
            $0.top.equalTo(remittanceLabel.snp.bottom).offset(topMargin * 2)
            $0.centerX.equalToSuperview()
            
        }
        
    }
    
    func setRemittanceTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.remittanceTextField.delegate = delegate
    }
    
}
