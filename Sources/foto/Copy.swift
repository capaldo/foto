import Foundation
import AppKit

public func copyImage(_ path: String) {
    let clipboard = NSPasteboard.general
    let isImage = NSImage(contentsOfFile: path)?.isValid
    
    if isImage != nil {
        let image = NSImage(contentsOfFile: path)
        clipboard.clearContents()
        clipboard.writeObjects([image] as! [NSPasteboardWriting])
    } else {
        print(badImageErr)
        exit(EXIT_FAILURE)
    }
}
