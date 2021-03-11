//
//  SessionStore.swift
//  Fetch
//
//  Created by Ronny on 3/8/21.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject {
    var change = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.change.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user  {
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        })
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("Couldn't sign out")
        }
    }
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
        ref.child("Users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                let Owner = dictionary["Owner"] as! String
                let Dogname = dictionary["Dogname"] as! String
                defaults.set(Owner, forKey: "OwnerKey")
                defaults.set(Dogname, forKey: "DogKey")
                onSuccess()
            }
        }) { (error) in
            onError(error)
        }
    }
    deinit {
        unbind()
    }
}

struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
}
