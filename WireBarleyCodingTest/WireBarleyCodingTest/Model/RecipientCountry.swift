//
//  RecipientCountry.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import Foundation

struct Model {
    private enum Recipient: String, CaseIterable {
        case KRW
        case JPY
        case PHP
        
        func switchExchange() -> String {
            
            switch self {
            case .KRW:
                return "한국 (KRW)"
            case .JPY:
                return "일본 (JPY)"
            case .PHP:
                return "필리핀 (PHP)"
            }
        }
    }
    
    private let recipientCountries = Recipient.allCases
    private var recipientCountry: Recipient = .KRW
    private var task: URLSessionDataTask?
//    private var exchangeRate: Double = 0
//    private var checkTime: Date = Date()
    private var sendMoney: Double = 0
    
    var recipientCountriesCount: Int {
        recipientCountries.count
    }
    
    mutating func setSendMoney(sendMoney: Double) {
        self.sendMoney = sendMoney
    }
    
    mutating func recipientCountriyString(row: Int) -> String {
        recipientCountry = recipientCountries[row]
        return recipientCountries[row].switchExchange()
    }
    
    mutating func request(completionHandler: @escaping (Result<(Double, Double, String), Error>) -> Void) {
        let baseURLString = "http://apilayer.net/api/live"
        let accessKey = "b5ac437889c7bd8fd9b9b6f79dea0100"
        let exchangeCountry = recipientCountry.rawValue
        let sendMoney = self.sendMoney
        let source = "USD"
        let format = 1
        
        
        guard var urlComponents = URLComponents(string: baseURLString) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "access_key", value: accessKey),
            URLQueryItem(name: "currencies", value: exchangeCountry),
            URLQueryItem(name: "source", value: source),
            URLQueryItem(name: "format", value: format.description)
        ]
        guard let url = urlComponents.url else { return }
        
        self.task?.cancel()
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let quotes = jsonObject["quotes"] as? [String: Double],
                let exchangeRate = quotes[source + exchangeCountry]
                else { return }
            
            DispatchQueue.main.async {
                completionHandler(.success((exchangeRate, sendMoney * exchangeRate, exchangeCountry)))
            }
            
            
          
        }
        task.resume()
        self.task = task
    }

}



