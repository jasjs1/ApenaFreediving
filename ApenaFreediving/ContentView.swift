//
//  ContentView.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/1/23.

import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image("COUS_BREATHHOLD")
                    .resizable()
                    .frame(width: 365, height: 350)
                    .cornerRadius(13)
                
                Text("Breath Holding Timer")
                    .font(.system(size: 28))
                    .bold()
                
                HStack {
                    Text("Timer")
                        .font(.subheadline)
                    Text("·")
                        .font(.subheadline)
                    Text("Self-paced")
                        .font(.subheadline)
                    Text("·")
                        .font(.subheadline)
                    Text("Start here!")
                        .font(.subheadline)
                }
                
                VStack {
                    Button(action: {
                        showMoreDetailsBottomSheet()
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("More Details")
                        }
                        .foregroundColor(.white)
                        .background(Color.blue)
                    }
                    .padding(10) // Adjust the padding value as per your needs
                }


            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            MoreDetailsContent()
        })
    }
    
    func showMoreDetailsBottomSheet() {
        isShowingSheet = true
    }
}

struct MoreDetailsContent: View {
    var body: some View {
        VStack {
             Text("Breath Holding Counter Details")
                .font(.system(size: 25))
                .padding(11)
                .bold()
            
            
            Text("This is a self paced count up timer that tests how long you can hold your breath. Why? This is an essential skill to being a freediver, or just going to be beach and swimming under the water.")
            
        
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
