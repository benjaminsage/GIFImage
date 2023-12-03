//
//  UIImage+gif.swift
//
//
//  Created by Benjamin Sage on 12/3/23.
//

import UIKit
import ImageIO

extension UIImage {
    static func gif(name: String) -> UIImage? {
        // Ensure the GIF file exists in the bundle
        guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif"),
              let imageData = try? Data(contentsOf: bundleURL) else {
            return nil
        }
        return gif(data: imageData)
    }

    static func gif(data: Data) -> UIImage? {
        // Create source from the GIF data
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }

        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var totalDuration: TimeInterval = 0

        // Loop through each frame in the GIF
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frameDuration = gifFrameDuration(at: i, source: source)
                totalDuration += frameDuration
                images.append(UIImage(cgImage: cgImage))
            }
        }

        // Combine the images to a single animated image
        return UIImage.animatedImage(with: images, duration: totalDuration)
    }

    private static func gifFrameDuration(at index: Int, source: CGImageSource) -> TimeInterval {
        let defaultFrameDuration = 0.1
        guard let frameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any],
              let gifProperties = frameProperties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
              let frameDelay = gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double else {
            return defaultFrameDuration
        }
        return frameDelay > 0 ? frameDelay : defaultFrameDuration
    }
}
