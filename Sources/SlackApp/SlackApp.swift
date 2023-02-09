import SwiftBlocksUI
import MacroLambda

@main
struct SlackApp: App {
  
  var body: some Endpoints {
    Slash("hello") {
      "Hello World!"
    }
  }
  
  static func main() throws {
    let app = SlackApp()
    let express: Express = try app.express()
    
    if process.isRunningInLambda {
      Lambda.run(express)
    } else {
      express.listen(app.port) {
        console.log("App started on port:", app.port)
      }
      MacroCore.shared.run()
    }
  }
}
