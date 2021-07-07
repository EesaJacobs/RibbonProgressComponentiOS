//
//  RibbonView.swift
//  Component
//
//  Created by Eesa Jacobs on 2021/07/06.
//

import UIKit

class RibbonView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var fillableView: UIView!
    @IBOutlet var kFillableViewWidth: NSLayoutConstraint!
    
    var isRearEndArcRequired = false
    var filledPercentage: CGFloat = 0.0
    
    func makeRearEndRounded(){
        DispatchQueue.main.async {[weak self] in
            self?.contentView.roundCorners(corners: [.topLeft, .bottomLeft], radius: (self?.contentView.frame.height ?? 2)/2)
        }
    }
    
    func makeFrontEndRounded(){
        DispatchQueue.main.async {[weak self] in
            self?.contentView.roundCorners(corners: [.topRight, .bottomRight], radius: (self?.contentView.frame.height ?? 2)/2)
        }
    }
    
    func makeFrontAndRearEndRounded(){
        DispatchQueue.main.async {[weak self] in
            self?.contentView.roundCorners(corners: [.topLeft, .bottomLeft, .topRight, .bottomRight], radius: (self?.contentView.frame.height ?? 2)/2)
        }
    }
    
    override open func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        if(isRearEndArcRequired){
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: -(rect.width * 0.4), y: rect.midY),
                                          radius: CGFloat(rect.height/1),
                                          startAngle: CGFloat(90 * Double.pi / 180.0),
                                          endAngle: CGFloat(270 * Double.pi / 180),
                                          clockwise: false)
                
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.white.cgColor
                
            layer.addSublayer(shapeLayer)
            layer.masksToBounds = true
        }
        
        DispatchQueue.main.async {
            self.kFillableViewWidth.constant = (rect.size.width * self.filledPercentage)
            UIView.animate(withDuration: CATransaction.animationDuration()) {
                self.setNeedsLayout()
                self.layoutIfNeeded()
            }
        }
    }
}
