//
//  ContentView.swift
//  QRScanner
//
//  Created by Leonid Zemtsov on 11.01.2022.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan QR code to get started"
    
    var scannedSheet: some View {
        CodeScannerView (
            codeTypes: [.qr],
            completion:  { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
                
            }
        )
            
        
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            Button("Scan Qr") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannedSheet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
