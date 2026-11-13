//
//  ProfileView.swift
//  iClub
//
//  Created by TARUN on 13/11/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedRole = "Student"
    @State private var notificationsOn = true
    @State private var isGoing = true
    @State private var showAlert = false
    
    let roles = ["Student", "Organizer", "Admin"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Profile")
                    .font(.largeTitle.bold())
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Alex Sharma").font(.headline)
                        Text("alex@college.edu").font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    Circle()
                        .fill(.indigo)
                        .frame(width: 45, height: 45)
                        .overlay(Text("A").bold())
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                

                Text("ROLE (DEMO SWITCH)").font(.caption).foregroundColor(.gray)
                
                HStack {
                    ForEach(roles, id: \.self) { role in
                        Button(role) {
                            selectedRole = role
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(selectedRole == role ? .indigo : Color(.systemGray6))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    }
                }
                

                Toggle(isOn: $notificationsOn) {
                    VStack(alignment: .leading) {
                        Text("Push notifications").font(.headline)
                        Text("Reminders for events you RSVP to").font(.caption).foregroundColor(.gray)
                    }
                }
                .tint(.mint)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                

                Text("MY RSVPS").font(.caption).foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Inter-collegiate")
                        .font(.caption)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.orange.opacity(0.2))
                        .cornerRadius(10)
                    
                    HStack {
                        Text("Inter-College Design Jam").font(.headline)
                        Spacer()
                        Button(isGoing ? "✓ Going" : "+ RSVP") {
                            isGoing.toggle()
                        }
                        .foregroundColor(isGoing ? .mint : .gray)
                    }
                    
                    Text("Design Society · Sun, Sep 27 · 10:00 AM")
                        .font(.subheadline).foregroundColor(.gray)
                    
                    Text("📍 Studio Hall · \(isGoing ? 73 : 72) going")
                        .font(.subheadline).foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                

                Button("Sign out") {
                    showAlert = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .alert("Signed Out!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .padding()
        }
        .preferredColorScheme(.dark) 
    }
}

#Preview {
    ProfileView()
}
