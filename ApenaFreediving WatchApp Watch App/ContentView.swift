//
//  ContentView.swift
//  ApenaFreediving WatchApp Watch App
//
//  Created by Jayce Sagvold on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @SceneStorage("isFirstLaunch") var isFirstLaunch: Bool?
    @State private var showConfirmationCode = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: BreathHoldTest()) {
                    Text("Breath Holding Test")
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("!! Important Safety Alert !!"),
                        message: Text("If lightheaded, come up to the surface. Always dive with a rescue-trained buddy."),
                        primaryButton: .default(Text("Yes")) {
                            navigateToBreathHoldTest()
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
            }
            .sheet(isPresented: $showConfirmationCode) {
                GetAppleWatchConfirmationCode()
            }
        }
        .onAppear {
            if isFirstLaunch == nil {
                isFirstLaunch = true
                showConfirmationCode = true
            } else {
                showConfirmationCode = false
            }
        }
    }
    
    func navigateToBreathHoldTest() {
        // Perform any necessary navigation-related actions here 
    }
}

struct GetAppleWatchConfirmationCode: View {
    @Environment(\.dismiss) private var dismiss
    @State private var confirmationCodeSuccess = ""
    
    var body: some View {
        VStack {
            
            Text("Is the code on your iPhone 30981?")
                .foregroundColor(.white)
            
            Button(action: {
                dismiss()
            }) {
                
                Text("Connect to iPhone")
                    .foregroundColor(.white)
            }
            .background(Color.accentColor)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

