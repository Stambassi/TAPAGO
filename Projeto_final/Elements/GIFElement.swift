import SwiftUI
import UIKit

// Elemento para exibir o GIF
struct GIFElement: View {
    let gifURL: String


    var body: some View {
        GIFView(url: URL(string: gifURL)!)
            .frame(width: 200, height: 200)
            .clipped()
            .aspectRatio(contentMode: .fit)
    }
}

// Wrapper para UIImageView que carrega um GIF
struct GIFView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: self.url), let gif = UIImage.gif(data: data) {
                DispatchQueue.main.async {
                    uiView.image = gif
                }
            }
        }
    }
}

extension UIImage {
    // Método para carregar um GIF
    static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()

        for index in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, index, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }

        return UIImage.animatedImage(with: images, duration: Double(count) / 10.0)
    }
}

