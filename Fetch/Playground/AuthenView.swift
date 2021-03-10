//
//  AuthenticationView.swift
//  Fetch
//
//  Created by Ronny on 3/8/21.
//

import SwiftUI
import Firebase

struct SignInView: View {
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
        NavigationView {
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
                    textfieldView(inputText: "Email address")
                        .padding(.bottom, 20)
                    securefieldView(inputText: "Password")
                        .padding(.bottom, 20)
                    SigninButton()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    Spacer()
                    CreateAccountView()
                }.padding(.horizontal, 20)
            }
        }
    }
}

struct textfieldView: View {
    @State private var email = ""
    @State var inputText = ""
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            TextField("", text: self.$email).foregroundColor(.white)
        }.padding()
         .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
         .cornerRadius(50)
        
        
    }
}

struct securefieldView: View {
    @State private var password = ""
    @State var inputText = ""
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            SecureField("", text: self.$password).foregroundColor(.white)
        }.padding()
         .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
         .cornerRadius(50)
    }
}

struct AuthenView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var error = ""
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
        VStack {
            Text("Create account")
                .padding(.bottom, 10)
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
            
            Button(action: signup) {
                Text("create account")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
            
            if (error != "") {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
        }
        
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenView().environmentObject(SessionStore())
    }
}

struct AccountView: View {
    @State private var signupSheet = false
    var customButtonColor = Color(#colorLiteral(red: 0.7638114691, green: 0.2832764089, blue: 0.7193431258, alpha: 1))
    var body: some View {
        Button("Create an account") {
            self.signupSheet.toggle()
        }
        .sheet(isPresented: $signupSheet) {
            SignUpScreen()
        }
    }
        // NavigationLink(destination: SignUpView()) {
        //                        HStack {
        //                            Text("Create an account")
        //
        //                        }.navigationBarTitle("")
        //                        .navigationBarHidden(true)
        //                        .navigationBarBackButtonHidden(true)
        //                    }
}


struct SigninButton: View {
    var customButtonColor = Color(#colorLiteral(red: 0.7638114691, green: 0.2832764089, blue: 0.7193431258, alpha: 1))
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @EnvironmentObject var session: SessionStore
    
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
        HStack {
            Text("Sign in")
                .font(Font.custom("AppleSDGothicNeo-Thin", size: 40.0, relativeTo: .headline))
                .bold()
                .padding(.trailing, 150)

            Button(action: signIn) {
                Image(systemName: "arrowshape.turn.up.right.circle").resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(customButtonColor)
            }
        }
        if (error != "") {
            Text(error)
                .font(.system(size:15, weight: .semibold))
                .foregroundColor(.red)
                .padding()
        }
    }
}

