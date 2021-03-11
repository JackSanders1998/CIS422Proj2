//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI
import FirebaseDatabase
import Firebase

var owner: String = "Kyra"
var dogname: String = "Gus"
var breed: String = "Shepard"
var uid: String = "123"

var curr_owner: String = ""
var curr_dogname: String = ""
var curr_breed: String = ""
var curr_uid: String = ""

struct DeckView: View {
    
    let user_ref = Database.database().reference().child("Users")
    var currentUser: String {
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
                uid = userDict["UID"] as! String
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

    func display_profile() -> Any{
        user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = child.value as! [String: Any]
                //print(child.value ?? "")
                owner = userDict["Owner"] as! String
                dogname = userDict["Dogname"] as! String
                breed = userDict["Breed"] as! String
                uid = userDict["UID"] as! String
                if uid == currentUser {
                    print("Found current user, Name = \(owner)")
                    print("-----------------------")
                    continue
                }
                else {
                    //print("Current user is: \(currentUser)")
                    print("")
                    print("Meet \(dogname)!, a \(breed)")
                    print("Whose owner is \(owner)")
                    //print("(user id is \(uid))")
                    //print("Dog's Name = \(dogname)")
                    print("-----------------------")
                }
            }
        })
        return 1
    }
        
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    //Text("Hey \(curr_owner) and \(curr_dogname)")
                    Text("Meet \(owner)!")
                Button(action: {
                    print("inside button")
                    display_profile()
                    print("leaving button")
                }) {
                    Text("Let's Fetch!")
                   }
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
