import Fluent
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {}

    func list(_ req: Request) throws -> EventLoopFuture<View> {
        let allUsers = User.query(on: req.db).all()
//         let allDevices = Device.query(on: req.db).filter(Device.self, \.$user_id == UUID(uuidString: "873C61FC-B25F-4F7E-A28B-9D507B0F878C")!).all()
//         for element in allDevices {
//           println(element)
//         }
        return allUsers.flatMap { users in
            print(users)
            let data = ["userList": users]
            return req.view.render("users", data)
        }
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { _ in
            return req.redirect(to: "/users")
        }
    }

    func update(req: Request) throws -> EventLoopFuture<Response> {
        let input = try req.content.decode(User.self)
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { user in
                user.username = input.username
                user.email = input.email
                return user.save(on: req.db).map { _ in
                    return req.redirect(to: "/users")
                }
            }
    }


    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in
                return req.redirect(to: "/users")
            }
    }
}
