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
    
    @State public var matcharray = []
    
    //Figuring out who the current user is
    var matches_currentUser: String {
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
                if result == matches_currentUser {
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
    func matches_display_profile(){
        matcharray = []
        let dis_user_ref = Database.database().reference().child("Matches")
        dis_user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                //print("value = \(value)")
                if child.key == matches_currentUser {
                    print("Found current user, locating matches...")
                    let childcount = child.childrenCount
                    for match in 1..<childcount+1 {
                        //print(child.childSnapshot(forPath: "\(match)").value!)
                        let tempmatch: NSString = child.childSnapshot(forPath: "\(match)").value as! NSString
                        //print(tempmatch)
                        let newtempmatch: String = tempmatch as String
                        //print("newtempmatch: \(newtempmatch)")
                        //print(type(of: child.childSnapshot(forPath: "\(match)").value!))
                        matcharray.append(newtempmatch)
                    }
                    //var data = child.val()
                }
            }
        })
    }
    
    var body: some View {
            VStack {
                VStack {
                    Button(action: {
                        matches_display_profile()
                        let secondsToDelay = 0.7
                        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                            //print(matcharray.count)
                            print(matcharray)
                        }
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
