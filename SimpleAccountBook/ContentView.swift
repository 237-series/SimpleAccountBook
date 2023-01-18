//
//  ContentView.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/18.
//

import SwiftUI

enum AccountCategory:String {
    //case 💸, 💰, ☕️, 🥘
    case none
    case saving //
    case drink
    case food
    case transport
    
    var DisplayImoji: String {
        //"💸", "💰", "☕️", "🥘"
        switch self {
        case .saving: return "💰"
        case .drink: return "☕️"
        case .food: return "🥘"
        default: return "💸"
        }
    }
    
    var Display: String {
        switch self {
        case .saving: return "돈아끼기좋은날"
        case .drink: return "커피/음료수좋은날"
        case .food: return "먹기좋은날"
        default: return "돈쓰기좋은날"
        }
    }
}

class AccountData {
    
    var category:AccountCategory = .none
    var title:String = ""
    var account:String = "0"
    var date:Date = Date()
    
    init(category: AccountCategory, title: String, account: String) {
        self.category = category
        self.title = title
        self.account = account
    }
    init() {}
}

let DummyData: [AccountData] = [
    AccountData(category: .food, title: "저녁먹었음", account: "30,000"),
    AccountData(category: .saving, title: "2023년 1월 첫 저축", account: "100,000")
]


struct MainScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(Array(DummyData.enumerated()), id: \.offset) {idx, data in
                    AccountRow(accountData: data)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
            
        }
        .frame(width: .infinity)
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}

struct AccountRow: View {
    
    var accountData:AccountData
    
    var buttonArea: some View {
        VStack {
            Button {
                
            } label: {
                Text("+")
                    .foregroundColor(.black)
            }
            .frame(width: 43, height: 33)
            .background(Color("AccountAdd"))
            .cornerRadius(10)
        }
        .padding()
    }
    
    var body: some View {
        HStack {
            // 로고 자리 (이모지로 대체)
            Text(accountData.category.DisplayImoji)
                .font(.system(size: 45))
                .cornerRadius(0.3)
            
            VStack(alignment: .leading) {
                //타이틀, 금액
                Text(accountData.title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(accountData.account + "원")
                    .font(.title3)
            }
            
            Spacer()
            
            // Button 자리
            buttonArea
            
        }
        
    }
}

struct TopArea: View {
    var body: some View {
        HStack { // Top Area
            Button {
                
            } label: {
                Text("Top Button")
            }
        }.padding()
    }
}

struct BottomArea: View {
    var body: some View {
        HStack { // Bottom Area
            Button {
                
            } label: {
                Text("Bottom")
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            
            VStack {
                TopArea()
                Spacer() // Contents Area
                MainScrollView()
                Spacer()
                BottomArea()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
