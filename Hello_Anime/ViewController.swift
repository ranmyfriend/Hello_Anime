//
//  ViewController.swift
//  Hello_Anime
//
//  Created by Ranjith Kumar on 9/19/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import UIKit

fileprivate let padding:CGFloat = 50

class ViewController: UIViewController {
    
    lazy var subView: UIView = {
        let v = UIView.init(frame: CGRect(x:padding,y:padding,width:UIScreen.main.bounds.width-(2*padding),height:UIScreen.main.bounds.height-(2*padding)))
        v.backgroundColor = .white
        v.layer.cornerRadius = 4.0
        v.layer.masksToBounds = true
        
        let label = UILabel()
        label.text = "Hello Anime!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.tag = 2
        v.addSubview(label)
        
        return v
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect:blurEffect)
        blurView.frame = UIScreen.main.bounds
        return blurView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iv = UIImageView.init(frame: view.bounds)
        iv.image = #imageLiteral(resourceName: "iv_bgImage")
        iv.contentMode = .scaleAspectFit
        view.addSubview(iv)
    }
    
    func showSubView() {
        
        guard let label = subView.viewWithTag(2) as? UILabel else{fatalError("No Label found")}
        label.frame = CGRect(x:(subView.frame.width-200)/2,y:(subView.frame.height-100)/2,width:200,height:100)
        view.addSubview(blurView)
        
        view.addSubview(subView)
        subView.frame = CGRect(x:padding,y:UIScreen.main.bounds.height,width:UIScreen.main.bounds.width-(2*padding),height:UIScreen.main.bounds.height-(2*padding))
        subView.alpha = 0.0
        UIView.animate(withDuration: 1.0) {
            self.subView.alpha = 1.0
            self.subView.frame = CGRect(x:50,y:50,width:UIScreen.main.bounds.width-(2*padding),height:UIScreen.main.bounds.height-(2*padding))
            self.perform(#selector(ViewController.removeSubView), with: nil, afterDelay: 5.0)
        }
        
    }
    
    func removeSubView() {
        
        UIView.animate(withDuration: 1.0, animations: { 
            self.subView.frame = CGRect(x:padding,y:UIScreen.main.bounds.height,width:UIScreen.main.bounds.width-(2*padding),height:UIScreen.main.bounds.height-(2*padding))
        }) { (done) in
            self.blurView.removeFromSuperview()
            self.subView.removeFromSuperview()
        }
        
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        
        
        self.perform(#selector(ViewController.showSubView), with: nil, afterDelay: 1.0)
        
        
        
        
        //1)
        //        UIView.animate(withDuration: 1.0) {
        //            self.subView.alpha = 0.0
        //        }
        
        //2)
        //        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseInOut,.repeat,.autoreverse], animations: {
        //            self.subView.alpha = 0.0
        //        }, completion: nil)
        
        
        //3)
        //        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut,.repeat,.autoreverse], animations: {
        //            self.subView.frame.origin.y = self.subView.frame.origin.y+100
        //        }, completion: nil)
        
        //4)
        //        subView.layer.masksToBounds = true
        //
        //        let anim = CABasicAnimation.init(keyPath: "cornerRadius")
        //
        //        anim.fromValue = 0
        //        anim.toValue = 20
        //        anim.duration = 2
        //        
        //        subView.layer.add(anim, forKey: nil)
        //        subView.layer.cornerRadius = 20
        
        
    }
    
}

