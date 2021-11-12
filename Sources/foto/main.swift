import Foundation
import ArgumentParser

struct Foto: ParsableCommand {
    static let configuration: CommandConfiguration = .init(
        abstract: "A utility to copy, paste, convert, and resize images from the command-line",
        version: "0.3.0",
        subcommands: [Copy.self, Paste.self]
    )
}

Foto.main()
