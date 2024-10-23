import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    @State private var isShowingPurchaseView = false
    
    var body: some View {
        ZStack {
            // Background Image
            Image(framework.backgroundImages)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // Content Overlay
            VStack {
                // Close button
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(50.0)
                }
                .padding()
                
                Spacer()
     
                
                
                // Text content with custom frame for both width and height
                VStack {
                    Text(framework.description)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 350)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(7.0)
                        .shadow(radius: 5)
                        
                }
                .padding()

                Spacer()
                
                // Learn More button
                Button {
                    isShowingSafariView = true
                } label: {
                    AFButton(title: "Learn More")
                        .padding(.bottom, 40)
                }
                .sheet(isPresented: $isShowingSafariView) {
                    SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.weedexlawn.com")!)
                }
            }
            .background(Color.white.opacity(0.1)) // Background with slight opacity
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true))
    }
}

