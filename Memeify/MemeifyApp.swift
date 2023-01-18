import SwiftUI

@main
struct MemeifyApp: App {
    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate

    var body: some Scene {
        DocumentGroup(newDocument: MemeifyDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("did finish launching")

        if NSDocumentController.shared.documents.isEmpty {
            _ = try? NSDocumentController.shared.openUntitledDocumentAndDisplay(true)
        }
    }
}
