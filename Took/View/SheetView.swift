//
//  SheetView.swift
//  Took
//
//  Created by dgsw07 on 9/24/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedItem: [Int] = []
    @State var isPressed: Bool = false
    @State var selectedCategory: String = ""
    @State var animateScale: CGFloat = 1.0
    @State var posts: [Post] = []

    var arr = ["방에서 냄새가 나요","시설이 망가졌어요","소음이 너무 커요","기타","기타","기타"]
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    
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
                    .offset(x:scale.size.width * -0.73, y:scale.size.height * -0.036)
                }
                Group{
                    Text("무엇이 불편하신가요?")
                        .kerning(1.0)
                        .font(.system(size: 25).weight(.bold))
                        .padding(.bottom,10)
                    Text("기숙사 생활 중 무엇이 불편한지 선택해주세요😁")
                        .kerning(1.0)
                        .font(.system(size: 13).weight(.regular))
                        .padding(.bottom,40)
                }
                .offset(x:0,y:14)
                
                Spacer().frame(height: 20)
                LazyVGrid(columns: gridItems) {
                    ForEach(0..<arr.count, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 13)
                            .frame(width: 160,height: 115)
                            .foregroundColor(selectedItem.contains(item) ? .color.opacity(0.8) : .secondary.opacity(0.2))
                            .overlay {
                                Text(arr[item])
                                    .font(.system(size: 18).weight(.semibold))
                                    .foregroundColor(selectedItem.contains(item) ? .white : .black)
                            }
                            .padding(.bottom,10)
                            .onTapGesture {
                                withAnimation(.bouncy(duration:0.2)) {
                                    
                                    
                                    if selectedItem.contains(item) {
                                        selectedItem.removeAll { $0 == item}
                                    } else {
                                        selectedItem.append(item)
                                    }
                                    selectedCategory = arr[item]
                                }
                            }
                    }
                    
                }.padding(.horizontal,20)
                
                Spacer().frame(height: 20)
                
                NavigationLink(destination: BoardView(posts: $posts, category: selectedCategory)) {
                                    RoundedRectangle(cornerRadius: 13)
                                        .frame(width: 314, height: 58)
                                        .foregroundColor(.color)
                                        .overlay(
                                            Text("다음")
                                                .font(.system(size: 20).weight(.semibold))
                                                .foregroundColor(.white)
                                        )
                                }
                .offset(x: 0,y: 34)
                .padding(.top,60)
                Spacer().frame(height: 10)
            }
            .padding(.top,30)
        }
        
        .navigationBarBackButtonHidden()
    }
    
}


#Preview {
    SheetView()
}
