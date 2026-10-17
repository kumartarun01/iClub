//
//  BottomBar.swift
//  iClub
//
//  Created by TARUN on 17/10/26.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        TabView {
            VStack {
                HomePage()
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Calendar")
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
            }
        }
    }
}

#Preview {
    BottomBar()
}
