//
//  AccountBookModel.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/22.
//

import Foundation

enum AccountCategory:String, CaseIterable, Codable {
    //case 💸, 💰, ☕️, 🥘
    case none
    case saving //
    case drink
    case food
    case transport
    
    var id:AccountCategory { self }
    
    var DisplayImoji: String {
        //"💸", "💰", "☕️", "🥘"
        switch self {
        case .saving: return "💰"
        case .drink: return "☕️"
        case .food: return "🥘"
        case .transport: return "🚘"
        default: return "💸"
        }
    }
    
    var Display: String {
        switch self {
        case .saving: return "돈아끼기좋은날"
        case .drink: return "커피/음료수좋은날"
        case .food: return "먹기좋은날"
        case .transport: return "타고이동하기"
        default: return "돈쓰기좋은날"
        }
    }
    
}

struct AccountData:Codable {
    
    var category:AccountCategory = .none
    var title:String = ""
    var account:String = "0"
    var date:Date = Date()
    
    init(category: AccountCategory, title: String, account: String) {
        self.category = category
        self.title = (title == "" ? category.Display : title)
        self.account = account
    }
//    init() {}
}
