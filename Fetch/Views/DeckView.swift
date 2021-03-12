//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//  EDITED BY KYRA AND CALLISTA 03/11
//

import SwiftUI
import FirebaseStorage
import Firebase
import FirebaseDatabase
import Foundation

struct DeckView: View {
    @State public var owner: String = "nil"
    @State public var dogname: String = "nil"
    @State public var breed: String = "nil"
//    @State public var img: Image = None
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
    
    @State public var more: String = "Show me some dogs!"
    
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
//    let storage = Storage.storage(url:"gs://fetch-app-b86d8.appspot.com/")
    let storage = Storage.storage()
    let storageRef = Storage.storage().reference()

//    let storageRef = storage.reference()
    
    func match(){

        if count == 0 {
            self.count += 1
            self.temp = userarray[count]
            self.temp1 = dognamearray[count]
            self.temp2 = breedarray[count]
        }
        else if count+1 <= userarray.count {
            database.child("Matches").child("\(currentUser)").child("\(count)").setValue("\(dognamearray[count])")
            
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
            database.child("Declines").child("\(currentUser)").child("\(count)").setValue("\(dognamearray[count])")
            
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
//        let user_img = Database.database().reference().child("1024.png")
//        let pathReference = storage.reference(withPath: "ProfilePictures/1024.png")
//        let imageView: UIImageView = self.imageView
        let imagesRef = storageRef.child("ProfilePictures")
        var spaceRef = storageRef.child("ProfilePictures/1024.png")
        let storagePath = "\("fetch-app-b86d8.appspot.com")/ProfilePictures/1024.png"
        spaceRef = storage.reference(forURL: storagePath)
        let rootRef = spaceRef.root()
        let profileRef = storageRef.child("ProfilePictures/1024.png")
        
        profileRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            print(image)
          }
        }
        dis_user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = child.value as! [String: Any]
                owner = userDict["Owner"] as! String
                dogname = userDict["Dogname"] as! String
                breed = userDict["Breed"] as! String
//                img = user_img as! Image
                uid = userDict["UID"] as! String
                
                //If current user, don't print
                if uid == currentUser {
//                    print(user_img)
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
            VStack {
                VStack {
                    /*
                    VStack {
                        Text(self.temp)
                        Text(self.temp1)
                        Text(self.temp2)
                    }
                    */
                    Button(action: {
                        display_profile()
                        more = "More dogs please!"
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
                        Text(more)
                            .padding(.leading, 270)
                    }.offset(x: -140, y: 330)
                    Text(self.temp)
                    Text(self.temp1)
                    Text(self.temp2)
                    Button(action: {
                            match()
                    }) {
                        Text("Match")
                            .foregroundColor(.green)
                            .padding()
                            .border(Color.green, width: 2)

                    }.buttonStyle(BorderlessButtonStyle()).offset(x: -140, y: 230)
                    Button(action: {
                            decline()
                    }) {
                        Text("Decline")
                            .foregroundColor(.red)
                            .padding()
                            .border(Color.red, width: 2)

                    }.buttonStyle(BorderlessButtonStyle()).offset(x: 135, y: 170)
                }.navigationTitle("Potential Friends")
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
