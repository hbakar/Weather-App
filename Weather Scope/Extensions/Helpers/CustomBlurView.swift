//
//  CustomBlurView.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//

import Foundation

import UIKit

@IBDesignable
class CustomBlurView: UIVisualEffectView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.cornerCurve = .continuous
            layer.masksToBounds = true
        }
    }
}
