//
//  AuthenticationView.swift
//  Fetch
//
//  Created by Ronny on 3/8/21.
//

import SwiftUI
import Firebase

struct signinview: View {
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @EnvironmentObject var session: SessionStore
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var titleColor = Color(#colorLiteral(red: 0.6689291596, green: 0.2796352208, blue: 0.6291314363, alpha: 1))
    var customButtonColor = Color(#colorLiteral(red: 0.7638114691, green: 0.2832764089, blue: 0.7193431258, alpha: 1))
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
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
                    
                    VStack {
                        Text("Fetch")
                            .font(Font.custom("AppleSDGothicNeo-Thin", size: 80.0, relativeTo: .headline))
                            .bold()
                            .foregroundColor(titleColor)
                            .padding(.top, 80)
                    }
                    
                    HStack {
                        Text("Email").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 7)
                        TextField("", text: self.$email).foregroundColor(.white)
                    }.padding()
                     .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                     .cornerRadius(50)
                     .padding(.bottom, 20)
                    
                    HStack {
                        Text("Password").padding(.trailing, 20)
                            .foregroundColor(.white)
                            .padding(.all, 7)
                        SecureField("", text: self.$password).foregroundColor(.white)
                    }.padding()
                     .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                     .cornerRadius(50)
                     .padding(.bottom, 20)
                    
                    HStack {
                        Text("Sign in")
                            Button(action: signIn) {
                                Image(systemName: "arrowshape.turn.up.right.circle").resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(customButtonColor)
                            }
                        if (error != "") {
                            Text(error)
                                .font(.system(size:15, weight: .semibold))
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    Spacer()
                    NavigationLink(destination: signupview()) {
                        HStack {
                            Text("Create an account")
                        }
                    
                    }
                
                }.padding(.horizontal, 20)
                
            }
        }
    
}


struct signupview: View {
    @State var email = ""
    @State var password = ""
    @State var error = ""
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var customButtonColor = Color(#colorLiteral(red: 0.7182822824, green: 0.2634641826, blue: 0.6803607941, alpha: 1))
    @EnvironmentObject var session: SessionStore
    
    func signup() {
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
            LinearGradient(gradient: Gradient(colors: [Color.white, customColor]),
             startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                Text("Welcome")
                    .font(.system(size: 30, weight: .heavy))
                    .padding(.bottom, 5)
                Text("Please sign up to start fetching!")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 15)
                HStack {
                    Text("Email").padding(.trailing, 20)
                        .foregroundColor(.white)
                        .padding(.all, 7)
                    TextField("", text: $email).foregroundColor(.white)
                }.padding()
                 .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                 .cornerRadius(50)
                
                HStack {
                    Text("Password").padding(.trailing, 20)
                        .foregroundColor(.white)
                        .padding(.all, 7)
                    SecureField("", text: $password).foregroundColor(.white)
                }.padding()
                 .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                 .cornerRadius(50)
                .padding(.bottom, 10)
                
                Button(action: signup) {
                    Text("Create Account")
                        .fontWeight(.bold)
                        .padding()
                        .background(customButtonColor)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(customButtonColor, lineWidth: 5))
                }
                if (error != "") {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
            }.padding(.horizontal, 20)
        }
        
    }
}

struct authview: View {
    var body: some View {
        NavigationView {
            signinview()
        }
    }
}

struct authview_Preview: PreviewProvider {
    static var previews: some View {
        authview().environmentObject(SessionStore())
    }
}




struct signupscreen: View {
    @State var email = ""
    @State var password = ""
    @State var error = ""
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    @EnvironmentObject var session: SessionStore
    
    func signup() {
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
                        emailtextfield(inputText: "Email")
                            .padding(8)
                        passwordtextfield(inputText: "Password")
                            .padding(8)
                            .padding(.bottom, 10)
                    }.padding(.horizontal, 20)
                    
                    Button(action: signup) {
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
                    Spacer()
                }
            }
        }
    }


struct emailtextfield: View {
    @State var email = ""
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

struct passwordtextfield: View {
    @State var password = ""
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
