//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionStore
    @State private var selection = 0
    var backgroundColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var profileUIColor = UIColor(red: 0.75, green: 0.18, blue: 0.87, alpha: 1.00)
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: profileUIColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("snow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500.0, height: 300.0, alignment: .top)
                    HStack {
                        Text("edit")
                        Image(systemName: "camera.fill")
                    }
                }
                
                Spacer()
                    Button(action: session.signOut) {
                        Text("Sign out")
                    }
            }.navigationBarTitle("Profile")
        }
    }
}
//    var body: some View {
//        TabView(selection: $selection) {
//            NavigationView {
//                ProfileView()
//                    .tabItem {
//                        Image(systemName: "briefcase")
//                        Text("Job Posting")
//                    }
//                    .tag(0)
//                SettingView()
//                    .tabItem  {
//                        Image("house.fill")
//                        Text("Home")
//                    }
//                    .tag(1)
//            }
//        }
//    }


//    var body: some View {
//        VStack {
//            NavigationView {
//                VStack {
//                    VStack {
//                        Image("snow")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 500.0, height: 300.0, alignment: .top)
//                    }
//
//                    VStack {
//                        TabView {
//                            SettingView()
//                                .tabItem {
//                                    Label("Setting", systemImage: "gearshape.fill")
//                                }
//
//                            DeckView()
//                                .tabItem {
//                                    Label("Home", systemImage: "house.fill")
//                                }
//
//                            MatchingView()
//                                .tabItem {
//                                    Label("Matches", systemImage: "person.2.square.stack.fill")
//                                }
//                        }
//                    }
//                }.navigationBarTitle("Profile", displayMode: .automatic)
//
////                .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

