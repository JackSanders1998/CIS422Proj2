//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//  EDITED BY KYRA AND CALLISTA 03/11
//

//import SwiftUI
//import Firebase
//import FirebaseDatabase
//import Foundation
//
//struct HomeView: View {
//    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
//    @State public var owner: String = "nil"
//    @State public var dogname: String = "nil"
//    @State public var breed: String = "nil"
//    @State public var uid: String = "nil"
//
//    @State public var curr_owner: String = ""
//    @State public var curr_dogname: String = ""
//    @State public var curr_breed: String = ""
//    @State public var curr_uid: String = ""
//
//    @State public var userarray = [""]
//    @State public var breedarray = [""]
//    @State public var dognamearray = [""]
//
//    @State var temp = ""
//    @State var temp1 = ""
//    @State var temp2 = ""
//    @State var count: Int = 0
//
//    @State public var more: String = "Show me some dogs!"
//
//    //Figuring out who the current user is
//    var currentUser: String {
//        let user_ref = Database.database().reference().child("Users")
//        var result: String
//        let temp = Auth.auth().currentUser
//        if (temp?.email != nil) {
//            result = temp!.uid
//        } else {
//            result = "nil"
//        }
//        user_ref.observe(.value, with: {snapshot in
//            for child in snapshot.children.allObjects as! [DataSnapshot] {
//                let userDict = child.value as! [String: Any]
//                self.uid = userDict["UID"] as! String
//                if result == currentUser {
//                    curr_owner = userDict["Owner"] as! String
//                    curr_dogname = userDict["Dogname"] as! String
//                    curr_breed = userDict["Breed"] as! String
//                    return
//                }
//            }
//        })
//        return result
//    }
//
//    let database = Database.database().reference()
//
//    func match(){
//
//        if count == 0 {
//            self.count += 1
//            self.temp = userarray[count]
//            self.temp1 = dognamearray[count]
//            self.temp2 = breedarray[count]
//        }
//        else if count+1 <= userarray.count {
//            database.child("Matches").child("\(currentUser)").child("\(count)").setValue("\(dognamearray[count])")
//
//            print("count = \(count)")
//            print("User: \(userarray[count])")
//            print("Dog name: \(dognamearray[count])")
//            print("Breed: \(breedarray[count])")
//            //print("User: \(userarray[4])")
//            print("------------")
//            self.count += 1
//            if count < userarray.count{
//                self.temp = userarray[count]
//                self.temp1 = dognamearray[count]
//                self.temp2 = breedarray[count]
//                //self.temp = userarray[count%3]
//                //self.count += 1
//            }
//        }
//        if count >= userarray.count {
//            self.temp = "End of Deck"
//            self.temp1 = ""
//            self.temp2 = ""
//        }
//    }
//
//
//    func decline(){
//
//        if count == 0 {
//            self.count += 1
//            self.temp = userarray[count]
//            self.temp1 = dognamearray[count]
//            self.temp2 = breedarray[count]
//        }
//        else if count+1 <= userarray.count {
//            database.child("Declines").child("\(currentUser)").child("\(count)").setValue("\(dognamearray[count])")
//
//            print("count = \(count)")
//            print("User: \(userarray[count])")
//            print("Dog name: \(dognamearray[count])")
//            print("Breed: \(breedarray[count])")
//            //print("User: \(userarray[4])")
//            print("------------")
//            self.count += 1
//            if count < userarray.count{
//                self.temp = userarray[count]
//                self.temp1 = dognamearray[count]
//                self.temp2 = breedarray[count]
//                //self.temp = userarray[count%3]
//                //self.count += 1
//            }
//        }
//        if count >= userarray.count {
//            self.temp = "End of Deck"
//            self.temp1 = ""
//            self.temp2 = ""
//        }
//    }
//
//    //var count = 0
//    func display_profile(){
//        let dis_user_ref = Database.database().reference().child("Users")
//        dis_user_ref.observe(.value, with: {snapshot in
//            for child in snapshot.children.allObjects as! [DataSnapshot] {
//                let userDict = child.value as! [String: Any]
//                owner = userDict["Owner"] as! String
//                dogname = userDict["Dogname"] as! String
//                breed = userDict["Breed"] as! String
//                uid = userDict["UID"] as! String
//
//                //If current user, don't print
//                if uid == currentUser {
//                    print("Found current user, Name = \(owner)")
//                    print("-----------------------")
//                    continue
//                }
//
//                else {
//                    print("Owner = \(owner)")
//                    print("Dog's name = \(dogname)")
//                    print("Breed = \(breed)")
//                    print("-----------------")
//                    self.userarray.append(owner)
//                    self.dognamearray.append(dogname)
//                    self.breedarray.append(breed)
//                }
//            }
//        })
//    }
//
//
//            }
//    }
//}
//
//struct DeckView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
//



//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//  EDITED BY KYRA AND CALLISTA 03/11
//

import SwiftUI
import Firebase
import FirebaseDatabase
import Foundation

struct HomeView: View {
    var profileUIColor = UIColor(red: 0.75, green: 0.18, blue: 0.87, alpha: 1.00)
    var titleColor = Color(#colorLiteral(red: 0.6261639836, green: 0.2293635575, blue: 0.5936303033, alpha: 1))
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    @State public var owner: String = "nil"
    @State public var dogname: String = "nil"
    @State public var breed: String = "nil"
    @State public var uid: String = "nil"
    
    @State public var curr_owner: String = ""
    @State public var curr_dogname: String = ""
    @State public var curr_breed: String = ""
    @State public var curr_uid: String = ""
    
    @State public var userarray = [""]
    @State public var breedarray = [""]
    @State public var dognamearray = [""]
    
    @State var temp = ""
    @State var temp1 = ""
    @State var temp2 = ""
    @State var count: Int = 0
    
    @State var matches_count: Int = 1
    @State var declines_count: Int = 1
    @State public var more: String = "Show me some dogs!"
    
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: profileUIColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    //Figuring out who the current user is
    var currentUser: String {
        let user_ref = Database.database().reference().child("Users")
        var result: String
        let temp = Auth.auth().currentUser
        if (temp?.email != nil) {
            result = temp!.uid
        } else {
            result = "nil"
        }
        user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = child.value as! [String: Any]
                self.uid = userDict["UID"] as! String
                if result == currentUser {
                    curr_owner = userDict["Owner"] as! String
                    curr_dogname = userDict["Dogname"] as! String
                    curr_breed = userDict["Breed"] as! String
                    return
                }
            }
        })
        return result
    }
    
    let database = Database.database().reference()
    
    func match(){

        if count == 0 {
            self.count += 1
            self.temp = userarray[count]
            self.temp1 = dognamearray[count]
            self.temp2 = breedarray[count]
        }
        else if count+1 <= userarray.count {
            database.child("Matches").child("\(currentUser)").child("\(matches_count)").setValue("\(dognamearray[count])")
            matches_count+=1
            print("count = \(count)")
            print("User: \(userarray[count])")
            print("Dog name: \(dognamearray[count])")
            print("Breed: \(breedarray[count])")
            //print("User: \(userarray[4])")
            print("------------")
            self.count += 1
            if count < userarray.count{
                self.temp = userarray[count]
                self.temp1 = dognamearray[count]
                self.temp2 = breedarray[count]
                //self.temp = userarray[count%3]
                //self.count += 1
            }
        }
        if count >= userarray.count {
            self.temp = "End of Deck"
            self.temp1 = ""
            self.temp2 = ""
        }
    }
    

    func decline(){

        if count == 0 {
            self.count += 1
            self.temp = userarray[count]
            self.temp1 = dognamearray[count]
            self.temp2 = breedarray[count]
        }
        else if count+1 <= userarray.count {
            database.child("Declines").child("\(currentUser)").child("\(declines_count)").setValue("\(dognamearray[count])")
            declines_count += 1
            print("count = \(count)")
            print("User: \(userarray[count])")
            print("Dog name: \(dognamearray[count])")
            print("Breed: \(breedarray[count])")
            //print("User: \(userarray[4])")
            print("------------")
            self.count += 1
            if count < userarray.count{
                self.temp = userarray[count]
                self.temp1 = dognamearray[count]
                self.temp2 = breedarray[count]
                //self.temp = userarray[count%3]
                //self.count += 1
            }
        }
        if count >= userarray.count {
            self.temp = "End of Deck"
            self.temp1 = ""
            self.temp2 = ""
        }
    }
    
    //var count = 0
    func display_profile(){
        let dis_user_ref = Database.database().reference().child("Users")
        dis_user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = child.value as! [String: Any]
                owner = userDict["Owner"] as! String
                dogname = userDict["Dogname"] as! String
                breed = userDict["Breed"] as! String
                uid = userDict["UID"] as! String
                
                //If current user, don't print
                if uid == currentUser {
                    print("Found current user, Name = \(owner)")
                    print("-----------------------")
                    continue
                }
                
                else {
                    print("Owner = \(owner)")
                    print("Dog's name = \(dogname)")
                    print("Breed = \(breed)")
                    print("-----------------")
                    self.userarray.append(owner)
                    self.dognamearray.append(dogname)
                    self.breedarray.append(breed)
                }
            }
        })
    }
    
    var body: some View {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white]),
                        startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea(.all)
                    VStack{
                        VStack {
                            Spacer()
                            deckPicture()
                            Text(self.temp)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Text(self.temp1)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Text(self.temp2)
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        HStack {
                            // MATCH BUTTON
                            Button(action: {
                                    match()
                            }) {
                                Image(systemName: "heart")
                                    .font(Font.system(size: 30, weight: .semibold))
                                    .padding(.all, 22)
                                    .foregroundColor(.white)
                                    .scaledToFill()
                                    .background(Color.green)
                                    .border(Color.green)
                                    .cornerRadius(50)

                            }
                            // CENTER BUTTON
                            Button(action: {
                                display_profile()
                                let secondsToDelay = 0.7
                                DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                                    if count == 0 {
                                        count += 1
                                    }
                                    self.temp = userarray[count]
                                    self.temp1 = dognamearray[count]
                                    self.temp2 = breedarray[count]
                                }
                                }){
                                    Image(systemName: "arrow.clockwise")
                                        .font(Font.system(size: 30, weight: .semibold))
                                        .padding(.all, 22)
                                        .padding(.top, 0)
                                        .foregroundColor(.white)
                                        .scaledToFill()
                                        .background(customColor)
                                        .cornerRadius(50)
                            }.padding(.leading, 30)
                             .padding(.trailing, 30)

                            
                            // DECLINE BUTTON
                            Button(action: {
                                    decline()
                            }) {
                                Image(systemName: "multiply")
                                    .font(Font.system(size: 30, weight: .bold))
                                    .padding(.all, 25)
                                    .foregroundColor(.white)
                                    .scaledToFill()
                                    .background(Color.red)
                                    .border(Color.green)
                                    .cornerRadius(50)
                            }
                        }.padding(.bottom, 30)
                        .navigationBarItems(
                            leading: Text("Deck")
                                .foregroundColor(titleColor)
                                .font(.system(size:35))
                                .bold(),
                            trailing: Image(systemName:"bubble.left.and.bubble.right.fill")
                                .foregroundColor(customColor)
                                .font(Font.system(size: 30, weight: .bold))
                                .padding(.leading, 25)
                                .foregroundColor(.white)
                                .scaledToFill()
                            )
                        
//                    }.navigationTitle("Matching")
                    }
                }
            }
    }
}

struct deckPicture: View {
    var cardColor = Color(#colorLiteral(red: 0.512927413, green: 0.6070608497, blue: 0.657833159, alpha: 1))
    var body: some View {
        VStack {
            Button(action: {
                print("temporary")
                }) {
                RoundedRectangle(cornerRadius: 25)
                    .opacity(0.3)
                    .frame(width: 420, height: 480, alignment: .center)
                    .foregroundColor(cardColor)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                        .overlay(Image("snow")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400.0, height: 400.0, alignment: .top)
                                    .padding(.bottom, 80)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 380, height: 300)
//                        .foregroundColor(.black)
                        )
                    )
                    .overlay(Text("Luna, 4")
                                .foregroundColor(.black)
                                .bold()
                                .frame(width: 130, height: 50)
//                                .background(Color.black)
                                .padding(.top, 370)
                                .padding(.leading, 50)
                                .padding(.trailing, 300)
                                .font(.system(size: 35))
                                
                                )
                                
            }
//            Text("Luna")
//                .bold()
//                .padding(.top, 5)
//                .padding(.trailing, 300)
//                .font(.system(size: 35))
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
