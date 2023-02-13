# SlackApp-SwiftServerlessTemplate

Template repository for bootstrapping Serverless Slack Apps using Swift & AWS Lambdas.


## Environment Variables

The shared scheme for `SlackApp` executable product has  a few required environment variables
necessary for running the app.

* (!)`SLACK_ACCESS_TOKEN`
  - This is for the `Bot User OAuth Token` found under `OAuth & Permissions` in your Slack App dashboard. 
* (?)`SLACK_VERIFICATION_TOKEN`
  - This can be found under `Basic Information` in your Slack App dashboard.
  - *Soon to be replaced by `SLACK_SIGNING_SECRET`*
  
**(!) denotes required**

**(?) denotes optional**

## Dependencies

### SwiftBlocksUI

[SwiftBlocksUI](https://github.com/SwiftBlocksUI/SwiftBlocksUI) leverages [MacroApp](https://github.com/Macro-swift/MacroApp) under the hood to provide a declarative "SwiftUI" like approach to creating interactive Slack "applications". [Tutorial](https://www.alwaysrightinstitute.com/swiftblocksui/)

*[MacroApp](https://github.com/Macro-swift/MacroApp) layers on top of [MacroExpress](https://github.com/Macro-swift/MacroExpress/) which focuses on generating API endpoints in a fast, typesafe way.*

### MacroLambda

[MacroLambda](https://github.com/Macro-swift/MacroLambda) acts as a middleware component for running [MacroExpress](https://github.com/Macro-swift/MacroExpress/) apps as [AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime) executables.

## Plugins

### AWSLambdaPackager

Plugin for creating an AWS Lambda binary .zip using an AmazonLinux2 container via Docker.

Usage:
```swift package --disable-sandbox archive```

This will create a `<ProductName>.zip` file located at:
>.build/plugins/AWSLambdaPackager/outputs/AWSLambdaPackager/<ProductName>/<ProductName>.zip
which can be used for uploading to AWS Lambda.

*Requires Docker to be installed/running*

```brew install docker```

Alternatively, you may run
```./bootstrap.sh```
located in the root directory of the project.

## Resources

* [Instant "SwiftUI" Flavoured Slack Apps](https://www.alwaysrightinstitute.com/swiftblocksui/)
* [Deploying Swift on AWS Lambda](http://www.alwaysrightinstitute.com/macrolambda/#building-a-small-express-lambda)
