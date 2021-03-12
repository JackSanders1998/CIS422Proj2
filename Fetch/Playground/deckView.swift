//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI

struct deckView: View {
//    @State var nameInEditMode = false
//    @State var dognameInEditMode = false
//    @State var breedInEditMode = false
//    @State var ageInEditMode = false
//    @State var weightInEditMode = false
    @State var edit: Bool = true
    @State var name: String = ""
    @State var dogname: String = ""
    @State var breed: String = ""
    @State var age: String = ""
    @State var weight: String = ""
    @State private var previewIndex = 0
    @State private var selection = 1

    
    var titleColor = Color(#colorLiteral(red: 0.6689291596, green: 0.2796352208, blue: 0.6291314363, alpha: 1))
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    Image("snow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .clipped()
                    Text("Edit").foregroundColor(.blue)
                }
                Form {
                    Section(header: Text("Profile")) {
                        TextField("Username", text: $name)
                        TextField("Dog name", text: $dogname)
                        Picker(selection: $previewIndex, label: Text("Breed")) {
                                ForEach(0 ..< allBreeds.count) {
                                    Text(allBreeds[$0])
                                }
                        }
                    }
                    Section(header: Text("Pet Bio")) {
                        TextField("Age", text: $age)
                        TextField("Weight", text: $weight)
                        Picker(selection: $previewIndex, label: Text("Personality")) {
                                ForEach(0 ..< activity.count) {
                                    Text(activity[$0])
                                }
                        }
                    }
//                    VStack {
//                    Button(action: {
//                        DeckView()
//                    }) {
//                        Text("Save")
//                            .fontWeight(.bold)
//                            .padding(.all, 17)
//                            .background(Color.purple)
//                            .cornerRadius(30)
//                            .foregroundColor(.white)
//                            .overlay(
//                             RoundedRectangle(cornerRadius: 30)
//                                .stroke(Color.purple, lineWidth: 5))
//                            .padding(.leading, 230)
//                       }
//                    }.listRowBackground(Color(UIColor.systemGroupedBackground))
                }
            }

        }
    }
}

//        VStack(alignment: .leading) {
//            Section(header: Text("Profile").foregroundColor(titleColor).font(.system(size: 30))) {
//                VStack(alignment: .leading) {
//
//                    HStack {
//                        Text("Owner:")
//                            .bold()
//                            .font(.system(size: 20))
//                           if nameInEditMode {
//                               TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
//                               .autocapitalization(.words)
//                               .disableAutocorrection(true)
//                           } else {
//                               Text(name).font(.system(size: 20))
//                           }
//
//                           Button(action: {
//                               self.nameInEditMode.toggle()
//                           }) {
//                               Text(nameInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                           }
//                    }.padding(.bottom, 20)
//
//                    HStack {
//                        Text("Dog Name:")
//                            .bold()
//                            .font(.system(size: 20))
//                           if dognameInEditMode {
//                               TextField("Dog name", text: $dogname).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
//                               .autocapitalization(.words)
//                               .disableAutocorrection(true)
//                           } else {
//                               Text(dogname).font(.system(size: 20))
//                           }
//                           Button(action: {
//                               self.dognameInEditMode.toggle()
//                           }) {
//                               Text(dognameInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                           }
//                    }.padding(.bottom, 20)
//
//                    HStack {
//                        Text("Breed:")
//                            .bold()
//                            .font(.system(size: 20))
//                           if breedInEditMode {
//                               TextField("Breed", text: $breed).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
//                               .autocapitalization(.words)
//                               .disableAutocorrection(true)
//                           } else {
//                               Text(breed).font(.system(size: 20))
//                           }
//
//                           Button(action: {
//                               self.breedInEditMode.toggle()
//                           }) {
//                               Text(breedInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                              }
//                    }.padding(.bottom, 20)
//                }
//                .frame(width: 370, height: 200, alignment: .center)
//
//            }
//            // SECTION 2
//            Section(header: Text("Pet Info").foregroundColor(titleColor).font(.system(size: 30))) {
//                VStack(alignment: .leading) {
//
//                    HStack {
//                        Text("Age:")
//                            .bold()
//                            .font(.system(size: 20))
//                           if ageInEditMode {
//                               TextField("Age", text: $age).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
//                               .autocapitalization(.words)
//                               .disableAutocorrection(true)
//                           } else {
//                               Text(age).font(.system(size: 20))
//                           }
//
//                           Button(action: {
//                               self.ageInEditMode.toggle()
//                           }) {
//                               Text(ageInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                           }
//                    }.padding(.bottom, 20)
//
//                    HStack {
//                        Text("Weight:")
//                            .bold()
//                            .font(.system(size: 20))
//                           if weightInEditMode {
//                               TextField("Weight", text: $weight).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
//                               .autocapitalization(.words)
//                               .disableAutocorrection(true)
//                           } else {
//                               Text(weight).font(.system(size: 20))
//                           }
//                           Button(action: {
//                               self.weightInEditMode.toggle()
//                           }) {
//                               Text(weightInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                           }
//                    }.padding(.bottom, 20)
//
//                    HStack {
//                        Text("Activity:")
//                            .bold()
//                            .font(.system(size: 20))
////                           if breedInEditMode {
////                               TextField("Breed", text: $breed).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
////                               .autocapitalization(.words)
////                               .disableAutocorrection(true)
////                           } else {
////                               Text(breed).font(.system(size: 20))
////                           }
//                            VStack {
//                                    Picker(selection: $selection, label: Text("Zeige Deteils")) {
//                                        Text("Schmelzpunkt").tag(1)
//                                        Text("Instrumentelle Analytik").tag(2)
//                                    }
//
//                           Button(action: {
//                               self.breedInEditMode.toggle()
//                           }) {
//                               Text(breedInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
//                                   .foregroundColor(Color.blue)
//                              }
//                    }.padding(.bottom, 20)
//                }
//                .frame(width: 370, height: 200, alignment: .center)
//
//
//            }
//        }
//    }
//}

struct deckView_Previews: PreviewProvider {
    static var previews: some View {
        deckView()
    }
}
