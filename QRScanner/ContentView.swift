//
//  ContentView.swift
//  QRScanner
//
//  Created by Leonid Zemtsov on 11.01.2022.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            Main()
            .tabItem {
                Image(systemName: "creditcard.fill")
                Text("Wallets")
            }
            
            QRScanner()
            .tabItem {
                Image(systemName: "qrcode.viewfinder")
                Text("Scan")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
