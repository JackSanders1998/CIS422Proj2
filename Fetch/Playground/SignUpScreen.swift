//
//  SignUpScreen.swift
//  Fetch
//
//  Created by Ronny on 3/9/21.
//

import SwiftUI
import Firebase

struct SignUpScreen: View {
    @State var email = ""
    @State var password = ""
    @State var error = ""
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) {(result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [customColor, Color.white]),
                 startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
            VStack {
                Text("Welcome")
                    .font(.system(size: 30, weight: .heavy))
                    .padding(.bottom, 5)
                Text("Please sign up to start fetching!")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                
                VStack {
                    emailTextField(inputText: "Email")
                        .padding(8)
                    passwordTextField(inputText: "Password")
                        .padding(8)
                        .padding(.bottom, 10)
                }.padding(.horizontal, 20)
                
                Button(action: signUp) {
                    Text("Create Account")
                        .fontWeight(.bold)
                        .padding()
                        .background(customColor)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(customColor, lineWidth: 5))
                    
                }
            
                if (error != "") {
                    Text(error)
                        .font(.system(size:15, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }
            }
                
            }
        }
    }


struct emailTextField: View {
    @State private var email = ""
    @State var inputText = ""
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            TextField("", text: $email).foregroundColor(.white)
        }.padding()
         .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
         .cornerRadius(50)
    }
}

struct passwordTextField: View {
    @State private var password = ""
    @State var inputText = ""
    
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            SecureField("", text: $password).foregroundColor(.white)
        }.padding()
         .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
         .cornerRadius(50)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
