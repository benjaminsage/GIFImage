import SwiftUI
import UIKit

struct GIFImage: UIViewRepresentable {
    let imageName: String

    func makeUIView(context: Self.Context) -> UIView {
        let view = UIView()

        let imageView = UIImageView()
        if let gif = UIImage.gif(name: imageName) {
            imageView.image = gif
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GIFImage>) {
        // Update the view if necessary.
    }
}

extension UIImage {
    static func gif(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif"),
              let imageData = try? Data(contentsOf: bundleURL) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
