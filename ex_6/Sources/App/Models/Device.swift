import Fluent
import Vapor

final class Device: Model, Content {
    static let schema = "devices"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "user_id")
    var user_id: UUID

    @Field(key: "name")
    var name: String

    init() { }

    init(id: UUID? = nil, user_id: String, name: String) {
        self.id = id
        self.user_id = UUID(uuidString: user_id)!
        self.name = name
    }
}
