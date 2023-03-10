//
//  AccountBookModel.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/22.
//

import Foundation

enum AccountCategory:String, CaseIterable, Codable {
    //case πΈ, π°, βοΈ, π₯
    case none
    case saving //
    case drink
    case food
    case transport
    
    var id:AccountCategory { self }
    
    var DisplayImoji: String {
        //"πΈ", "π°", "βοΈ", "π₯"
        switch self {
        case .saving: return "π°"
        case .drink: return "βοΈ"
        case .food: return "π₯"
        case .transport: return "π"
        default: return "πΈ"
        }
    }
    
    var Display: String {
        switch self {
        case .saving: return "λμλΌκΈ°μ’μλ "
        case .drink: return "μ»€νΌ/μλ£μμ’μλ "
        case .food: return "λ¨ΉκΈ°μ’μλ "
        case .transport: return "νκ³ μ΄λνκΈ°"
        default: return "λμ°κΈ°μ’μλ "
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
