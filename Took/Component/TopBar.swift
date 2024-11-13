

import SwiftUI

struct TopBar: View {
    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 0)
                    .frame(height: 123)
                    .foregroundColor(.white)
                    .overlay {
                        HStack(alignment:.bottom) {
                            Image("subLogo")
                                .padding(.top,60)
                            Spacer().frame(width: 200)
                            NavigationLink {
                                ProfileView()                                   .edgesIgnoringSafeArea(.all)
                            } label: {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 32))
                                    .foregroundColor(.color)
                                    .padding(.top,5)
                                    .offset(y:3)
                            }
                            
                        }
                    }
                    .ignoresSafeArea()
                Spacer()
            }
        }
    }
}



#Preview {
    TopBar()
}
