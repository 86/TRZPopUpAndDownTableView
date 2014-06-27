//
//  TRZPopUpAndDownContainer.swift
//  TRZPopUpAndDownTableView
//
//  Created by yam on 2014/06/13.
//  Copyright (c) 2014年 86. All rights reserved.
//

import UIKit

protocol TRZPopUpAndDownTableViewDelegate {
    // protocol definition goes here
    func dimissPopUpAndDownTableView(sender: AnyObject)
}

class TRZPopUpAndDownContainer: UIViewController {
    
    @IBOutlet var containerView : UIView
    @IBOutlet var tapOuter : UITapGestureRecognizer = nil
    var delegate :TRZPopUpAndDownTableViewDelegate?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder: NSCoder) {
        super.init(coder: coder)
        // Custom initialization
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        let blurView = UIVisualEffectView(effect:effect)
//        blurView.frame = self.view.bounds
//        self.view.insertSubview(blurView, belowSubview: containerView)

        containerView.layer.shadowOffset = CGSize(width:0.6, height:0.6);
        containerView.layer.shadowColor = UIColor.blackColor().CGColor;
        containerView.layer.shadowOpacity = 0.2
        
        tapOuter.addTarget(self, action: "triggerdTapGesture")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func triggerdTapGesture() {
        let p:CGPoint = tapOuter.locationInView(self.view)
        if !CGRectContainsPoint(containerView.frame, p) {
//            dismissModalView()
            NSLog("dimissPopUpAndDownTableView")
            self.delegate?.dimissPopUpAndDownTableView(self)
        }
    }
    
    func dismissModalView() {
        NSLog("dismissModalView")
//        self.dismissViewControllerAnimated(true, completion:nil)
        self.presentingViewController.dismissViewControllerAnimated(true, completion:nil)
        NSLog("presentingViewController:%@", self.presentingViewController)
    }

}
