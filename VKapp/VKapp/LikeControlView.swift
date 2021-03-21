//
//  LikeControlView.swift
//  VKapp
//
//  Created by Ovanes on 14.03.2021.
//

import UIKit

class LikeControlView: UIControl {

    var isLiked: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGestureDetected))
        self.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
//                guard let context = UIGraphicsGetCurrentContext() else { return }
//                context.setStrokeColor(UIColor.red.cgColor)
//                context.move(to: CGPoint(x: 40, y: 20))
//                context.addLine(to: CGPoint(x: 45, y: 40))
//                context.addLine(to: CGPoint(x: 65, y: 40))
//                context.addLine(to: CGPoint(x: 50, y: 50))
//                context.addLine(to: CGPoint(x: 60, y: 70))
//                context.addLine(to: CGPoint(x: 40, y: 55))
//                context.addLine(to: CGPoint(x: 20, y: 70))
//                context.addLine(to: CGPoint(x: 30, y: 50))
//                context.addLine(to: CGPoint(x: 15, y: 40))
//                context.addLine(to: CGPoint(x: 35, y: 40))
//                context.closePath()
//                context.strokePath()
        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.saveGState()

        let path = UIBezierPath()


        path.move(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.close()
  
        
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.addPath(path.cgPath)
        context.setLineWidth(5)
        context.strokePath()
        
        context.setFillColor(UIColor.blue.cgColor)
        context.addPath(path.cgPath)
        context.fillPath()
        

        
        context.restoreGState()

    }
    

    
    
    @objc func tapGestureDetected(_ gesture: UITapGestureRecognizer) {
        isLiked.toggle()
        sendActions(for: UIControl.Event.valueChanged)
        
        if isLiked {
            transform = CGAffineTransform(translationX: 30, y: 10)
            
            
        } else {
            transform = .identity
        }
        
        
    }
    
}
