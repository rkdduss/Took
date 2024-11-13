import SwiftUI

struct AnimationView: View {
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    @State private var isExpanded4 = false
    
    var body: some View {
        ZStack {
            Image("Final")
                .animation(nil)
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: isExpanded1 ? 50 : 0, height: 10)
                        .foregroundColor(.color)
                        .offset(x: 48, y: -41.3)
                        .padding(.trailing, isExpanded1 ? 0 : 47)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0 ) {
                                startAnimation1()
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: isExpanded2 ? 30 : 0, height: 10)
                        .foregroundColor(.color)
                        .offset(x: 33, y: -26.8)
                        .padding(.trailing, isExpanded2 ? 0 : 27)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                startAnimation2()
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: isExpanded3 ? 30 : 0, height: 10)
                        .foregroundColor(.color)
                        .offset(x: -30, y: -1)
                        .padding(.trailing, isExpanded3 ? 27 : 0)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                startAnimation3()
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: isExpanded4 ? 50 : 0, height: 10)
                        .foregroundColor(.color)
                        .offset(x: -32, y: -14)
                        .padding(.trailing, isExpanded4 ? 47 : 0)
                        .onAppear {
                            startAnimation4()
                        }
                }
        }           

    }

    private func startAnimation1() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            isExpanded1.toggle()
        }
    }

    private func startAnimation2() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            isExpanded2.toggle()
        }
    }
    
    private func startAnimation3() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            isExpanded3.toggle()
        }
    }
    
    private func startAnimation4() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            isExpanded4.toggle()
        }
    }
}

#Preview {
    AnimationView()
}
