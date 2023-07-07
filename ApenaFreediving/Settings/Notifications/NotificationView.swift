//
//  NotificationView.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/7/23.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    @State private var frameWidth: CGFloat = 400
    @State private var frameHeight: CGFloat = 222
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BeachArial")
                    .resizable()
                    .frame(width: 550, height: 422)
                    .ignoresSafeArea(.container, edges: .top)
                
                VStack {
                    Text("Notifications")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .frame(width: 1500, height: 155)
                    
                    Text("Get training notifications, so you can train.")
                        .padding(.top, -30)
                        .foregroundColor(.white)
                        .bold()
                    
                    Button(action: {
                        requestPushNotifications()
                    }) {
                        Text("Enable Training Notifications")
                            .padding(20)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                    
                    Spacer()
                }
                .background(Color.accentColor)
                .frame(maxHeight: 200)
                
                Spacer()
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
    
    private func requestPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Push notifications permission granted.")
                
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Push notifications permission denied.")
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
