//
//  ProfileView.swift
//  iClub
//
//  Created by TARUN on 13/11/26.
//

//import SwiftUI
//
//struct ProfileView: View {
//    @State private var selectedRole = "Student"
//    @State private var notificationsOn = true
//    @State private var isGoing = true
//    @State private var showAlert = false
//    
//    let roles = ["Student", "Organizer", "Admin"]
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                
//                Text("Profile")
//                    .font(.largeTitle.bold())
//                
//                HStack {
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text("Alex Sharma").font(.headline)
//                        Text("alex@college.edu").font(.subheadline).foregroundColor(.gray)
//                    }
//                    Spacer()
//                    Circle()
//                        .fill(.indigo)
//                        .frame(width: 45, height: 45)
//                        .overlay(Text("A").bold())
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(15)
//                
//
//                Text("ROLE (DEMO SWITCH)").font(.caption).foregroundColor(.gray)
//                
//                HStack {
//                    ForEach(roles, id: \.self) { role in
//                        Button(role) {
//                            selectedRole = role
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 10)
//                        .background(selectedRole == role ? .indigo : Color(.systemGray6))
//                        .foregroundColor(.white)
//                        .cornerRadius(20)
//                    }
//                }
//                
//
//                Toggle(isOn: $notificationsOn) {
//                    VStack(alignment: .leading) {
//                        Text("Push notifications").font(.headline)
//                        Text("Reminders for events you RSVP to").font(.caption).foregroundColor(.gray)
//                    }
//                }
//                .tint(.mint)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(15)
//                
//
//                Text("MY RSVPS").font(.caption).foregroundColor(.gray)
//                
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Inter-collegiate")
//                        .font(.caption)
//                        .foregroundColor(.orange)
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 4)
//                        .background(.orange.opacity(0.2))
//                        .cornerRadius(10)
//                    
//                    HStack {
//                        Text("Inter-College Design Jam").font(.headline)
//                        Spacer()
//                        Button(isGoing ? "✓ Going" : "+ RSVP") {
//                            isGoing.toggle()
//                        }
//                        .foregroundColor(isGoing ? .mint : .gray)
//                    }
//                    
//                    Text("Design Society · Sun, Sep 27 · 10:00 AM")
//                        .font(.subheadline).foregroundColor(.gray)
//                    
//                    Text("📍 Studio Hall · \(isGoing ? 73 : 72) going")
//                        .font(.subheadline).foregroundColor(.gray)
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(15)
//                
//
//                Button("Sign out") {
//                    showAlert = true
//                }
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(15)
//                .alert("Signed Out!", isPresented: $showAlert) {
//                    Button("OK", role: .cancel) { }
//                }
//            }
//            .padding()
//        }
//        .preferredColorScheme(.dark) 
//    }
//}
//
//#Preview {
//    ProfileView()
//}





import SwiftUI

struct ProfileView: View {

    @State private var selectedRole = "Student"
    @State private var notificationsOn = true
    @State private var showSignOutAlert = false

    let roles = ["Student", "Organizer", "Admin"]

    var body: some View {

        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {

                        // Heading
                        Text("Profile")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)

                        // User Profile
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Alex Sharma")
                                    .font(.title3)
                                    .bold()

                                Text("alex@college.edu")
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Circle()
                                .fill(Color.purple)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Text("A")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                        }
                        .padding()
                        .background(Color(white: 0.12))
                        .cornerRadius(20)

                        // Role Selection
                        Text("ROLE (DEMO SWITCH)")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)

                        HStack(spacing: 10) {

                            ForEach(roles, id: \.self) { role in

                                Button {

                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        selectedRole = role
                                    }

                                } label: {

                                    Text(role)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(
                                            selectedRole == role
                                            ? Color.purple
                                            : Color(white: 0.12)
                                        )
                                        .cornerRadius(15)
                                }
                            }
                        }

                        // Admin Only Section
                        if selectedRole == "Admin" {

                            VStack(alignment: .leading, spacing: 10) {

                                Text("Admin overview")
                                    .font(.title3)
                                    .bold()

                                Text("5 live events · 6 clubs · 1,240 students")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(white: 0.12))
                            .cornerRadius(20)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }

                        // Notifications
                        HStack {

                            VStack(alignment: .leading, spacing: 8) {

                                Text("Push notifications")
                                    .font(.title3)
                                    .bold()

                                Text("Reminders for events you RSVP to")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Toggle("", isOn: $notificationsOn)
                                .labelsHidden()
                                .tint(.green)
                        }
                        .padding()
                        .background(Color(white: 0.12))
                        .cornerRadius(20)

                        // My RSVPs
                        Text("MY RSVPS")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)

                        VStack(alignment: .leading, spacing: 12) {

                            Text("Inter-collegiate")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.orange)
                                .padding(6)
                                .overlay {
                                    Capsule()
                                        .stroke(Color.orange, lineWidth: 1)
                                }

                            HStack {

                                Text("Inter-College Design Jam")
                                    .font(.headline)
                                    .bold()

                                Spacer()

                                Text("✓ Going")
                                    .foregroundColor(.green)
                            }

                            Text("Design Society · Sun, Sep 27 · 10:00 AM")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text("📍 Studio Hall · 73 going")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(white: 0.12))
                        .cornerRadius(20)

                        // Sign Out
                        Button {
                            showSignOutAlert = true
                        } label: {

                            Text("Sign out")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(white: 0.12))
                                .cornerRadius(18)
                        }
                        .alert("Sign Out", isPresented: $showSignOutAlert) {

                            Button("Cancel", role: .cancel) { }

                            Button("Sign Out", role: .destructive) {
                                print("User Signed Out")
                            }

                        } message: {
                            Text("Are you sure you want to sign out?")
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                }

                // Bottom Role Status
                Text("Now viewing as \(selectedRole)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(white: 0.13))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .animation(.easeInOut, value: selectedRole)
            }
        }
    }
}

#Preview {
    ProfileView()
}


