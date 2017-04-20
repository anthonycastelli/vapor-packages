import Vapor

final class Routes: RouteCollection {
    
    let view: ViewRenderer
    
    init(_ view: ViewRenderer) throws {
        self.view = view
    }
    
    func build(_ builder: RouteBuilder) throws {
        builder.get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        
        // response to requests to /info domain
        // with a description of the request
        builder.get("info") { req in
            return req.description
        }
        
        // Home
        builder.get { _ in
            return try self.view.make("home")
        }
    }
}
