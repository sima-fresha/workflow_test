import Foundation
import SwiftUI

public class FontManager {
    
    public static func registerAllFonts() {
        registerFont(name: "roobertpro_bold", fileType: .ttf, bundle: .module)
        registerFont(name: "roobertpro_regular", fileType: .ttf, bundle: .module)
        registerFont(name: "roobertpro_semibold", fileType: .ttf, bundle: .module)
        registerFont(name: "tartuffo_bold", fileType: .otf, bundle: .module)
        registerFont(name: "tartuffo_medium", fileType: .otf, bundle: .module)
        registerFont(name: "tartuffo_regular", fileType: .otf, bundle: .module)
    }
    
    static func registerFont(name: String, fileType: FontType, bundle: Bundle) {
        guard
            let fontURL = bundle.url(forResource: name, withExtension: fileType.rawValue),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider)
        else {
            fatalError("Couldn't create font: \(name).\(fileType.rawValue)")
        }
        CTFontManagerRegisterGraphicsFont(font, nil)
    }
}

extension FontManager {
    enum FontType: String {
        case ttf
        case otf
    }
}
