//
//  ViewController.swift
//  FWRClassifyChooseViewDemo
//
//  Created by medzone on 15/11/12.
//  Copyright © 2015 medzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ClassifyChooseViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "例子"
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        let categoryArray:Array<String> = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"]
        
        var detailArray = [NSArray]()
        detailArray.append(["0","1","2","3","4","5","6","7","8"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9"])
        detailArray.append(["0","1","2","3","4"])
        detailArray.append(["0","1"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9"])
        detailArray.append(["0","1"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        detailArray.append(["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"])
        
        let chooseView = ClassifyChooseView.init(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-64), sectionArray: categoryArray, itemArray: detailArray)
        chooseView!.delegate = self
        self.view.addSubview(chooseView!)
    }
    
    //MARK:-ClassifyChooseView
    func didSelectItemAtIndexPath(indexPath: NSIndexPath) {
        let message = String.stringByAppendingFormat("第\(indexPath.section)组第\(indexPath.item)个")
        let alert = UIAlertController.init(title: "你点击了", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alert, animated: true, completion: nil)
        let cancelAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

