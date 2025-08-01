// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "leaf",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "Leaf", targets: ["Leaf"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf-kit.git", from: "1.12.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.114.1"),
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.1"),
    ],
    targets: [
        .target(
            name: "Leaf",
            dependencies: [
                .product(name: "LeafKit", package: "leaf-kit"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "LeafTests",
            dependencies: [
                .target(name: "Leaf"),
                .product(name: "XCTVapor", package: "vapor"),
            ],
            exclude: [
                "Views",
            ],
            swiftSettings: swiftSettings
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency=complete"),
] }
