import Fluent
import Vapor

func routes(_ app: Application) throws {

    let userController = UserController()

    app.get("users", use: userController.list)
    
    app.post("user", "create", use: userController.create)
    app.post("user", "update", ":id", use: userController.update)
    app.post("user", "delete", ":id", use: userController.delete)
    
    //
    
    let channelController = ChannelController()
    
    app.get("channels", use: channelController.list)
    
    app.post("channel", "create", use: channelController.create)
    app.post("channel", "update", ":id", use: channelController.update)
    app.post("channel", "delete", ":id", use: channelController.delete)

    //

    let deviceController = DeviceController()
    
    app.get("devices", use: deviceController.list)
    
    app.post("device", "create", use: deviceController.create)
    app.post("device", "update", ":id", use: deviceController.update)
    app.post("device", "delete", ":id", use: deviceController.delete)
}
