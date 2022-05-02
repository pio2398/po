import Fluent
import Vapor

struct ChannelController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {}

    func list(_ req: Request) throws -> EventLoopFuture<View> {
        let allChannels = Channel.query(on: req.db).all()
        return allChannels.flatMap { channels in
            let data = ["channelList": channels]
            return req.view.render("channels", data)
        }
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        let channel = try req.content.decode(Channel.self)
        return channel.save(on: req.db).map { _ in
            return req.redirect(to: "/channels")
        }
    }

    func update(req: Request) throws -> EventLoopFuture<Response> {
        let input = try req.content.decode(Channel.self)
        return Channel.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { channel in
                channel.title = input.title
                channel.description = input.description
                return channel.save(on: req.db).map { _ in
                    return req.redirect(to: "/channels")
                }
            }
    }


    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Channel.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in
                return req.redirect(to: "/channels")
            }
    }
}
