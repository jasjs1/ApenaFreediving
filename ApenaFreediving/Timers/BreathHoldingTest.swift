//
//  BreathHoldingTest.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/1/23.
//

import SwiftUI


struct BreathHoldingTest: View {
    @State private var secondsElapsed = 0
    @State private var isTimerRunning = false
    @State private var bestResult = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showingConfirmationAlert = false
    
    var body: some View {
        ZStack {
            Image("BreathHold_PLAIN")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 10)
                .offset(y: -150)
                .frame(height: 570)
            
            VStack {
                Text("Breath Holding Test")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.horizontal, 20)
                    .foregroundColor(.black)
                
                Text("YOUR BEST RESULT: \(formattedElapsedTime(bestResult))")
                    .padding(.top, 1)
                    .bold()
                
                Spacer()
                
                Text(isTimerRunning ? "\(formattedElapsedTime(secondsElapsed))" : "00:00")
                    .font(.system(size: 80))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    if isTimerRunning {
                        showingConfirmationAlert = false // Dismiss any previous alert
                        isTimerRunning = false // Stop the timer
                        secondsElapsed = 0 // Reset the timer when the user stops it
                    } else {
                        showingConfirmationAlert = true // Show the confirmation alert
                    }
                }) {
                    Text(isTimerRunning ? "Stop" : "Start")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                .alert(isPresented: $showingConfirmationAlert) {
                    Alert(
                        title: Text("IMPORTANT SAFTEY MESSAGE"),
                        message: Text("Never freedive alone; always have a trained buddy. Prioritize training, and if you feel lightheaded or dizzy, come up to the surface and breathe."),
                        primaryButton: .default(Text("I Agree")) {
                            isTimerRunning = true // Start the timer when the user confirms the alert
                        },
                        secondaryButton: .cancel(Text("Maybe Later")) {
                            isTimerRunning = false // Stop the timer if the user cancels the alert
                        }
                    )
                }
                
                Spacer()
            }
            .frame(width: 315, height: 422)
            .opacity(2)
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .blur(radius: 2)
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
            )
            .alignmentGuide(.top) { d in
                d[.bottom]
            }
            .onReceive(timer) { _ in
                if isTimerRunning {
                    secondsElapsed += 1
                    if secondsElapsed > bestResult {
                        bestResult = secondsElapsed
                    }
                }
            }
        }
    }
    
    private func formattedElapsedTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}




struct BreathHoldingTest_Previews: PreviewProvider {
    static var previews: some View {
        BreathHoldingTest()
    }
}
