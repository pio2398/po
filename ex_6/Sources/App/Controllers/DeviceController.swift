import Fluent
import Vapor

struct DeviceController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {}

    func list(_ req: Request) throws -> EventLoopFuture<View> {
        let allDevices = Device.query(on: req.db).all()
        return allDevices.flatMap { devices in
            let data = ["deviceList": devices]
            return req.view.render("devices", data)
        }
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        let device = try req.content.decode(Device.self)
        return device.save(on: req.db).map { _ in
            return req.redirect(to: "/devices")
        }
    }

    func update(req: Request) throws -> EventLoopFuture<Response> {
        let input = try req.content.decode(Device.self)
        return Device.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { device in
                device.user_id = input.user_id
                device.name = input.name
                return device.save(on: req.db).map { _ in
                    return req.redirect(to: "/devices")
                }
            }
    }


    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Device.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in
                return req.redirect(to: "/devices")
            }
    }
}
