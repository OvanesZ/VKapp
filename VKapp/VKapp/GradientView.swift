//
//  GradientView.swift
//  VKapp
//
//  Created by Ovanes on 13.03.2021.
//

import UIKit

class GradientView: UIView {
    // поменяли класс слоя на CAGradientLayer
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    
    // создали вычисляемую переменную для удобства
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    // добавляем свойства, отвечающие за параметр градиента
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            self.updateColors()
        }
    } // начальный цвет градиента
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }  // конечный цвет градиента
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
        }
    }// начало градиента
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
        }
    }// Конец градиента
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }// точка начала градиента
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
        }
    }// точка конца градиента
    
    // методы, которые будут обновлять параметры слоя с градиентом
    
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}



