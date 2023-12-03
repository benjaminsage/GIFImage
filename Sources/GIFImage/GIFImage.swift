import SwiftUI
import UIKit

public struct GIFImage: UIViewRepresentable {
    let imageName: String
    
    public init(imageName: String) {
        self.imageName = imageName
    }

    public func makeUIView(context: Self.Context) -> UIView {
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

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GIFImage>) {
        // Update the view if necessary.
    }
}
