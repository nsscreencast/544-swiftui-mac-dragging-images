import SwiftUI

struct CanvasView: View {
    @State var image: NSImage?

    var body: some View {
        Color(nsColor: .windowBackgroundColor)
            .overlay(canvasBackground)
            .dropDestination(for: Data.self) { items, _location in
                guard let image = items.lazy.compactMap({
                    NSImage(data: $0)
                }).first else { return false }

                self.image = image

                return true
            }
    }

    @ViewBuilder
    private var canvasBackground: some View {
        if let image {
            Image(nsImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.secondary, style: .init(
                        lineWidth: 2,
                        dash: [10]
                    ))
                Text("Drop an image here")
                    .font(.caption)
            }
            .padding()
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
