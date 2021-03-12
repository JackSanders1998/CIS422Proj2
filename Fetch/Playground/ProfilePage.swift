//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//
import SwiftUI
import FirebaseDatabase
import Firebase

struct ProfilePage: View {
    @State var name = ""
    @State var email = ""
    @State var dogname = ""
    @State var weight = ""
    @State var breed = ""
    @State var age = ""
    @State var year = 0
    
    @State var userSettings = UserSettings()
    @State private var previewIndex = 0
    @State private var previewIndex2 = 0
    private let database = Database.database().reference()
    @EnvironmentObject var session: SessionStore
    
    @State private var selection = 0
    var titleColor = Color(#colorLiteral(red: 0.7638114691, green: 0.2832764089, blue: 0.7193431258, alpha: 1))
    var backgroundColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var profileUIColor = UIColor(red: 0.75, green: 0.18, blue: 0.87, alpha: 1.00)
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: profileUIColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                VStack {
                    VStack {
                        Image("snow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 180)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .clipped()
                        Text("Edit").foregroundColor(.blue)
                    }
                    Form {
                        Section(header: Text("Profile")) {
                            HStack {
                            TextField("Username", text: $name)
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
                                 ["Owner": name as NSString,
                                  "UID": currentUser as NSString]
                                database.child("Users").child(currentUser).setValue(object)
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                   }
                            }
                            HStack {
                            TextField("Dog name", text: $dogname)
                            Button(action: {
                                var currentUser: String {
                                    var result: String
                                    let temp = Auth.auth().currentUser
//                                    let user_info = Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("Owner")
                                    if (temp?.email != nil) {
                                        result = temp!.uid
                                    } else {
                                        result = "nil"
                                    }
                                    return result
                                }

                                let object: [String: NSString] =
                                    ["Owner": name as NSString,
                                     "Dogname": dogname as NSString,
                                     "UID": currentUser as NSString]
                                database.child("Users").child(currentUser).setValue(object)
                                
                    
                                
                                
                                
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                   }
                            }
                            HStack {
                            Picker(selection: $previewIndex, label: Text("Breed")) {
                                    ForEach(0 ..< allBreeds.count) {
                                        Text(allBreeds[$0]).tag($0)
                                    }
                                
                            }
                                .onReceive([self.previewIndex].publisher.first()) { (value) in
                                    var currentUser: String {
                                        var result: String
                                        let temp = Auth.auth().currentUser
                                        self.breed = allBreeds[value]
                                        if (temp?.email != nil) {
                                            result = temp!.uid
                                        } else {
                                            result = "nil"
                                        }
                                        return result
                                    }
                                    let object: [String: Any] =
                                        ["Owner": name as NSString,
                                         "Dogname": dogname as NSString,
                                         "Breed": breed as NSString,
                                         "UID": currentUser as NSString]
                                    database.child("Users").child(currentUser).setValue(object)
                                }
                            }
                        }
                        Section(header: Text("Pet Bio")) {
                            TextField("Age", text: $age)
                            TextField("Weight", text: $weight)
                            Picker(selection: $previewIndex2, label: Text("Personality")) {
                                    ForEach(0 ..< activity.count) {
                                        Text(activity[$0])
                                    }
                            }
                        }
                        Section{
                    }
                }
                 .navigationBarItems(trailing: Button(action: session.signOut) {
                    Text("Sign out")
             })
                }
            }
        }
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage().environmentObject(SessionStore())
    }
}

