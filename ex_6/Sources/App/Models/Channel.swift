import Fluent
import Vapor

final class Channel: Model, Content {
    static let schema = "channels"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "description")
    var description: String

    init() { }

    init(id: UUID? = nil, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
