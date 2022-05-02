import Fluent

struct CreateDevice: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("devices")
            .id()
            .field("user_id", .uuid, .required, .references("users", "id"))
            .foreignKey("user_id", references: "users", "id", onDelete: .cascade)
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("devices").delete()
    }
}
