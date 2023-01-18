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
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct AccountRow: View {
    var body: some View {
        HStack {
            // 로고 자리 (이모지로 대체)
            EmptyView()
            
            VStack {
                //타이틀, 금액
            }
            
            // Button 자리
            EmptyView()
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
