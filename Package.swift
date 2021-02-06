// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "komapainter",
    dependencies: [
    ],
    targets: [
        .target(
            name: "komapainter",
            dependencies: []),
        .testTarget(
            name: "komapainterTests",
            dependencies: ["komapainter"]),
    ]
)
