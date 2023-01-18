import SwiftUI

struct ContentView: View {
    @Binding var document: MemeifyDocument

    var body: some View {
        CanvasView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MemeifyDocument()))
    }
}
