// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GraphQLRxSwift",
    products: [
        .library(name: "GraphQLRxSwift", targets: ["GraphQLRxSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/GraphQLSwift/GraphQL.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/GraphQLSwift/Graphiti.git", .upToNextMajor(from: "0.22.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.1.0"))
    ],
    targets: [
        .target(name: "GraphQLRxSwift", dependencies: ["GraphQL", "Graphiti", "RxSwift"]),
        .testTarget(name: "GraphQLRxSwiftTests",dependencies: ["GraphQLRxSwift"]),
    ]
)
