//
//  ContentView.swift
//  iClub
//
//  Created by TARUN on 13/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var selectedButton: String = ""
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:120)
                Text("iClub")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                Text("Every club event on campus, one place.")
                    .foregroundColor(.gray)
//                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundStyle(Color.white)
                        .frame(width: 350, height: 40)
                        .cornerRadius(10)
                    Text("Continue with Apple")
                        .font(.headline.bold())
                }
                VStack (spacing: 20) {
                    Text("or use email")
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                        .frame(width: 350, height: 40)
                        .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                        .frame(width: 350, height: 40)
                        .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                        .cornerRadius(10)
                }
                VStack (alignment: .leading, spacing: 20){
                    Text("I am a")
                        .foregroundColor(.gray)
//                        .padding(.horizontal)
                    HStack{
                        Button("Student") { selectedButton = "Student"
                        }
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(selectedButton == "Student" ? Color.indigo : Color(red: 28/255, green: 28/255, blue: 30/255))
                            .cornerRadius(10)

                        Button("Organizer") { selectedButton = "Organizer"
                        }
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(selectedButton == "Organizer" ? Color.indigo : Color(red: 28/255, green: 28/255, blue: 30/255))
                            .cornerRadius(10)
                        
                        Button("Admin") { selectedButton = "Admin"
                        }
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(selectedButton == "Admin" ? Color.indigo : Color(red: 28/255, green: 28/255, blue: 30/255))
                            .cornerRadius(10)
                    }
                    .padding(.leading)
                    Button("Sign In / Register") { selectedButton = "Sign In / Register"}
                        .foregroundStyle(Color.white)
                        .font(.headline.bold())
                        .frame(width: 350, height: 40)
                        .background(selectedButton == "Sign In / Register" ? Color.indigo : Color(red: 28/255, green: 28/255, blue: 30/255))
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
