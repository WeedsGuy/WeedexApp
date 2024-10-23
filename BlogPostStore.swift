import SwiftUI
import Contentful
import Foundation

// change to your spaceID and accessToken
let spaceId = "2qox4i1rz8rc"
let accessToken = "HLz-MKVaZxqFtCFiSkoOaMdV2Tu-Pho7wqRpYSZgl6Q"

// Global variable to track API calls
var apiCallCount = 0

let client = Client(spaceId: spaceId, accessToken: accessToken)

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    try! query.order(by: Ordering(sys: .createdAt, inReverse: true)) // ordering the list of articles by created date

    // Increment the API call counter before the API call is made
    apiCallCount += 1
    print("API Call \(apiCallCount): Fetching content for content type ID: \(id)")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print("Error fetching content: \(error)")
        }
    }
}

class BlogPostsStore: ObservableObject {
    @Published var blogPosts: [BlogPost] = articleList
    @Published var hasNewPost: Bool = false
    private var lastPostCount: Int = 0
    private var isFetching: Bool = false  // Flag to prevent multiple requests

    // Move the client inside the store for better lifecycle management
    private let client = Client(spaceId: spaceId, accessToken: accessToken)

    init() {
        refreshView()  // Initial API call to load blog posts
    }
    
    func refreshView() {
        // If a fetch operation is already in progress, don't start a new one
        guard !isFetching else { return }

        isFetching = true  // Set the flag to true to indicate that a fetch is in progress

        blogPosts = []  // Optionally clear current posts before fetching

        DispatchQueue.main.async {
            getArray(id: "swiftBlog") { items in
                items.forEach { item in
                    self.blogPosts.append(
                        BlogPost(
                            title: item.fields["title"] as! String,
                            subtitle: item.fields["subtitle"] as! String,
                            image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: ""),
                            blogpost: item.fields["blogpost"] as? String ?? "",
                            featured: item.fields["featured"] as? Bool ?? false
                        )
                    )
                }

                self.checkForNewPosts()
                self.isFetching = false  // Reset the flag once the fetch is done
            }
        }
    }

    private func checkForNewPosts() {
        let currentPostCount = blogPosts.count
        hasNewPost = currentPostCount > lastPostCount
        lastPostCount = currentPostCount
    }
}

