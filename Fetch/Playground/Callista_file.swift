//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//
import SwiftUI
import FirebaseDatabase
import Firebase



struct pView: View {
    @State var name = ""
    @State var email = ""
    @State var dogname = ""
    @State var breed = ""
    //@State var userSettings = UserSettings()
    private let database = Database.database().reference()
    @EnvironmentObject var session: SessionStore
    
    @State private var selection = 0
    
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
                    HStack {
                        Text("Name:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$name).foregroundColor(.black)
                    }.padding()
                    .background(Color.blue)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    HStack {
                        Text("Dog Name:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$dogname).foregroundColor(.black)
                    }.padding()
                    
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    HStack {
                        Text("Breed:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: self.$breed).foregroundColor(.black)
                    }.padding()
                    
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
                    
                    // Add User info to our database (Firebase)
                    Button(action: {
                        
                        var currentUser: String {
                            var result: String
                            let temp = Auth.auth().currentUser
                            if (temp?.email != nil) {
                                result = temp!.uid
                            } else {
                                result = "nil"
                            }
                            return result
                        }
                        
                        let object: [String: NSString] =
                            ["Owner": "\(name)" as NSString, "Dogname": "\(dogname)" as NSString, "Breed": "\(breed)" as NSString, "UID": "\(currentUser)" as NSString]
                        database.child("Users").child("\(currentUser)").setValue(object)
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

struct pView_Previews: PreviewProvider {
    static var previews: some View {
        pView().environmentObject(SessionStore())
    }
}
