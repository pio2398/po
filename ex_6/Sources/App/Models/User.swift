import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "username")
    var username: String

    @Field(key: "email")
    var email: String

    init() { }

    init(id: UUID? = nil, username: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
    }
}
