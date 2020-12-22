//
//  StylishImageView.swift
//  Pods-SwiftStylish_Example
//
//  Created by sachitha on 12/8/20.
//

import UIKit

@IBDesignable
open class StylishImageView: UIImageView {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           sharedInit()
       }
       
    required public init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           sharedInit()
       }
       
    public override func prepareForInterfaceBuilder() {
           sharedInit()
       }
       
       func sharedInit() {
      
       }
    //MARK:- corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    //MARK:- boarder
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    //MARK:- shadow
    @IBInspectable var shadowColor:UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    
    @IBInspectable var shadowOpacity:Float = 0{
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
   
    @IBInspectable var shadowRadius:CGFloat = 0{
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset:CGSize = CGSize.zero{
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    //MARK:- Gradient Color
    
    var gradientLayer: CAGradientLayer {
         return layer as! CAGradientLayer
     }

     override open class var layerClass: AnyClass {
         return CAGradientLayer.classForCoder()
     }
    
    
    @IBInspectable var startColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }

    @IBInspectable var endColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }

    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet { gradientLayer.startPoint = startPoint }
    }

    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) {
        didSet { gradientLayer.endPoint = endPoint }
    }
}

extension StylishImageView {
    // For this implementation, both colors are required to display
    // a gradient. You may want to extend cgColorGradient to support
    // other use cases, like gradients with three or more colors.
    internal var cgColorGradient: [CGColor]? {
        guard let startColor = startColor, let endColor = endColor else {
            return nil
        }
        
        return [startColor.cgColor, endColor.cgColor]
    }
}
