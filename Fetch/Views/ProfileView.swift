//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI
import FirebaseDatabase

struct ProfileView: View {
    @State var name = ""
    @State var email = ""
    @State var dogname = ""
    @State var breed = ""
    private let database = Database.database().reference()

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
//                    Image("snow")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 500.0, height: 300.0, alignment: .top)
//                    HStack {
//                        Text("edit")
//                    }
                    HStack {
                        Text("Name:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$name).foregroundColor(.white)
                    }.padding()
                    .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    HStack {
                        Text("Dog Name:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$dogname).foregroundColor(.white)
                    }.padding()
                    .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    HStack {
                        Text("Breed:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$breed).foregroundColor(.white)
                    }.padding()
                    .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    // Add User info to our database (Firebase)
                    Button(action: {
                        let object: [String: NSString] =
                            ["Dogname": "\(dogname)" as NSString, "Breed": "\(breed)" as NSString]
                        database.child("\(name)").setValue(object)
                    }) {
                        Text("update")
                            .padding(.leading, 270)
                       }
                }
                
                Spacer()
            }.navigationBarTitle("Profile")
             .navigationBarItems(trailing: Button(action: session.signOut) {
                Text("Sign out")
            })
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(SessionStore())
    }
}

