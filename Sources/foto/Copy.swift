import Foundation
import AppKit

public func copyImage(_ path: String) {
    let clipboard = NSPasteboard.general
    let image = NSImage(contentsOfFile: path)
    
    clipboard.clearContents()
    clipboard.writeObjects([image] as! [NSPasteboardWriting])
}
