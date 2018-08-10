//
//  VechileCurrentTime.swift
//  AutoLayout
//
//  Created by Raja Sinha on 8/9/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit

class VechileCurrentTime {
    
    //timer
    var timer = Timer()
    
    @objc func updateTime(label:UILabel, time : Int, status: Int)  {
        
        let label : UILabel = label
        var time : Int = time
        let status : Int = status
        
        DispatchQueue.main.async {
            label.isHidden = false
        }
        
        var b : Int
        var a : Int
        
        time += 1
        a = time % 60 //Seconds
        b = time / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
        DispatchQueue.main.async {
            
            label.text = "\(b) : \(a)"
            
        }
        
        colorChange(a: a, b: b, label:label, status:status)
        
    }// End of updateTime function
    
    
    //Color Change Function for the Vechniles in the queue
    
    func colorChange(a:Int, b:Int, label:UILabel, status:Int) {
        
        let a : Int = a
        let b : Int = b
        let label :UILabel = label
        let status: Int = status
        
        DispatchQueue.main.async {
            
            if status == 1{
                if ( b == 0 && a < 45) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 0 && a > 45) || (b == 0 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else if b>0 {
                    label.backgroundColor = UIColor.red
                }
                
                
            }//end of status == 1
                
            else if status == 2{
                
                if (b <= 1 && a < 60) || (b == 2 && a < 30) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 2 && a > 30) || (b == 2 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else {
                    label.backgroundColor = UIColor.red
                }
            } //end os status == 2
        }
        
        
    } // End of colour change function
    
    
    func hide(label:UILabel){
        let label : UILabel = label
        DispatchQueue.main.async {
            label.isHidden = true
        }
        
    }// End of function Hide.
    
    
    
}// end of vechileCurrentTime class





