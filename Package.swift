// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

print("INITIALIZING...SwiftRelinkPackage")

let package = Package(
    name: "SwiftRelinkPackage",
    products: [
        .executable(name: "relink", targets: ["SwiftRelinkPackage"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "XcodeProj", url: "https://github.com/tuist/XcodeProj.git", .upToNextMajor(from: "7.20.0")),
        .package(name: "swift-argument-parser", url: "https://github.com/apple/swift-argument-parser.git", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftRelinkPackage",
            dependencies: ["XcodeProj", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "SwiftRelinkPackageTests",
            dependencies: ["SwiftRelinkPackage"]),
    ]
)
