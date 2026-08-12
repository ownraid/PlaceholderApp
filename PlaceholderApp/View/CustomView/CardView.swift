//
//  CardView.swift
//  PlaceholderApp
//
//  Created by Own on 12/08/2026.
//
import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }


    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable
    var borderColor: UIColor = .clear {
        didSet {
            updateAppearance()
        }
    }


    @IBInspectable
    var shadowColor: UIColor = .clear {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable
    var shadowOpacity: Float = 0 {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable
    var shadowOffsetX: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable
    var shadowOffsetY: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }


    func updateAppearance() {

        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: shadowOffsetX, height: shadowOffsetY )
        layer.masksToBounds = false
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateAppearance()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateAppearance()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
