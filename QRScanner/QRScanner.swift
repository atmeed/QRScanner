//
//  QRScanner.swift
//  QRScanner
//
//  Created by Leonid Zemtsov on 11.01.2022.
//

import SwiftUI
import CodeScanner

struct QRScanner: View {
    
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
        NavigationView {
            
            VStack(spacing: 10) {
                //Вверхний бар
                VStack {
                    Text(scannedCode)
                }.padding(.vertical, 130)
                Spacer()
                
                //Нижний бар с кнопками
                VStack {
                    HStack(spacing: 20) {
                        
                        //Сканирование из камеры
                        Button("Scan QR") {
                            self.isPresentingScanner = true
                        }
                        .sheet(isPresented: $isPresentingScanner) {
                            self.scannedSheet
                            }
                        
                        //Сканирование с фотографии
                        Button("Select a photo") {
                            
                        }
                    }
                    
                    //Кнопка с пояснениями как и что работает
                    Button(action: {
                        
                    }) {
                        Image(systemName: "questionmark.circle")
                    }.padding()
                }
            }.navigationBarTitle("Сканер QR кодов")
            
        }
    }
}

struct QRScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRScanner()
    }
}
