import SwiftUI

struct ProfileView: View {
    @StateObject private var profileViewModel = ProfileViewModel()
    @Environment(\.dismiss) private var dismiss
    @State var editName = ""
    @State var editProfile = false
    @State var editClassId = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @State var next = false
    var user: UserData?
    
    @State var profileImage: Image? = Image(systemName: "person.crop.circle.fill")
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
            ZStack {
                if editProfile {
                    Color.black.opacity(0.01)
                }
                VStack() {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    }
                    .offset(x:-155,y: -30)
                    VStack {
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .foregroundColor(.fileUpload)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 100).weight(.regular))
                                .foregroundColor(.fileUpload)
                        }
                        if let user = user {
                            HStack {
                                Text("\(user.studentNumber)")
                                Text(user.name)
                            }
                            .font(.system(size: 24).weight(.medium))
                            
                        }
                        
                        Button {
                            editProfile = true
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 135,height: 35)
                                .foregroundColor(.white)
                                .shadow(radius: 5,y: 3).opacity(0.4)
                                .overlay {
                                    Text("프로필 수정")
                                        .font(.system(size: 15).weight(.regular))
                                        .foregroundColor(.black)
                                }
                        }
                        Spacer().frame(height: 40)
                        
                        VStack(alignment:.leading,spacing: 7) {
                            Text("내 정보").font(.system(size: 20).weight(.medium))
                                .padding(.leading,10)
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.secondary,lineWidth: 0.3)
                                .frame(width: 344,height: 100)
                                .overlay {
                                    VStack(alignment:.leading) {
                                        NavigationLink {
                                            MyPostView()
                                        } label: {
                                            HStack {
                                                Text("내 글")
                                                    .font(.system(size: 18).weight(.regular))
                                                    .foregroundColor(.black)
                                                    .padding(.leading,20)
                                                
                                                Spacer().frame(width: 260)
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 20).weight(.regular))
                                                    .foregroundColor(.black)
                                                
                                            }
                                        }
                                        
                                        
                                        Rectangle()
                                            .frame(width: 344,height: 0.4)
                                            .foregroundColor(.secondary).opacity(0.4)
                                            .padding(.vertical,2)
                                        NavigationLink  {
                                            MyCommenView()
                                        } label: {
                                            HStack {
                                                Text("내 댓글")
                                                    .font(.system(size: 18).weight(.regular))
                                                    .foregroundColor(.black)
                                                    .padding(.leading,20)
                                                    .padding(.top,5)
                                                Spacer().frame(width: 245)
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 20).weight(.regular))
                                                    .foregroundColor(.black)
                                                    .padding(.top,5)
                                            }
                                        }
                                        
                                        
                                    }
                                    
                                }
                            
                            Spacer().frame(height: 40)
                            
                            Text("설정").font(.system(size: 20).weight(.medium))
                                .padding(.leading,10)
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.secondary,lineWidth: 0.3)
                                .frame(width: 344,height: 200)
                                .overlay {
                                    VStack {
                                        Rectangle()
                                            .frame(width: 344,height: 0.3)
                                            .foregroundColor(.secondary)
                                            .padding(.vertical,2)
                                            .overlay(alignment:.leading) {
                                                NavigationLink {
                                                    MainView()
                                                } label: {
                                                    HStack {
                                                        Text("개인정보 처리약관")
                                                            .font(.system(size: 18).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.leading,20)
                                                        
                                                        Spacer().frame(width: 167)
                                                        Image(systemName: "chevron.right")
                                                            .font(.system(size: 20).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.top,1)
                                                    }.padding(.bottom,47)
                                                }
                                                
                                            }
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 344,height: 0.3)
                                            .foregroundColor(.secondary)
                                            .padding(.vertical,2)
                                            .overlay(alignment:.leading) {
                                                NavigationLink {
                                                    MainView()
                                                } label: {
                                                    HStack {
                                                        Text("이용약관")
                                                            .font(.system(size: 18).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.leading,20)
                                                        
                                                        Spacer().frame(width: 235)
                                                        Image(systemName: "chevron.right")
                                                            .font(.system(size: 20).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.top,2)
                                                    }.padding(.bottom,48)
                                                }
                                                
                                            }
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 344,height: 0.3)
                                            .foregroundColor(.secondary)
                                            .padding(.vertical,2)
                                            .overlay(alignment:.leading) {
                                                NavigationLink {
                                                    MainView()
                                                } label: {
                                                    HStack {
                                                        Text("로그아웃")
                                                            .font(.system(size: 18).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.leading,10)
                                                        Spacer().frame(width: 235)
                                                        Image(systemName: "chevron.right")
                                                            .font(.system(size: 20).weight(.regular))
                                                            .foregroundColor(.black)
                                                            .padding(.top,2)
                                                    }.padding(.bottom,5)
                                                }
                                                .frame(height: 40)
                                                .offset(y:-22)
                                                
                                                
                                                ZStack {
                                                    Button {
                                                        //
                                                    } label: {
                                                        HStack {
                                                            Text("회원탈퇴")
                                                                .font(.system(size: 18).weight(.regular))
                                                                .foregroundColor(.red)
                                                                .padding(.leading, 20)
                                                                .padding(.top, 2)
                                                            Spacer()
                                                            Image(systemName: "chevron.right")
                                                                .font(.system(size: 20).weight(.regular))
                                                                .foregroundColor(.black)
                                                                .padding(.top, 2)
                                                                .padding(.trailing, 12)
                                                        }
                                                        .padding(.top, -2)
                                                    }
                                                }
                                                .frame(height: 40)
                                                .offset(y: 24)
                                                
                                                
                                            }
                                        
                                        
                                        
                                    }.padding(.vertical,48)
                                }
                        }
                    }.offset(y:2)
                    NavigationLink(destination: LoginView(), isActive: $next) {
                        EmptyView()
                    }
                }
            }
        .navigationBarBackButtonHidden()
            .overlay {
                if editProfile == true {
                    VStack {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 273, height: 266)
                            .foregroundColor(.disabled)
                            .overlay {
                                VStack {
                                    ZStack {
                                        if let image = image {
                                            image
                                                .resizable()
                                                .clipShape(Circle())
                                                .frame(width: 100, height: 100)
                                        } else {
                                            Image(systemName: "person.crop.circle.fill")
                                                .font(.system(size: 96).weight(.regular))
                                                .foregroundColor(.fileUpload)
                                        }
                                        
                                        Button {
                                            showImagePicker.toggle()
                                        } label: {
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                                .overlay {
                                                    Image(systemName: "pencil")
                                                        .foregroundColor(.fileUpload)
                                                }
                                        }
                                        .offset(x: 32, y: 35)
                                    }
                                    .padding(.top, -0)
                                    .frame(width: 100, height: 110)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 0.2)
                                        .frame(width: 230, height: 36)
                                        .overlay(alignment: .leading) {
                                            TextField("1107", text: $editClassId)
                                                .font(.system(size: 13).weight(.regular))
                                                .autocapitalization(.none)
                                                .padding(.leading, 10)
                                        }
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 0.2)
                                        .frame(width: 230, height: 36)
                                        .overlay(alignment: .leading) {
                                            TextField("서민덕", text: $editName)
                                                .font(.system(size: 13).weight(.regular))
                                                .autocapitalization(.none)
                                                .padding(.leading, 10)
                                        }

                                }
                            }
                        
                    }
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                        loadImage()
                    }) {
                        ImagePicker(image: $selectedUIImage)
                    }
                }
            }
        
        
        
    }
}

#Preview {
    ProfileView()
}
