//
//  SetupNotificationView.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/7/23.
//

import SwiftUI
import UserNotifications

struct SetupNotificationView: View {
    @State private var selectedTime = Date()
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notification Time")) {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
                
                Button(action: {
                    handleNotificationRequest()
                }) {
                    Text("Submit")
                }
            }
            .navigationBarTitle("Setup Notification")
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Permission Required"),
                message: Text("Please enable notifications for this app in Settings to receive reminders."),
                primaryButton: .default(Text("Settings"), action: openSettings),
                secondaryButton: .cancel()
            )
        }
    }

    private func handleNotificationRequest() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                scheduleNotification()
            } else {
                showAlert = true
            }
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "This is your notification message."
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: selectedTime), repeats: false)
        
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }

    
    private func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsURL)
    }
}

struct SetupNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        SetupNotificationView()
    }
}
