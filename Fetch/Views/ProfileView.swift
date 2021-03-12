//
//  ProfileView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//
import SwiftUI
import FirebaseDatabase
import FirebaseStorage
import Firebase

struct ProfileView: View {
    private let database = Database.database().reference()
    @EnvironmentObject var session: SessionStore
    @State var name = ""
    @State var email = ""
    @State var dogname = ""
    @State var age = ""
    @State var weight = ""
    @State var activity = ""
    @State var userSettings = UserSettings()
    @State var isShown: Bool = false
    @State var image: Image?
    @State var sourceType: Int = 0
    @State var showActionSheet: Bool = false
    @State private var selection = 0
    var titleColor = Color(#colorLiteral(red: 0.6261639836, green: 0.2293635575, blue: 0.5936303033, alpha: 1))
    var backgroundColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var profileUIColor = UIColor(red: 0.75, green: 0.18, blue: 0.87, alpha: 1.00)
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: profileUIColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, customColor]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                ScrollView {
                    // STACK BELOW WILL INCLUDE PROFILE PICTURE AND BASIC INFORMATION TEXT FIELDS
                    VStack {
                            image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .overlay(CameraButton(showActionSheet: $showActionSheet)
                                            .offset(x: 50, y: 65))
                        VStack {
                            Text("Basic Info")
                                .font(.system(size:20, weight: .bold))
                                .padding(.top, 10)
                                .padding(.trailing, 240)
                                
                            HStack {
                                Text("Name:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: $userSettings.name).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            
                            HStack {
                                Text("Dog Name:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: self.$userSettings.dogname).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            
                            HStack {
                                Text("Breed:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: self.$userSettings.breed).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            // Add User info to our database (Firebase)

                        }
                        // STACK BELOW WILL INCLUDE PET BIO
                        VStack {
                            Text("Pet Bio")
                                .font(.system(size:20, weight: .bold))
                                .padding(.top, 30)
                                .padding(.trailing, 280)
                                
                            HStack {
                                Text("Age:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: self.$userSettings.age).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            
                            HStack {
                                Text("Weight:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: self.$userSettings.weight).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            
                            HStack {
                                Text("Personality:").padding(.trailing, 20)
                                    .foregroundColor(.white)
                                    .padding(.all, 4)
                                TextField("", text: self.$userSettings.personality).foregroundColor(.white)
                            }.padding()
                            .background(Color(#colorLiteral(red: 0.4693555236, green: 0.4665696621, blue: 0.4714997411, alpha: 1))).opacity(0.6)
                            .cornerRadius(50)
                            .opacity(0.9)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                            // Add User info to our database (Firebase)
                            Button(action: {
                                var currentUser: String {
                                    var result: String
                                    let temp = Auth.auth().currentUser
                                    if (temp?.email != nil) {
                                        result = temp!.uid
                                    } else {
                                        result = "nil"
                                    }
                                    return result
                                }
                                let newAge = NSInteger(userSettings.age)
                                let newWeight = NSInteger(userSettings.weight)
                                let object: [String: Any] =
                                    ["Owner": userSettings.name as NSString,
                                     "Dogname": userSettings.dogname as NSString,
                                     "Age": (newAge ?? 0) as NSInteger,
                                     "Weight": (newWeight ?? 0) as NSInteger,
                                     "Personality": userSettings.personality as NSString,
                                     "UID": currentUser as NSString,
                                     "Breed": userSettings.breed as NSString]
                                database.child("Users").child(currentUser).setValue(object)
                            }) {
                                Text("update")
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(titleColor)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .padding(.leading, 280)
                               }
                        }
                        Spacer()
                    }.actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                        ActionSheet(title: Text("Select Image"), message: Text("Please select an image or take one"),
                                    buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                                        self.sourceType = 0
                                        self.isShown.toggle()
                                    }),
                                    ActionSheet.Button.default(Text("Photo Gallery"), action: {
                                        self.sourceType = 1
                                        self.isShown.toggle()
                                    }),
                                    ActionSheet.Button.cancel()
                                    ])
                })
                }
                if isShown {
                    imagePicker(isVisible: $isShown, image: $image, sourceType: sourceType)
                }
            }
            .navigationBarItems(
                leading: Text("Profile")
                    .foregroundColor(titleColor)
                    .font(.system(size:35))
                    .bold(),
                trailing: Button(action: session.signOut) {
               Text("Sign out")
                .font(.system(size: 20))
                .bold()
            })
            
            
          
        }.onAppear { self.image = Image("snow") }
    }
}

// Struct below is used for perserving data in text fields
class UserSettings: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var breed: String {
        didSet {
            UserDefaults.standard.set(breed, forKey: "breed")
        }
    }
    
    @Published var dogname: String {
        didSet {
            UserDefaults.standard.set(dogname, forKey: "dogname")
        }
    }
    
    @Published var age: String {
        didSet {
            UserDefaults.standard.set(age, forKey: "age")
        }
    }
    
    @Published var weight: String {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }
    
    @Published var personality: String {
        didSet {
            UserDefaults.standard.set(personality, forKey: "personality")
        }
    }
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
        self.breed = UserDefaults.standard.object(forKey: "breed") as? String ?? ""
        self.dogname = UserDefaults.standard.object(forKey: "dogname") as? String ?? ""
        self.age = UserDefaults.standard.object(forKey: "age") as? String ?? ""
        self.weight = UserDefaults.standard.object(forKey: "weight") as? String ?? ""
        self.personality = UserDefaults.standard.object(forKey: "personality") as? String ?? ""
    }
}
// Struct is just to preview current page in Xcode
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(SessionStore())
    }
}

// struct below is just for the camera icon
struct CameraButton: View {
    @Binding var showActionSheet: Bool
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
            }) {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 38, height: 38, alignment: .center)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                        .overlay(Image(systemName: "camera.fill")
                            .foregroundColor(.black)
                        )
            )
        }
    }
}

//struct below includes functionality for Camera and user library
struct imagePicker: UIViewControllerRepresentable {
    @Binding var isVisible: Bool
    @Binding var image: Image?
    var sourceType: Int = 0
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisible: $isVisible, image: $image)
    }
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.sourceType = sourceType == 1 ? .photoLibrary : .camera
        
        vc.delegate = context.coordinator

        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var isVisible: Bool
        @Binding var image: Image?
        
        init(isVisible: Binding<Bool>, image: Binding<Image?>) {
            _isVisible = isVisible
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiimage)
            isVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisible = false
        }
    }
}

