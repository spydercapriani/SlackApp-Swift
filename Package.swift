// swift-tools-version: 5.7

import PackageDescription

let package: Package = Package(
  name: "SlackApp",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .executable(name: "SlackApp", targets: ["SlackApp"]),
  ],
  dependencies: [
    .package(url: "https://github.com/SwiftBlocksUI/SwiftBlocksUI.git", from: "0.9.4"),
    .package(url: "https://github.com/Macro-swift/MacroLambda.git", from: "0.5.0"),
  ],
  targets: [
    .executableTarget(
      name: "SlackApp",
      dependencies: [
        "SwiftBlocksUI",
        "MacroLambda",
      ],
      swiftSettings: [
        // Enable better optimizations when building in Release configuration. Despite the use of
        // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
        // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
      ]
    ),
    
    /// Usage: `swift package --disable-sandbox archive`
    /// Generates AWS Lambda binary .zip file which can be found in `.build/plugins/AWSLambdaPackager/outputs/AWSLambdaPackager/<Target>/<Target>.zip`
      .plugin(
        name: "AWSLambdaPackager",
        capability: .command(
          intent: .custom(
            verb: "archive",
            description: "Archive the Lambda binary and prepare it for uploading to AWS. Requires docker on macOS or non Amazonlinux 2 distributions."
          )
        )
      ),
  ]
)
