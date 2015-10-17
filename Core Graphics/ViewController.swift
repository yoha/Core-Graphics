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
        willSet {
            if self.currentDrawType > 5 { self.currentDrawType = 0 }
        }
    }
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - IBAction Properties
    
    @IBAction func redrawActionButton(sender: UIButton) {
        ++self.currentDrawType
        
        switch self.currentDrawType {
        case 0:
            self.drawRectangle()
        default:
            break
        }
    }
    
    // MARK: - Methods Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drawRectangle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Local Methods
    
    func drawRectangle() {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(512, 512), false, 0)
        guard let currentGraphicsContext = UIGraphicsGetCurrentContext() else { return }
        
        let cgRect = CGRect(x: 0, y: 0, width: 512, height: 512)
        
        CGContextSetFillColorWithColor(currentGraphicsContext, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(currentGraphicsContext, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(currentGraphicsContext, 10)
        
        CGContextAddRect(currentGraphicsContext, cgRect)
        CGContextDrawPath(currentGraphicsContext, CGPathDrawingMode.FillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.imageView.image = image
    }
}

