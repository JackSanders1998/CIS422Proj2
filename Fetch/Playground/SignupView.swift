//
//  SignupView.swift
//  Fetch
//
//  Created by Ronny on 3/4/21.
//

import SwiftUI

struct SignupView: View {
    @State private var NAME = ""
    @State private var email = ""
    @State private var breed = ""
    @State private var password = ""
    @State var inputText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        
                        Image("snow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .clipped()
                            .padding(.top, 40)
                        VStack {
                            Text("Edit").foregroundColor(.blue)
                                .padding(.bottom, 30)
                            
                        }
                        HStack {
                            Text("Login info")
                                .bold()
                            Spacer()
                        }.padding(.leading, 40)
                        
                        LoginCredentials(inputText: "Name")
                        LoginCredentials(inputText: "Email")
                        LoginCredentials(inputText: "Password")
                        HStack {
                            Text("update info")
                                .padding(.leading, 200)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Spacer()
                                
                        }.padding(.leading, 40)
                        
                        HStack {
                            Text("Matching Preferences")
                                .bold()
                                .padding(.top, 10)
                            Spacer()
                        }.padding(.leading, 40)
                        LoginCredentials(inputText: "breed")
                        LoginCredentials(inputText: "Age")
    //                    LoginCredentials(inputText: "Password")
                    }
                    Spacer()
                
                }
                Spacer()
    //            VStack {
    //                Text("hi")
    //            }
    //            Spacer()
    //            Spacer()
    //            Spacer()
                    
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

struct LoginCredentials: View {
    @State private var name = ""
    @State private var email = ""
    @State private var breed = ""
    @State private var age = ""
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
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
