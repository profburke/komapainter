// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "komapainter",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        ],
    targets: [
        .target(
            name: "komapainter",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                ]),
        .testTarget(
            name: "komapainterTests",
            dependencies: ["komapainter"]),
    ]
)
