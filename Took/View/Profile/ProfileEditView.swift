//
//  ProfileEditView.swift
//  Took
//
//  Created by dgsw07 on 10/15/24.
//

import SwiftUI

struct ProfileEditView: View {
    @Environment(\.dismiss) var dismiss
    @State var userInfo = ""
    var body: some View {
        ZStack {
            Color.secondary.opacity(0.4)
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 273,height: 266)
                .foregroundColor(.disabled)
                .overlay {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 96).weight(.regular))
                            .foregroundColor(.fileUpload)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 0.2)
                            .frame(width: 230,height: 36)
                            .overlay(alignment:.leading){
                                TextField("1106 서민덕",text: $userInfo)
                                    .font(.system(size: 13).weight(.regular))
                                    .padding(.leading,10)
                            }
                        
                    }
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileEditView()
}
