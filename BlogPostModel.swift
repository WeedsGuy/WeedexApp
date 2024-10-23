import Foundation

struct BlogPost: Identifiable {
    let id: UUID = UUID() // Keeps UUID for ForEach compatibility, but could replace with API's ID
    var title: String
    var subtitle: String
    var image: URL?       // Optional, since the API might not always return an image
    var blogpost: String
    var featured: Bool
    
    // Optional initializer in case you want to handle missing fields gracefully
    init(
        title: String = "Untitled",       // Default values for safety
        subtitle: String = "",
        image: URL? = nil,
        blogpost: String = "",
        featured: Bool = false
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.blogpost = blogpost
        self.featured = featured
    }
}

var articleList: [BlogPost] = []

