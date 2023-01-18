//
//  ContentView.swift
//  SimpleAccountBook
//
//  Created by sglee237 on 2023/01/18.
//

import SwiftUI

struct MainScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {_ in
                    AccountRow()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct AccountRow: View {
    
    var buttonArea: some View {
        Button {
            
        } label: {
            Text("+")
        }
    }
    
    var body: some View {
        HStack {
            // 로고 자리 (이모지로 대체)
            Text("💸")
                .frame(width: 40, height: 40)
                .background(.secondary)
            Spacer()
            
            VStack {
                //타이틀, 금액
                Text("타이틀")
                Text("금액")
            }
            .background(.gray)
            Spacer()
            
            // Button 자리
            buttonArea
            
        }
        
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack { // Top Area
                Button {
                    
                } label: {
                    Text("Top Button")
                }
            }.padding()
            
            Spacer() // Contents Area
            MainScrollView()
            Spacer()
            
            
            HStack { // Bottom Area
                Button {
                    
                } label: {
                    Text("Bottom")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
