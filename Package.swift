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
    dependencies: [
        .package(
            url: "https://github.com/popmedic/decouple-protocols.git", from:"0.0.3"
        ),
    ],
    targets: [
        .target(
            name: "Publisher",
            dependencies: ["Protocols"],
            path: "Sources"),
    ]
)

