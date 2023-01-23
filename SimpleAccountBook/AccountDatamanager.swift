//
//  AccountDatamanager.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/22.
//

import Foundation

class AccountDataManager {
    static let LIST_KEY_DEFAULT = "default"
    
    static let shared = AccountDataManager()
    
    
    func getDummyData() -> [AccountData] {
        return [
            AccountData(category: .food, title: "저녁먹었음", account: "30,000"),
            AccountData(category: .saving, title: "2023년 1월 첫 저축", account: "100,000")
        ]
    }
}
