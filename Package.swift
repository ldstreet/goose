// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Goose",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Goose",
            targets: ["Goose"]
        )
    ],
    targets: [
        .target(
            name: "Goose",
            dependencies: []
        )
    ]
)
