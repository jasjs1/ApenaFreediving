//
//  Settings.swift
//  ApenaFreediving
//
//  Created by Jayce Sagvold on 7/1/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Freediving Resources")) {
                    NavigationLink(destination: FreediveInformation()) {
                        Label("Freedive Information", systemImage: "info.circle")
                    }
                }
                
                Section(header: Text("Resources & Support")) {

                    NavigationLink(destination: ContactDeveloperView()) {
                        Label("Contact Developer", systemImage: "hammer")
                    }
                    NavigationLink(destination: GuidanceView()) {
                        Label("How to Use ApenaFreediving", systemImage: "questionmark")
                    }

                    Link(destination: URL(string: "https://github.com/jasjs1/1Habit/issues/new?assignees=&labels=bug&projects=&template=BugReport.md&title=%5BBUG+REPORT%5D+-+")!) {
                        HStack(spacing: 22) {
                            Image(systemName: "link")
                            Text("Bug Report")
                                .foregroundColor(.black)
                        }
                    }

                    Link(destination: URL(string: "https://github.com/jasjs1/1Habit/issues/new?assignees=&labels=user-feedback&projects=&template=UserFeedback.md&title=%5BUSER+FEEDBACK%5D+-+")!) {
                        HStack(spacing: 22) {
                            Image(systemName: "link")
                            Text("Give App Feedback")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

