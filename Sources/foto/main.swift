import Foundation
import ArgumentParser

struct Foto: ParsableCommand {
    static let configuration: CommandConfiguration = .init(
        abstract: "A utility to copy and paste images from the command-line",
        version: "0.1.2",
        subcommands: [Copy.self, Paste.self]
    )
}

extension Foto {
    struct Copy: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Copy an image to the clipboard")
        
        @Argument(help: "File path of the image to copy")
        var path: String
        
        mutating func validate() throws {
            var isDir: ObjCBool = false

            guard FileManager.default.fileExists(atPath: path, isDirectory: &isDir), !isDir.boolValue else {
                throw ValidationError("File path provided is not an image")
            }
        }
        
        func run() {
            copyImage(path)
        }
    }
}

extension Foto {
    struct Paste: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Paste an image from the clipboard")
        
        @Argument(help: "File path to paste the image to")
        var path: String
        
        mutating func validate() throws {
            var isDir: ObjCBool = false
            let fileExistance = FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
            
            guard !isDir.boolValue else {
                throw ValidationError("Image file name must be specified")
            }
            guard !fileExistance else {
                throw ValidationError("Image already exists at the specified path")
            }

        }
        
        func run() {
            pasteImage(path)
        }
        
    }
}

Foto.main()
