//
//  Guidance.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/1/23.
//

import SwiftUI

struct GuidanceView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Genreal Guidance")
                    }
                ) {
                    Text("Freediving Tables")
                        .font(.title2)
                        .bold()
                    
                    Text("Freediving Tables are a statistics of exersises that helps you hold your breath longer so your body gets used to high CO2 and low O2 levels")
                    
                    NavigationLink(destination: TrainingFacts()) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.accentColor)
                                .bold()
                            Text("Learn about CO2 and O2")
                                .foregroundColor(.accentColor)
                                .bold()
                        }
                    
                    }
                }

                
                Section(header:
                    HStack {
                        Image(systemName: "questionmark.circle")
                        Text("How to Exersise")
                    }
                ) {
                    Text("How to Exersise")
                        .font(.title2)
                        .bold()
                    
                    Text("When it comes to exercising with CO2 and O2 and practicing breath-holding, it's important to proceed with caution and consult a professional. CO2 training involves controlled breathing exercises to increase carbon dioxide levels, while O2 training focuses on improving oxygen utilization through techniques like interval training and breath control. Safe and gradual breath-holding exercises can enhance lung capacity and efficiency.")

                }
                
                Section(header:
                    HStack {
                        Image(systemName: "exclamationmark.triangle")
                        .foregroundColor(Color.red)
                        .bold()
                        Text("Basic Saftey Reminders")
                        .foregroundColor(Color.red)
                        .bold()
                    }
                ) {
                    Text("Home Training Saftey")
                        .font(.title2)
                        .bold()
                    
                    Text("If you are home and you feel dizzy, lightheaded stop the training, your saftey is more important than a longer time.")
                    Text("At home training is more safe than wet training.")
                    
                    Text("Wet Training Saftey")
                        .font(.title2)
                        .bold()
                    
                    Text("Be aware that wet training is more risky than at home training. If you are wet training NEVER dive alone, go with a apena and a rescue trained buddy to maximise saftey.")
                    Text("Always dive within your limits, Take slow steps to make steady progress on your training.")

                }

            }
        }
    }
}

struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView()
    }
}
