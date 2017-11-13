// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StringCase",
    products: [
        .library(
            name: "StringCase",
            targets: ["StringCase"])
    ],
    targets: [
        .target(
            name: "StringCase",
            dependencies: []),
        .testTarget(
            name: "StringCaseTests",
            dependencies: ["StringCase"])
    ]
)
