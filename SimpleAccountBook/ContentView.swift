//
//  ContentView.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/18.
//

import SwiftUI


let DummyData: [AccountData] = [
    AccountData(category: .food, title: "저녁먹었음", account: "30,000"),
    AccountData(category: .saving, title: "2023년 1월 첫 저축", account: "100,000")
]

struct MainScrollView: View {
    @State var dataManager:AccountDataManager = AccountDataManager.shared

    var body: some View {
        
        ScrollView() {
            VStack {
                ForEach(Array(dataManager.getDummyData().enumerated()), id: \.offset) {idx, data in
                    AccountRow(accountData: data)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
            
        }
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

struct InputAccountModal: View {
    // Using State & Binding Model
    @Binding var isPresented: Bool
    
    // Using dismiss functions
    @Environment(\.dismiss) private var dismiss
    
    //                isPresented = false
    //                dismiss.callAsFunction()
    //                dismiss()

    @State private var money:String = ""
    
    var TopButton: some View {
        // Top Button
        HStack {
            Button {
                dismiss()
            } label: {
                Text("돌아가기")
            }
            Spacer()
        }.padding()
    }
    
    var InputArea: some View {
        
        VStack {
            HStack {
                Text("얼마나 쓰셨나요?")
                    .font(.title)
                Spacer()
                Button(action: {
                
                }) {
                    Image(systemName: "arrow.up")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        
                }
                
                
            }
            
            TextField("금액 입력", text: $money)
                .keyboardType(.decimalPad)
                .font(.title)
            Spacer()
        }.padding()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TopButton
            InputArea
            Spacer()
        } .padding()
    }
}

struct TopArea: View {
    @State private var isShowModal = false //
    
    var body: some View {
        HStack { // Top Area
            Button {
                self.isShowModal = true
            } label: {
                Text("💸💸💸")
                    .font(.system(size: 33.3))
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .sheet(isPresented: self.$isShowModal) {
                InputAccountModal(isPresented: self.$isShowModal)
            }
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
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
                MainScrollView()
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
