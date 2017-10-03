StringCase
=================================

[![Swift Package Manager](https://rawgit.com/jlyonsmith/artwork/master/SwiftPackageManager/swiftpackagemanager-compatible.svg)](https://swift.org/package-manager/)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

String extension to write camelCase string and snakeCase string

## Installation

### SPM

To install StringCase with SwiftPackageManager, add the following lines to your `Package.swift`.

```swift
let package = Package(
    name: "XXX",
    products: [
        .library(
            name: "XXX",
            targets: ["XXX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/string-case-swift.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "XXX",
            dependencies: ["StringCase"]),
        .testTarget(
            name: "XXXTests",
            dependencies: ["CommandLineArgs"])
    ]
)
```

## The Basics

- CamelCase

Transform the current string to a camel case string as follow :

```swift
let res = "i love swift".camelCased()
print("\(res)") // Will print iLoveSwift
```

```swift
let res = " i love swift  ".camelCased(.capitalized)
print("\(res)") // Will print ILoveSwift
```

- SnakeCase

Transform the current string to a snake case string as follow :

```swift
let res = "i love swift".snakeCased()
print("\(res)") // Will print i_love_swift
```

```swift
let res = "i_LOVE SWIFT".snakeCased()
print("\(res)") // Will print i_love_swift
```

```swift
let res = " iLove    Swift ".snakeCased(.upper)
print("\(res)") // Will print I_LOVE_SWIFT
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

StringCase is licensed under the [BSD 3-Clause license](LICENSE).
