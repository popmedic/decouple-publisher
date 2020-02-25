// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Publisher",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "Publisher",
            targets: ["Publisher"]),
    ],
    targets: [
        .target(
            name: "Publisher",
            dependencies: [],
            path: "Sources"),
    ]
)
