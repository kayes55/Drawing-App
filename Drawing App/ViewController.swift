//
//  ViewController.swift
//  Drawing App
//
//  Created by Imrul Kayes on 1/2/17.
//  Copyright © 2017 Binary5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var swiped = false
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    
    func drawLines(fromPoint:CGPoint, toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !swiped {
            
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
            
        }
        
    }
    
    //MARK: Here Goes The reset Screen function
    
    @IBAction func reset(_ sender: AnyObject) {
        
       self.imageView.image = nil
        
    }
    
    //MARK: Here Goes The Color Pickers

    
    
    @IBAction func colorsPicked(_ sender: AnyObject) {
        
        if sender.tag == 0 {
            
            (red, green, blue) = (1,0,0)
            
        } else if sender.tag == 1 {
            (red, green, blue) = (0,1,0)
        } else if sender.tag == 2 {
            (red, green, blue) = (0,0,1)
        } else if sender.tag == 3 {
            (red, green, blue) = (1,0,1)
        } else if sender.tag == 4 {
            (red, green, blue) = (1,1,0)
        } else if sender.tag == 5 {
            (red, green, blue) = (0,1,1)
        } else if sender.tag == 6 {
            (red, green, blue) = (1,1,1)
        } else if sender.tag == 7 {
            (red, green, blue) = (0,0,0)
        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

