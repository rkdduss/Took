//
//  MainView.swift
//  Took
//
//  Created by dgsw07 on 10/18/24.
//

import SwiftUI

struct MainView: View {
//    @State var posts: [Post] = []
    @State var enterMain = false
    @State var pickerOn = false
    @StateObject var posts = PostsData()

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("subLogo")
                    Spacer().frame(width: 200)
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.color)
                            .padding(.top,6)
                    }
                    
                }
                .frame(width: 400,height: 70)
                .background(.white)
                Spacer()
                ScrollView {
                    LazyVStack {
                        HStack(spacing:0) {
                            Text("기숙사 관련 불만들이에요!")
                                .lineLimit(1)
                                .font(.system(size: 20).weight(.medium))
                                .frame(height: 50)
                                .padding(.top,10)
                                .padding(.trailing,70)
                            Button {
                                self.pickerOn = true
                            } label: {
                                HStack {
                                    Text("최신순")
                                    Spacer().frame(width: 4)
                                    Image(systemName: "chevron.down")
                                }
                                .font(.system(size: 14).weight(.medium))
                                .foregroundColor(.secondary.opacity(0.8))
                                .padding(.top,10)
                            }
                            
                        }
                        ForEach(1..<30) { i in
                            NavigationLink {
                                PostDetailView()
                            } label: {
                                Rectangle().frame(width: 340,height: 1)
                                    .padding(.bottom,85)
                                    .foregroundColor(.secondary.opacity(0.5))
                                    .overlay(alignment:.leading) {
                                        HStack {
                                            VStack(alignment:.leading,spacing: 10) {
                                                Text("3층에 냄새가 나요").font(.system(size: 14).weight(.medium))
                                                Text("2024.10.10")
                                                    .font(.system(size: 12).weight(.regular))
                                                    .foregroundColor(.tookgray)
                                            }
                                            Spacer().frame(width: 100)
                                            VStack {
                                                Text("카테고리: 악취")
                                                    .font(.system(size: 12).weight(.regular))
                                                    .foregroundColor(.tookgray)
                                                Spacer().frame(height: 10)
                                                HStack {
                                                    Image(systemName: "heart")
                                                        .foregroundColor(.fileUpload)
                                                    Image(systemName: "bubble.right")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(.fileUpload)
                                                }
                                            }
                                        }
                                        .padding(.top,10)
                                    }
                            }
                            
                            
                        }
                        .foregroundColor(.black)
                    }
                    
                }
                .background(.secondary.opacity(0.03))
                
            }
            NavigationLink {
                SheetView()
            } label: {
                Circle()
                    .frame(width: 57,height: 57)
                    .foregroundColor(.white)
                    .shadow(color:.black.opacity(0.3),radius: 5)
                    .overlay {
                        Image(systemName: "pencil")
                            .font(.system(size: 26).weight(.regular))
                            .foregroundColor(.color)
                    }
            }
            .offset(x:130,y:340)
        }
        .refreshable{}
        .navigationBarBackButtonHidden()
    }
}

class PostsData: ObservableObject {
    @Published var items : [Post] = []
}

#Preview {
    MainView()
}
