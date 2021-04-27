import Foundation
import AppKit

public func pasteImage(_ path: String) {
    let clip = NSPasteboard.general
    let allItemTypes = clip.types?[0]
    let stuff = clip.pasteboardItems?[0]
    
    if allItemTypes != nil && stuff != nil {
        let data: Data! = stuff!.data(forType: allItemTypes!)
        if NSImage(data: data!)?.isValid != nil {
            try? data.write(to: URL(fileURLWithPath: path))
        } else {
            print(badImageErr)
            exit(EXIT_FAILURE)
        }
    } else {
        print(invalidImageIndexErr)
        exit(EXIT_FAILURE)
    }
}

