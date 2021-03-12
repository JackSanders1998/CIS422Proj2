//
//  MatchingView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import Foundation

struct MatchingView: View {
    @State public var curr_owner: String = ""
    @State public var curr_dogname: String = ""
    @State public var curr_breed: String = ""
    @State public var curr_uid: String = ""
    
    @State public var matcharray = [""]
    
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
                if result == currentUser {
                    curr_owner = userDict["Owner"] as! String
                    curr_dogname = userDict["Dogname"] as! String
                    curr_breed = userDict["Breed"] as! String
                    curr_uid = userDict["UID"] as! String
                    return
                }
            }
        })
        return result
    }
    
    //var count = 0
    func display_profile(){
        let dis_user_ref = Database.database().reference().child("Matches")
        dis_user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = Array(child.value)
                print(userDict)
                if child.key == currentUser {
                    //let children = Array(child.values)
                    //print(child.value as! String)
                }
                //if userDict["UID"] as! String == curr_uid {
                    //for match in userDict {
                      //  print(match.value)
                        //self.matcharray.append(match.value as! String)
                    //}
                //}
            }
        })
    }
    
    var body: some View {
            VStack {
                VStack {
                    Button(action: {
                        display_profile()
                    }){
                        Text("update")
                            .padding(.leading, 270)
                    }
                }
            }
        }
}

struct MatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingView()
    }
}
