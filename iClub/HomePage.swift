//
//  HomePage.swift
//  iClub
//
//  Created by TARUN on 17/10/26.
//

import SwiftUI

struct HomePage: View {
    
    @State private var selected = "All"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView(.vertical) {
                Text("Hello, Alex 👋")
                    .foregroundStyle(Color.gray)
                Text("Upcoming")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle.bold())
                HStack(spacing:10){
                    ForEach(["All", "Intra-college", "Inter-college"], id: \.self) { text in
                                    Text(text)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(selected == text ? Color.purple : Color.gray.opacity(0.2))
                                        .cornerRadius(20)
                                        .onTapGesture { selected = text }
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}



