import SwiftUI
import PhotosUI

struct BoardView: View {
    @ObservedObject var viewModel = LoginViewModel(user: User(name: "박민주", classId: "1116", id: "alswn", password: "alswn"))
    
    @Environment(\.dismiss) var dismiss
    @Binding var posts: [Post]
    @State var category: String
    @State var title = ""
    @State var content = ""
    @State var next = false
    @State private var openPhotoPicker = false
    @State private var selectedImages: [UIImage] = []
    @FocusState private var focusOn: Bool
    
    var wordCount: Int {
        title.isEmpty ? 0 : title.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .whitespacesAndNewlines).count
    }

    var body: some View {
        GeometryReader { scale in
            VStack(spacing: 3) {
                HStack {
                    Spacer().frame(width: scale.size.width * 0.7)
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(.gray)
                            .font(.system(size: 30))
                    }
                    .offset(x: scale.size.width * -0.734, y: scale.size.height * 0.004)
                }
                VStack {
                    Text("무엇이 불편하신가요?")
                        .kerning(1.0)
                        .font(.system(size: 25).weight(.bold))
                        .padding(.bottom, 10)
                    Text("기숙사 생활 중 무엇이 불편한지 선택해주세요😁")
                        .kerning(1.0)
                        .font(.system(size: 13).weight(.regular))
                        .padding(.bottom, 40)
                }.padding(.top, 40)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        Text("카테고리").font(.system(size: 12).weight(.regular))
                        TextField("", text: $category)
                            .font(.custom("Pretendard-Black",size:14))
                            .autocapitalization(.none)
                            .padding()
                            .frame(width: 338, height: 55)
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.black.opacity(0.2))
                            }
                            .padding(.bottom, 10)
                        
                        Text("제목").font(.custom("Pretendard-Black", size: 12))
                        TextField("", text: $title)
                            .autocapitalization(.none)
                            .font(.system(size: 14).weight(.regular))
                            .padding()
                            .frame(width: 338, height: 55)
                            .focused($focusOn)
                            .onAppear { focusOn = true }
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.black.opacity(0.2))
                            }
                            .padding(.bottom, 14)
                        
                        Text("내용").font(.system(size: 12).weight(.regular))
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 0.2)
                            .frame(width: 338, height: 234)
                            .overlay(alignment: .top) {
                                TextEditor(text: $content)
                                    .font(.system(size: 14).weight(.regular))
                                    .cornerRadius(14)
                                    .frame(width: 310, height: 195)
                                    .focused($focusOn)
                                    .onAppear {
                                        focusOn = false
                                    }
                                    .onChange(of: content) { i in
                                        
                                    }
                                    .overlay(
                                        HStack(spacing: .zero) {
                                            Text("\(content.count)")
                                                .foregroundColor(.blue)
                                            Text("/500")
                                        }
                                            .font(.system(size: 12).weight(.regular))
                                            .offset(x: 140, y: 110)
                                    )
                                    .padding(.top, 10)
                            }
                        Button {
                            self.openPhotoPicker = true
                        } label: {
                            RoundedRectangle(cornerRadius: 13)
                                .frame(width: 338, height: 58)
                                .foregroundColor(.fileUpload)
                                .overlay(
                                    Text("사진 첨부")
                                        .font(.system(size: 20).weight(.semibold))
                                        .foregroundColor(.white)
                                        .kerning(1.5)
                                )
                        }
                        .padding(.top, 10)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<2, id: \.self) { index in
                                    if index < selectedImages.count {
                                        Image(uiImage: selectedImages[index])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 160, height: 120)
                                            .clipped()
                                            .cornerRadius(14)
                                    } else {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(lineWidth: 1)
                                            .frame(width: 160, height: 120)
                                            .foregroundColor(.secondary.opacity(0.25))
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .font(.system(size: 40))
                                                    .foregroundColor(.disabled)
                                            )
                                    }
                                }
                            }
                            .frame(height: 120)
                            .padding(.leading, 7)
                        }
                        .frame(height: 160)
                    }
                    .padding(.leading, 27)
                    
                    Button {
                        self.viewModel.detailRequest = true
                        let newPost = Post(title: title, content: content)
                        posts.append(newPost)
                        title = ""
                        content = ""
                    } label: {
                        RoundedRectangle(cornerRadius: 13)
                            .frame(width: 338, height: 58)
                            .foregroundColor(content.count <= 500 && !title.isEmpty && !content.isEmpty ? .color : .disabled)
                            .overlay(
                                Text("작성 완료")
                                    .font(.system(size: 20).weight(.semibold))
                                    .foregroundColor(.white)
                                    .kerning(1.5)
                            )
                    }
                    .disabled(title.count > 500 || title.isEmpty || title.isEmpty)
                    
                    NavigationLink(destination: MainView(),isActive: $next) {
                        EmptyView()
                    }
                }
                .background(Color(.clear))
                .onTapGesture {
                    self.endTextEditing()
                    focusOn = false
                }
            }
            .navigationBarBackButtonHidden()
            .alert(isPresented: $viewModel.detailRequest) {
                Alert(title: Text("게시가 완료되었어요!"), message: Text("불만 사항 게시글이 정상적으로 게시 되었어요."), dismissButton: .default(Text("확인")) {
                    self.viewModel.alertOn = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.next = true
                    }
                })
            }
            .sheet(isPresented: $openPhotoPicker) {
                PhotoPicker(selectedImages: $selectedImages)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    @State static var posts = [Post]()

    static var previews: some View {
        BoardView(posts: $posts, category: "")
    }
}


struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let uiImage = image as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedImages.append(uiImage)
                        }
                    }
                }
            }
        }
    }
}
