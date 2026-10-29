//
//  Create.swift
//  iClub
//
//  Created by TARUN on 29/10/26.
//
import SwiftUI

struct Create: View {
    
    @State private var title:String = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var location:String = ""
    @State private var isIntra = true
    @State private var text:String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.blue)
                    Text("Cancel")
                        .foregroundStyle(Color.blue)
                }
                Text("New Event")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle.bold())
                Text("Title")
                    .foregroundStyle(Color.gray)
                TextField("e.g. Robotics Demo Day", text: $title)
                    .colorInvert()
                    .foregroundStyle(Color.black)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                    .cornerRadius(10)
                Text("Date")
                    .foregroundStyle(Color.gray)
                DatePicker("", selection:$selectedDate, displayedComponents: [.date])
                    .colorInvert()
                    .foregroundStyle(Color.black)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                    .cornerRadius(10)
                Text("Time")
                    .foregroundStyle(Color.gray)
                DatePicker("", selection:$selectedTime,displayedComponents: [.hourAndMinute])
                    .colorInvert()
                    .foregroundStyle(Color.black)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                    .cornerRadius(10)
                Text("Location")
                    .foregroundStyle(Color.gray)
                TextField("Room / Venue", text: $location)
                    .colorInvert()
                    .foregroundStyle(Color.black)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                    .cornerRadius(10)
                Text("Type")
                    .foregroundStyle(Color.gray)
                HStack {
                    Text("Intra-collegiate")
                        .foregroundStyle(Color.white)
                        .frame(width: 170, height: 50)
                        .background(isIntra ? Color.purple : Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .onTapGesture {
                            isIntra = true
                        }
                    Text("Inter-collegiate")
                        .foregroundStyle(Color.white)
                        .frame(width: 170, height: 50)
                        .background(!isIntra ? Color.purple : Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .onTapGesture {
                            isIntra = false
                        }
                }
                Text("Description")
                    .foregroundStyle(Color.gray)
                TextEditor(text: $text)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 120)
                    .background(Color(white: 0.1))
                    .cornerRadius(10)
                    .scrollContentBackground(.hidden)

                Button(action: {
                    print("Event published!")
                }) {
                    Text("Publish Event")
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                        .frame(width: 350, height: 50)
                        .background(Color(red: 0.53, green: 0.47, blue: 1.0))
                        .cornerRadius(20)
                }
            }
            .padding(5)
        }
    }
}

#Preview {
    Create()
}

