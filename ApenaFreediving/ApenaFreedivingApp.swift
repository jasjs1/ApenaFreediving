//
//  ApenaFreedivingApp.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/1/23.

import SwiftUI

@main
struct ApenaFreedivingApp: App {
    var body: some Scene {
        WindowGroup {
                   TabView {
                       ContentView()
                           .tabItem {
                               Image(systemName: "timer")
                               Text("Exercise")
                           }
                       ProfileView()
                           .tabItem {
                               Image(systemName: "person.fill")
                               Text("Profile")
                           }
                       GuidanceView()
                           .tabItem {
                               Image(systemName: "questionmark.folder.fill")
                               Text("Guidance")
                           }
                       SettingsView()
                           .tabItem {
                               Image(systemName: "gear")
                               Text("Settings")
                           }
                   }
               }
           }
       }
