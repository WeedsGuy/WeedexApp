import SwiftUI
import SDWebImageSwiftUI

struct BlogPostCardMain: View {
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: blogPost.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220)
                .frame(maxWidth: UIScreen.main.bounds.width - 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.title)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    Text(blogPost.subtitle)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            .frame(height: 110)
        }
        .padding(15)
        .background(Color.white)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 5)
    }
}

struct ArticleCardMain_Previews: PreviewProvider {
    static let store = BlogPostsStore()
    static let placeholder = BlogPost(title: "This is a placeholder", subtitle: "A subtitle for the placeholder", image: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), blogpost: "Blog post")
    
    static var previews: some View {
        BlogPostCardMain(blogPost: placeholder)
            .environmentObject(store)
        
        BlogPostCardMain(blogPost: placeholder)
            .environmentObject(store)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}



