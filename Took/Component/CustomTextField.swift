import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .padding(.leading, 40)
            }
            
            if isSecure {
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    SecureField("", text: $text)
                        .tint(.white)
                        .foregroundColor(.white)
                        .padding(.leading, 3)
                }
            } else {
                Image(systemName: "person.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                TextField("", text: $text)
                    .tint(.white)
                    .textCase(.lowercase)
                    .foregroundColor(.white)
                    .padding(.leading, 35)
            }
        }
    }
}
