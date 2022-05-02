import Fluent

struct CreateChannel: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("channels")
            .id()
            .field("title", .string, .required)
            .field("description", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("channels").delete()
    }
}
