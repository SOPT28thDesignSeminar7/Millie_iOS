//
//  UIView+Extension.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
