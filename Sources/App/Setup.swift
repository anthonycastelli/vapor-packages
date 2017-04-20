@_exported import Vapor
import LeafProvider

extension Droplet {
    public func setup() throws {
        try collection(Routes(self.view))
    }
}

extension Config {
    public func setup() throws {
        try addProvider(LeafProvider.Provider.self)
    }
}
