import AppKit
import Foundation
import ArgumentParser


extension Foto {
    struct Paste: ParsableCommand {
        
        /// Pastes an image from the clipboard to the specified path
        ///
        /// - Parameter path: The file path as a string
        private func pasteImage(_ path: String) {
            
            /// The system clipboard, the first objects type, first image on it, and its data
            let clip = NSPasteboard.general
            let allItemTypes = clip.types?[0]
            let item = clip.pasteboardItems?[0]
            
            /// Check to see if any of the constants are `nil`
            if allItemTypes != nil && item != nil {
                let data: Data! = item!.data(forType: allItemTypes!)
                if NSImage(data: data!)?.isValid != nil {
                    try? data.write(to: URL(fileURLWithPath: path))
                } else {
                    print(badImageErr)
                    Foto.Paste.exit(withError: EXIT_FAILURE as? Error)
                }
            } else {
                print(invalidImageIndexErr)
                Foto.Paste.exit(withError: EXIT_FAILURE as? Error)
            }
        }
        
        static var configuration = CommandConfiguration(abstract: "Paste an image from the clipboard")
        @Argument(help: "File path to paste the image to")
        var path: String
        
        mutating func validate() throws {
            var isDir: ObjCBool = false
            let fileExistence = FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
            
            guard !isDir.boolValue else {
                throw ValidationError("Image file name must be specified")
            }
            guard !fileExistence else {
                throw ValidationError("Image already exists at the specified path")
            }
        }
        
        func run() { pasteImage(path) }
    }
}
