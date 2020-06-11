//
//  ExchangeRateView.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit
import SnapKit

protocol ExchangeRateViewProtocol: UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
}

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
    
    private let countryPickerView = UIPickerView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstrainrts()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        endEditing(true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI
    private func setUI() {
        let mainFont = UIFont.dynamicFont(fontSize: 48, weight: .medium)
        let textFont = UIFont.dynamicFont(fontSize: 18, weight: .regular)
        let resultFont = UIFont.dynamicFont(fontSize: 24, weight: .medium)

        [exchangeLabel, sendMoneyCountryLabel, sendMoneyCountry, recipientCountryLabel, recipientCountry, exchangeRateLabel, exchangeRate, checkTimeLabel, checkTime, remittanceLabel, remittanceTextField, USDLabel, selectResultLabel, countryPickerView].forEach {
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
        
        exchangeRate.text = ""
        exchangeRate.font = textFont
        
        checkTimeLabel.text = "조회시간 : "
        checkTimeLabel.font = textFont
        
        checkTime.text = ""
        checkTime.font = textFont
        
        remittanceLabel.text = "송금액 : "
        remittanceLabel.font = textFont
        
        
        remittanceTextField.textAlignment = .right
        remittanceTextField.keyboardType = .numberPad
        remittanceTextField.font = textFont
        remittanceTextField.layer.borderWidth = 0.48
        remittanceTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        USDLabel.text = "USD"
        USDLabel.font = textFont
        
        selectResultLabel.text = ""
        selectResultLabel.font = resultFont
        selectResultLabel.textAlignment = .center
        selectResultLabel.numberOfLines = 0
        
//        countryPickerView.backgroundColor = .red
        
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
            $0.leading.trailing.equalToSuperview()
            
        }
        
        countryPickerView.snp.makeConstraints {
            $0.top.equalTo(snp.centerY).multipliedBy(1.5)
            $0.bottom.equalToSuperview().inset(padding)
            $0.leading.trailing.equalToSuperview()

        }
        
    }
    
    
    // MARK: Interface
    func setExchangViewProtocol(delegate: ExchangeRateViewProtocol) {
        self.remittanceTextField.delegate = delegate
        self.countryPickerView.dataSource = delegate
        self.countryPickerView.delegate = delegate
    }
    
    func updateRecipientCountryLabel(recipientCountry: String) {
        self.recipientCountry.text = recipientCountry

        
    }
    
    
    func updateResult(exchange: String, money: String, country: String, checkTime: String) {
        let selectResult = money != "0.00" ? "수취금액은 \(money) (\(country)) 입니다." : ""
        selectResultLabel.text = selectResult
        exchangeRate.text = exchange + " " + country + " / USD"
        self.checkTime.text = checkTime
        
    }
}
