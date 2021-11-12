import AppKit
import ArgumentParser
import Foundation


extension Foto {
    struct Copy: ParsableCommand {
        
        /// Copies an image from the clipboard to the specified path
        ///
        /// - Parameter path: The file path as a string
        private func copyImage(_ path: String) {
            let clipboard = NSPasteboard.general
            let isImage = NSImage(contentsOfFile: path)?.isValid
            
            if isImage != nil {
                let image = NSImage(contentsOfFile: path)
                clipboard.clearContents()
                clipboard.writeObjects([image] as! [NSPasteboardWriting])
            } else {
                print(badImageErr)
                Foto.Copy.exit(withError: EXIT_FAILURE as? Error)
            }
        }
        
        static var configuration = CommandConfiguration(abstract: "Copy an image to the clipboard")
        
        @Argument(help: "File path of the image to copy")
        var path: String
        
        mutating func validate() throws {
            var isDir: ObjCBool = false

            guard FileManager.default.fileExists(atPath: path, isDirectory: &isDir), !isDir.boolValue else {
                throw ValidationError("File path provided is not an image")
            }
        }
        
        func run() { copyImage(path) }
    }
}

