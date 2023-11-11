import Foundation
import UIKit

struct Book: Codable {
    var id: Int
    var title: String
    var cover: String
    var synopsis: String
    var category: String
    var writer: String
    var yearPublished: Int
}
