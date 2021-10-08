// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GraphQLRxSwift",
    products: [
        .library(name: "GraphQLRxSwift", targets: ["GraphQLRxSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/GraphQLSwift/GraphQL.git", .upToNextMajor(from: "2.0.0")),
        // TODO: Mainline after this PR is merged: https://github.com/GraphQLSwift/Graphiti/pull/69
        .package(url: "https://github.com/NeedleInAJayStack/Graphiti.git", .branch("fix/ScalarInput")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.1.0"))
    ],
    targets: [
        .target(name: "GraphQLRxSwift", dependencies: ["GraphQL", "Graphiti", "RxSwift"]),
        .testTarget(name: "GraphQLRxSwiftTests",dependencies: ["GraphQLRxSwift"]),
    ]
)
