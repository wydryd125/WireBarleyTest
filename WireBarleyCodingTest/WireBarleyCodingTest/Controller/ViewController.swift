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
    private var model = Model()
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        model.request() {
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                self?.successCompletionHandler(result)
            }
        }
    }
    
    //MARK: UI
    private func setUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        [exchangeView].forEach {
            view.addSubview($0)
        }
        exchangeView.setExchangViewProtocol(delegate: self)
        
    }
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        exchangeView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(guide)
        }
    }
    private func alertAction() {
        let alert = UIAlertController(title: "송금액이 바르지 않습니다", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title:"확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
//MARK: UITextField, UIPickerView Delegate
extension ViewController: ExchangeRateViewProtocol {
    // UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        model.recipientCountriesCount
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.recipientCountriyString(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        .dynamicHeight(height: 40)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let recipientCountry = model.recipientCountriyString(row: row)
        exchangeView.updateRecipientCountryLabel(recipientCountry: recipientCountry)
        
        model.request(completionHandler: {
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                self?.successCompletionHandler(result)
            }
        })
  
    }
    //UITextfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let argumentString = textField.text else { return true }
        
        let inputNumString = (argumentString as NSString).replacingCharacters(in: range, with: string)
        let sendMoney = Double(inputNumString) ?? 0
       
        if sendMoney < 0 || sendMoney > 10000 {
            alertAction()
            return false
        }
        
        model.setSendMoney(sendMoney: sendMoney)
        
        model.request(completionHandler: {
            
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                self?.successCompletionHandler(result)
            }
        })
        return true
    }

    
    private func successCompletionHandler(_ result: (exchangeRate: Double, exchangedMoney: Double, exchangeCountry: String)) {
        let checkTimeString = dateStringConvert()
        guard let moneyString = moneyStringConvert(exchangedMoney: result.exchangedMoney),
            let exchangeString = moneyStringConvert(exchangedMoney: result.exchangeRate)
            else { return }
        
        exchangeView.updateResult(exchange: exchangeString, money: moneyString, country: result.exchangeCountry, checkTime: checkTimeString)
    }
    
    private func dateStringConvert() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: Date())
        return dateString

    }
    
    private func moneyStringConvert(exchangedMoney: Double) -> String? {
        let moneyFormatter = NumberFormatter()
        
        moneyFormatter.numberStyle = .decimal
        
        moneyFormatter.minimumFractionDigits = 2
        moneyFormatter.maximumFractionDigits = 2
        
        let result = moneyFormatter.string(from: NSNumber(value: exchangedMoney))
        return result
        
    }

    
    // 송금액 창에 숫자만 입력 받도록 함.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return Int(string) != nil || string.isEmpty
//    }
    
}

