//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//
import SwiftUI
import FirebaseDatabase
import Firebase



struct ProfileView: View {
    @State var name = ""
    @State var email = ""
    @State var dogname = ""
    @State var breed = ""
    @State var weight = 0
    @State var age = 0
    @State var userSettings = UserSettings()
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
                    HStack {
                        Text("Name:").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 4)
                        TextField("", text: $userSettings.name).foregroundColor(.black)
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
                        TextField("", text: self.$userSettings.dogname).foregroundColor(.black)
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
                        TextField("", text: self.$userSettings.breed).foregroundColor(.black)
                    }.padding()
                    .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 15)
                    
//                    HStack {
//                        Int("Age:").padding(.trailing, 20)
//                            .foregroundColor(.white)
//                            .padding(.all, 4)
//                        TextField(0, int: self.$userSettings.age).foregroundColor(.black)
//                    }.padding()
//                    .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
//                    .cornerRadius(50)
//                    .opacity(0.9)
//                    .padding(.leading, 20)
//                    .padding(.trailing, 20)
//                    .padding(.top, 15)
                    
                    
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
                            ["Owner": "\(userSettings.name)" as NSString,
                             "Dogname": "\(userSettings.dogname)" as NSString,
                             "Breed": "\(userSettings.breed)" as NSString,
                             
                            ]
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

// Struct below is used for perserving data in text fields
class UserSettings: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var breed: String {
        didSet {
            UserDefaults.standard.set(breed, forKey: "breed")
        }
    }
    
    @Published var dogname: String {
        didSet {
            UserDefaults.standard.set(dogname, forKey: "dogname")
        }
    }
    @Published var age: Int {
        didSet {
            UserDefaults.standard.set(age, forKey: "age")
        }
    }
    @Published var weight: Int {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }
    init() {
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
        self.breed = UserDefaults.standard.object(forKey: "breed") as? String ?? ""
        self.dogname = UserDefaults.standard.object(forKey: "dogname") as? String ?? ""
        self.age = UserDefaults.standard.object(forKey: "age") as? Int ?? 0
        self.weight = UserDefaults.standard.object(forKey: "weight") as? Int ?? 0

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(SessionStore())
    }
}

