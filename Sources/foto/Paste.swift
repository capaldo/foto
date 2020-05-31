import Foundation
import AppKit

public func pasteImage(_ path: String) {
    let image = NSImage(pasteboard: NSPasteboard.general)?.tiffRepresentation
    FileManager.default.createFile(atPath: path, contents: image)
}
