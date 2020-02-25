// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Publisher",
    platforms: [.iOS(.v11)],
    dependencies: [
        .package(
            url: "https://github.com/popmedic/decouple-protocols.git",
            .exact("0.0.3")
        )
    ],
    products: [
        .library(
            name: "Publisher",
            targets: ["Publisher"]),
    ],
    targets: [
        .target(
            name: "Publisher",
            dependencies: ["Protocols"],
            path: "Sources"),
    ]
)

