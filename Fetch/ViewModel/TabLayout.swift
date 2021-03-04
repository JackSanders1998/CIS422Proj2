//
//  temporary.swift
//  Fetch
//
//  Created by Ronny on 3/4/21.
//

import SwiftUI

struct TabLayout: View {
    @State private var selection = 0
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }.tag(0)
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            DeckView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }.tag(0)
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            SwiftUIView()
                .tabItem {
                    Label("Matches", systemImage: "person.2.square.stack.fill")
                }.tag(0)
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
    }
}

struct temporary_Previews: PreviewProvider {
    static var previews: some View {
        TabLayout()
    }
}
