//
//  ViewController.swift
//  Core Graphics
//
//  Created by Yohannes Wijaya on 10/15/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Stored Properties
    
    var currentDrawType = 0 {
        didSet {
            if self.currentDrawType > 2 { self.currentDrawType = 0 }
        }
    }
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - IBAction Properties
    
    @IBAction func redrawActionButton(sender: UIButton) {
        ++self.currentDrawType

        switch self.currentDrawType {
        case 0:
            self.drawShapeOf("rectangle")
        case 1:
            self.drawShapeOf("circle")
        case 2:
            self.drawCheckerboard()
        default:
            break
        }
    }
    
    // MARK: - Methods Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drawShapeOf("rectangle")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Local Methods
    
    func drawCheckerboard() {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(512, 512), false, 0)
        guard let checkerboardGraphicsContext = UIGraphicsGetCurrentContext() else { return }
        
        CGContextSetFillColorWithColor(checkerboardGraphicsContext, UIColor.blackColor().CGColor)
        
        for row in 0 ..< 8 {
            for col in 0 ..< 8 {
                if row % 2 == 0 {
                    if col % 2 == 0 {
                        CGContextFillRect(checkerboardGraphicsContext, CGRectMake(CGFloat(col * 64), CGFloat(row * 64), 64, 64))
                    }
                }
                else {
                    if col % 2 == 1 {
                        CGContextFillRect(checkerboardGraphicsContext, CGRectMake(CGFloat(col * 64), CGFloat(row * 64), 64, 64))
                    }
                }
            }
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.imageView.image = image
    }
    
    func drawShapeOf(shape: String) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(512, 512), false, 0)
        guard let shapeGraphicsContext = UIGraphicsGetCurrentContext() else { return }
        
        let cgRect = CGRect(x: 5, y: 5, width: 502, height: 502)
        
        CGContextSetFillColorWithColor(shapeGraphicsContext, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(shapeGraphicsContext, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(shapeGraphicsContext, 10)
        
        if shape == "rectangle" { CGContextAddRect(shapeGraphicsContext, cgRect) }
        else if shape == "circle" { CGContextAddEllipseInRect(shapeGraphicsContext, cgRect) }
        CGContextDrawPath(shapeGraphicsContext, CGPathDrawingMode.FillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.imageView.image = image
    }
}

