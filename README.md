# GIFImage Package

## Overview
GIFImage is a Swift package that provides easy integration of GIFs into SwiftUI applications. It extends `UIImage` to handle GIFs and includes a `UIViewRepresentable` struct to integrate with SwiftUI's view system.

## Features
- Load and display GIF images in SwiftUI views.
- Supports all iOS devices running iOS 13 or later.

## Requirements
- iOS 13.0+
- Swift 5.3+
- Xcode 12.0+

## Installation

### Swift Package Manager
You can install GIFImage using the Swift Package Manager by adding it as a dependency to your project's `Package.swift` file:

1. Open your Xcode project.
2. Click on "File" > "Swift Packages" > "Add Package Dependency..."
3. Enter the package repository URL: `https://github.com/benjaminsage/GIFImage`
4. Specify the version you want to use. You can select a specific version, a branch, or a commit.
5. Click "Next" and Xcode will download the package and add it to your project.

Alternatively, you can manually add the package to your `Package.swift` file. Here's an example:

```swift
dependencies: [
    .package(url: "https://github.com/benjaminsage/GIFImage", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

### Importing the Package
To use GIFImage, import it at the top of your Swift file:

```swift
import SwiftUI
import GIFImage
```

### Displaying a GIF
To display a GIF, simply create a `GIFImage` view and pass the name of your GIF file:

```swift
GIFImage(imageName: "exampleGif")
```

Ensure that your GIF file is added to your Xcode project and is included in the target.

### Customization
Work in progress.

## Example
Here is a simple example of how to use GIFImage in a SwiftUI view:
```swift
struct ContentView: View {
    var body: some View {
        GIFImage(imageName: "yourGifFileName")
    }
}
```

Replace `"yourGifFileName"` with the name of your GIF file, minus the '.gif' extension.

## Contributing
<!-- TODO: Add instructions on how contributors can help improve your package. -->

## License
GIFImage is available under the MIT license. See the LICENSE file for more info.
