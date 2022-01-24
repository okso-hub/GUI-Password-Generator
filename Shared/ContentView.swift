//
//  ContentView.swift
//  Shared
//
//  Created by Okan Sönmez on 24.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State public var digits: Int = 8
    @State public var characters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!§$%&/()=?"
    @State public var password: String = "[PASSWORD]"
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Button {
                    password = ""
                    for _ in Range(1...digits) {
                        let index = Int.random(in: 0...71)
                        let char = characters[characters.index(characters.startIndex, offsetBy: index)]
                        
                        password += String(char)
                    }
                } label: {
                    Text("Generate Password")
                }
                    .padding()
                    .buttonBorderShape(.automatic)
                    .buttonStyle(.borderedProminent)
                
                Stepper("Digits: \(digits)", value: $digits, in: 1...100)
                    .padding()
            }
            HStack {
                Text(password)
                    .textSelection(.enabled)
                
                Button {
                    UIPasteboard.general.string = password
                } label: {
                    Image(systemName: "doc.on.doc")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
