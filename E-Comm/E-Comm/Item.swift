import Foundation
import SwiftData

@Model
class Item {
    var id: UUID
    var name: String
    var image: String
    var desc: String
    var supplier: String
    var price: Int
    var timestamp: Date

    init(name: String, image: String, description: String, supplier: String, price: Int, timestamp: Date = Date()) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.desc = description
        self.supplier = supplier
        self.price = price
        self.timestamp = timestamp
    }
}
