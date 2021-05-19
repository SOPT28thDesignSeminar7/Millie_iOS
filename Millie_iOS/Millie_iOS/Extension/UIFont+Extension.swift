//
//  UIFont+Extension.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/15.
//

import UIKit

extension UIFont {
    class func NotoSansKR(type: NotoSansKRType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum NotoSansKRType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"

        var name: String {
            "NotoSansKR-" + self.rawValue
        }
    }

    class func Lato(type: LatoType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum LatoType: String {
        case regular = "Regular"

        var name: String {
            "Lato-" + self.rawValue
        }
    }
}
