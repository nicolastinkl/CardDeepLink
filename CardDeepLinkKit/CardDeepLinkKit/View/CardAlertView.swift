//
//  CardView.swift
//  CardDeepLinkKit
//
// Copyright (c) 2016 AsiaInfo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

/// Alert View Card.
public class CardAlertView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var controlView: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet weak var serverIcon: UIImageView!
    
    @IBOutlet weak var serverRightArrow: UIImageView!
    
    @IBOutlet weak var serverName: UILabel!
    
    @IBAction func openAction(sender: AnyObject) {
        
        self.dismissView(sender)
        if serviceId == "1" {
            let url = "uber://?client_id=Gq0IGY5Wh2aKLKJyEjmvL2PwNJfzzAhw&action=setPickup&pickup[latitude]=30.6475740000&pickup[longitude]=104.0555800000&pickup[nickname]=UberX&pickup[formatted_address]=XX&dropoff[latitude]=30.6416763503&dropoff[longitude]=104.0805369599&dropoff[nickname]=YY&dropoff[formatted_address]=YY&product_id=a1111c8c-c720-46c3-8534-2fcdd730040d&link_text=View%20team%20roster&partner_deeplink=partner%3A%2F%2Fteam%2F9383"
            
            if UIApplication.sharedApplication().canOpenURL(NSURL(string: url)!) {
                UIApplication.sharedApplication().openURL(NSURL(string: url)!)
            }else{
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.uber.com.cn")!)
            }
        }else if serviceId == "2"{
            UIApplication.sharedApplication().openURL(NSURL(string: "hospital://asiainfo.com/open/123123")!)
        }
        
    }
    
    public static func createInstance() -> CardAlertView {
        
        let cardview = NSBundle.mainBundle().loadNibNamed("\(CDApplication.Config.frameworkName)/CardAlertView", owner: self, options: nil).first as! CardAlertView
                
        cardview.backgroundView.layer.cornerRadius = 8
        cardview.backgroundView.layer.masksToBounds = true
        
        let img = UIImageView(image: "bg".namedImage())
        cardview.backgroundView.insertSubview(img, atIndex: 0)
        
        cardview.serverIcon.image = "dp_hospital".namedImage()
        cardview.serverRightArrow.image = "dp_right_arrow".namedImage()
        
        cardview.hiddeButtons()
        
        return cardview
    }
    
    public var serviceId:String = ""{
        didSet{
            request(serviceId)
        }
    }
    
    func request(sId:String){
        showAlertLoading()
        
        if sId == "1" {
            title.text = "Uber"
            CDVender().requestUber { (modelArray) -> Void in
                self.hideAlertLoading()
                self.updateUIConstraints(modelArray)
                
            }
        }else if sId == "2" {
            title.text = "Hospital Appointment Booking"            
            CDVender().requestCardServer { (modelArray) -> Void in
                self.hideAlertLoading()
                self.updateUIConstraints(modelArray)
                
            }
        }
        
    }    
    
    private func hiddeButtons(hidde: Bool = true){
        controlView.hidden = hidde        
    }
    
    func updateUIConstraints(modelArray: [CDModel]) {
        
        var heightOffset: CGFloat = 50
        if modelArray.count > 0 {
            //Success
            for model in modelArray {
                let cardCell = CardViewCell(frame: CGRectMake(0,heightOffset,self.width,44))
                self.backgroundView.addSubview(cardCell)
                cardCell.providerData(model)
                heightOffset += 44
            }
            hiddeButtons(false)
        }else{
            //Error
            let alert = UILabel(frame: CGRectMake(0,heightOffset,self.backgroundView.width,heightOffset))
            alert.textColor = UIColor.whiteColor()
            alert.textAlignment = NSTextAlignment.Center
            alert.text = "Error 404"
            self.backgroundView.addSubview(alert)
            
        }
        
        /**
        update Conttraint
        */
        for constraint in self.backgroundView.constraints {
            if constraint.constant == 249.0 {
                constraint.constant = heightOffset + 40
            }
        }                 
    
    }
    
    @IBAction func dismissView(sender: AnyObject) {
        
        self.dynamicType.springEaseOut(0.5, animations: { () -> Void in
            self.alpha = 0
            }) { () -> Void in
                self.removeFromSuperview()
        }
    }
    
    /**
     Animation springEaseIn
     */
    internal class func springEaseIn(duration: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            options: .CurveEaseIn,
            animations: {
                animations()
            },
            completion: nil
        )
    }
    
    internal class func springEaseOut(duration: NSTimeInterval, animations: (() -> Void)!,completion: (() -> Void)!) {
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            animations()
            }) { ( bol ) -> Void in
            completion()
        }
    }
    
    internal class func spring(duration: NSTimeInterval, animations: () -> Void) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            },
            completion: nil
        )
    }
    
    internal class func springWithCompletion(duration: NSTimeInterval, animations: (() -> Void)!, completion: (Bool -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            }, completion: { finished in
                completion(finished)
            }
        )
    }

}