// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GIFImage",
    platforms: [
        .iOS(.v13) // This line specifies that the package is only compatible with iOS 13 and later.
    ],
    products: [
        .library(
            name: "GIFImage",
            targets: ["GIFImage"]),
    ],
    targets: [
        .target(
            name: "GIFImage"),
    ]
)
