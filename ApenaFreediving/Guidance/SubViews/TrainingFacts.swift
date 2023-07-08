//
//  TrainingFacts.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/8/23.
//

import SwiftUI

struct TrainingFacts: View {
    var body: some View {
        VStack {
            List {
                Section(header:
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Guidance")
                    }
                ) {
                    Text("Freediving Tables")
                        .font(.title2)
                        .bold()
                    
                    Text("Freediving Tables are a statistics of exersises that helps you hold your breath longer so your body gets used to high CO2 and low O2 levels")
                    
        
                }
            }
        }
    }
}

struct TrainingFacts_Previews: PreviewProvider {
    static var previews: some View {
        TrainingFacts()
    }
}
