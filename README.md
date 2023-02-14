# SlackApp-SwiftServerlessTemplate

Template repository for bootstrapping Serverless Slack Apps using Swift & AWS
Lambdas.

## Using this Template

To get started using this template, I recommend using
[GitHub CLI](https://cli.github.com) and issuing the following command to create
& clone a new public repo based off this template.

```bash
gh repo create <AppName> \
  --template spydercapriani/SlackApp-SwiftServerlessTemplate \
  --public \
  --clone
```

## Environment Variables

There is a shared scheme for `SlackApp` executable product with a few
environment variables necessary for running the app.

- (!) `SLACK_ACCESS_TOKEN`
  - This can be found in your Slack's App Dashboard under
    `OAuth & Permissions > Bot User OAuth`
- (?) `SLACK_VERIFICATION_TOKEN`[^SlackVerification]
  - This can be found in your Slack's App Dashboard under `Basic Information`

**(!) denotes required**

**(?) denotes optional**

[^SlackVerification]: This will soon be deprecated in favor of
`SLACK_SIGNING_SECRET`

## Dependencies

See [Brewfile](./Brewfile) for tool dependencies.

### SwiftBlocksUI

[SwiftBlocksUI](https://github.com/SwiftBlocksUI/SwiftBlocksUI) leverages
[MacroApp](https://github.com/Macro-swift/MacroApp) under the hood to provide a
declarative "SwiftUI" like approach to creating interactive Slack "applications"
using Swift.

_[MacroApp](https://github.com/Macro-swift/MacroApp) layers on top of
[MacroExpress](https://github.com/Macro-swift/MacroExpress/) which focuses on
generating API endpoints in a fast, typesafe way._

### MacroLambda

[MacroLambda](https://github.com/Macro-swift/MacroLambda) acts as a middleware
component for running
[MacroExpress](https://github.com/Macro-swift/MacroExpress/) apps as
[AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime)
executables.

## Plugins

### AWSLambdaPackager

Plugin for creating an AWS Lambda binary .zip using an AmazonLinux2 container
via Docker.

Usage: `swift package --disable-sandbox archive`

This will create a `<ProductName>.zip` file located at:
>.build/plugins/AWSLambdaPackager/outputs/AWSLambdaPackager/<ProductName>/<ProductName>.zip
which can be used for uploading to AWS Lambda.

_Requires Docker to be installed/running_

```bash
brew install docker
```

## Resources

- [Instant "SwiftUI" Flavoured Slack Apps](https://www.alwaysrightinstitute.com/swiftblocksui/)
- [Deploying Swift on AWS Lambda](http://www.alwaysrightinstitute.com/macrolambda/#building-a-small-express-lambda)
- [Block Kit Builder](https://app.slack.com/block-kit-builder/): Block Kit gives
  you a way to create rich, interactive UI for your Slack app. This site lets
  you preview Slack UI elements and better understand how they are created.
