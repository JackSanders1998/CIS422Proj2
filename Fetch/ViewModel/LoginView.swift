//
//  LoginScreen.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI

struct LoginView: View {
    // Main View: Aux functions below
    //
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var titleColor = Color(#colorLiteral(red: 0.6689291596, green: 0.2796352208, blue: 0.6291314363, alpha: 1))
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [customColor, Color.white]),
                 startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    VStack {
                        Text("Fetch")
                            .font(Font.custom("AppleSDGothicNeo-Thin", size: 80.0, relativeTo: .headline))
                            .bold()
                            .foregroundColor(titleColor)
                    }
                    TextFieldView(inputText: "Name")
                    TextFieldView(inputText: "Email")
                    pwFieldView(inputText: "Password")
                    SignupView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    Spacer()
                    VStack {
                        Text("Sign in")
                            .font(Font.custom("AppleSDGothicNeo-Bold", size: 20.0, relativeTo: .headline))
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct TextFieldView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var breed = ""
    @State private var password = ""
    @State var inputText = ""
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            TextField("", text: self.$name).foregroundColor(.white)
        }.padding()
        .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
        .cornerRadius(50)
        .opacity(0.9)
        .padding(.bottom, 9)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct pwFieldView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var breed = ""
    @State private var password = ""
    @State var inputText = ""
    
    var body: some View {
        HStack {
            Text("\(inputText):").padding(.trailing, 20)
                .foregroundColor(.white)
                .padding(.all, 7)
            SecureField("", text: self.$name).foregroundColor(.white)
        }.padding()
        .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
        .cornerRadius(50)
        .opacity(0.9)
        .padding(.bottom, 9)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct SignupView: View {
    var customButtonColor = Color(#colorLiteral(red: 0.7638114691, green: 0.2832764089, blue: 0.7193431258, alpha: 1))
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        HStack {
            Text("Sign up")
                .font(Font.custom("AppleSDGothicNeo-Thin", size: 40.0, relativeTo: .headline))
                .bold()
                .padding(.trailing, 40)

            NavigationLink(destination: TabLayout()) {
            Image(systemName: "arrowshape.turn.up.right.circle").resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(customButtonColor)
                .padding(.leading, 80)
            }
        }
//        HStack {
//            Text("Sign up")
//                .font(Font.custom("AppleSDGothicNeo-Thin", size: 40.0, relativeTo: .headline))
//                .bold()
//                .padding(.trailing, 40)
//            Button(action: {
//                self.presentationMode.wrappedValue.dismiss()
//            })  {
//                Image(systemName: "arrowshape.turn.up.right.circle").resizable()
//                    .frame(width: 50, height: 60)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(customButtonColor)
//                    .padding(.leading, 80)
//                }
//        }
//        .padding(.top, 10)
//        .padding(.bottom, 10)
//        .navigationBarTitle("")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
    }
}

