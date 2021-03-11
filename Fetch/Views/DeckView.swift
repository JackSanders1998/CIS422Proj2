//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import Foundation

//var owner: String = "Kyra"
//var dogname: String = "Gus"
//var breed: String = "Shepard"

struct DeckView: View {
    @State public var owner: String = "Kyra"
    @State public var dogname: String = "Gus"
    @State public var breed: String = "Shepard"
    @State public var userarray = [""]
    @State public var breedarray = [""]
    @State public var dognamearray = [""]
    @State var temp = "Press update user first"
    @State var temp1 = ""
    @State var temp2 = ""
    @State var count: Int = 1
    let user_ref = Database.database().reference().child("Users")
    
    //var count = 0
    func display_profile(){
        user_ref.observe(.value, with: {snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let userDict = child.value as! [String: Any]
                owner = userDict["Owner"] as! String
                dogname = userDict["Dogname"] as! String
                breed = userDict["Breed"] as! String
                print("Owner = \(owner)")
                print("Dog's name = \(dogname)")
                print("Breed = \(breed)")
                print("-----------------")
                self.userarray.append(owner)
                self.dognamearray.append(dogname)
                self.breedarray.append(breed)
                
                //print(child.value ?? "")
                //userarray.append(child.value)
            }
        })
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    Text("Deck View")
                    Button(action: {
                        print("Hello")
                        //print("textBinding: \(textBinding)")
                        display_profile()
                        
                    }){
                        Text("update")
                            .padding(.leading, 270)
                    }
                    Button(action: {
                        //print("User: \(userarray[0])")
                        print("User: \(userarray[1])")
                        print("Dog name: \(dognamearray[1])")
                        print("Breed: \(breedarray[1])")
                        //print("User: \(userarray[4])")
                        print("------------")
                        self.temp = userarray[count]
                        self.temp1 = dognamearray[count]
                        self.temp2 = breedarray[count]
                        //self.temp = userarray[count%3]
                        self.count += 1
                        
                        
                    }){
                        Text("show users")
                            .padding(.leading, 270)
                    }
                    Text(self.temp)
                    Text(self.temp1)
                    Text(self.temp2)
                }
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
