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
                        .frame(width: 400, height: 50) // Adjusted the frame width and height
                    
                    Text("Get training notifications, so you can train.")
                        .padding(.top, 15)
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
                print("Redirecting to notification preferences...")
                
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    self.showAlert(with: "Training Reminders have already been enabled. If you are looking to modify settings go to ApenaFreediving > Training Reminder Settings")
                }
            } else {
                print("Push notifications permission denied.")
                print("Not redirecting to notification preferences.")
                
                DispatchQueue.main.async {
                    self.showAlert(with: "Training Reminders are disabled. If you want to enable them press the Settings button below.")
                }
            }
        }
    }

    private func showAlert(with message: String) {
        guard let viewController = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        let alertController = UIAlertController(title: "Training Reminders Disabled", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(settingsAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
