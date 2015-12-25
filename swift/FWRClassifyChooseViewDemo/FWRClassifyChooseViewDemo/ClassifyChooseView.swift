//
//  ClassifyChooseView.swift
//  FWRClassifyChooseViewDemo
//
//  Created by medzone on 15/11/12.
//  Copyright © 2015年 medzone. All rights reserved.
//

import UIKit

protocol ClassifyChooseViewProtocol {
    func didSelectItemAtIndexPath(indexPath: NSIndexPath)
}

class ClassifyChooseView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var delegate:ClassifyChooseViewProtocol?
    
    //长
    var myHeight:CGFloat = 0.0
    //宽
    var myWidth:CGFloat = 0.0
    //组名数组
    var sectionArray:NSArray = [String]()
    //具体每一个的二维数组
    var itemArray:NSArray = [String]()
    //左边的scrollView
    var scrollView:UIScrollView?
    //右边的collectionView
    var collectionView:UICollectionView?
    //上一个选择的tag
    var lastTag:NSInteger = 0
    //当前选择的
    var currentCategory:NSInteger = 0
    
    required init?(frame: CGRect, sectionArray: NSArray, itemArray: NSArray) {
        super.init(frame: frame)
        self.myHeight = frame.size.height
        self.myWidth = frame.size.width
        
        self.sectionArray = sectionArray
        
        self.itemArray = itemArray
    
        self.createScrollView()
        
        self.createCollectionView()
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createScrollView() {
        self.scrollView = UIScrollView.init(frame: CGRectMake(0, 0, 80, self.myHeight-64-49))
        self.scrollView!.showsVerticalScrollIndicator = false
        self.addSubview(self.scrollView!)
        
        self.lastTag = 0
        
        for i in 0...self.sectionArray.count-1 {
            let bgView = UIView.init(frame: CGRectMake(0, CGFloat(50*i), 80, 50))
            bgView.backgroundColor = UIColor.init(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)
            bgView.tag = 300 + i
            bgView.userInteractionEnabled = true
            let g = UITapGestureRecognizer.init(target: self, action: "chooseAction:")
            bgView.addGestureRecognizer(g)
            self.scrollView!.addSubview(bgView)
            
            let label = UILabel.init(frame: CGRectMake(3, 0, 79.7, 49.7))
            label.text = self.sectionArray.objectAtIndex(i) as? String
            label.textColor = UIColor.blackColor()
            label.font = UIFont.systemFontOfSize(16)
            label.textAlignment = NSTextAlignment.Center
            label.tag = 200
            bgView.addSubview(label)
            
            let view = UIView.init(frame: CGRectMake(0, 0, 3, 49.7))
            view.backgroundColor = UIColor.clearColor()
            view.tag = 100
            bgView.addSubview(view)
            
            let lineView = UIView.init(frame: CGRectMake(0, 49, 79.7, 0.3))
            lineView.backgroundColor = UIColor.grayColor()
            bgView.addSubview(lineView)
            
            let verLineView = UIView.init(frame: CGRectMake(79.7, 0, 0.3, 50))
            verLineView.backgroundColor = UIColor.grayColor()
            verLineView.tag = 400
            bgView.addSubview(verLineView)
            
            if i == 0 {
                bgView.backgroundColor = UIColor.whiteColor()
                label.textColor = UIColor.init(red: 234/255.0, green: 43/255.0, blue: 50/255.0, alpha: 1.0)
                view.backgroundColor = UIColor.init(red: 234/255.0, green: 43/255.0, blue: 50/255.0, alpha: 1.0)
                verLineView.backgroundColor = UIColor .clearColor()
                self.lastTag = 300
            }
        }
        
        self.currentCategory = 0
        self.scrollView!.contentSize = CGSizeMake(80, CGFloat(self.sectionArray.count*50))
        
    }
    
    func chooseAction(g :UITapGestureRecognizer) {
        let lastView:UIView = self.scrollView!.viewWithTag(self.lastTag)!
        let lbl:UILabel = lastView.viewWithTag(200) as! UILabel
        let vie:UIView = lastView.viewWithTag(100)!
        let verVie:UIView = lastView.viewWithTag(400)!
        
        lastView.backgroundColor = UIColor.init(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)
        lbl.textColor = UIColor.blackColor()
        vie.backgroundColor = UIColor.clearColor()
        verVie.backgroundColor = UIColor.grayColor()
        
        let currentView:UIView = g.view!
        let label:UILabel = currentView.viewWithTag(200) as! UILabel
        let view:UIView = currentView.viewWithTag(100)!
        let verView:UIView = currentView.viewWithTag(400)!
        
        currentView.backgroundColor = UIColor.whiteColor()
        label.textColor = UIColor.init(red: 234/255.0, green: 43/255.0, blue: 50/255.0, alpha: 1.0)
        view.backgroundColor = UIColor.init(red: 234/255.0, green: 43/255.0, blue: 50/255.0, alpha: 1.0)
        verView.backgroundColor = UIColor.clearColor()
        self.lastTag = currentView.tag
        
        self.currentCategory = currentView.tag - 300
        self.collectionView!.reloadData()
        
    }
    
    func createCollectionView() {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        flowLayout.itemSize = CGSizeMake((self.myWidth-80-30)/3, 50)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        
        self.collectionView = UICollectionView.init(frame: CGRectMake(80, 0, self.myWidth-80, self.myHeight-64-49), collectionViewLayout: flowLayout)
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        
        self.addSubview(self.collectionView!)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = self.itemArray.objectAtIndex(self.currentCategory)
        return array.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let array = self.itemArray.objectAtIndex(self.currentCategory)
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath:indexPath)
        cell.backgroundColor = UIColor.init(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let label = UILabel.init(frame:CGRectMake(0, 0, (375-80-30)/3, 50))
        label.text = array.objectAtIndex(indexPath.item) as? String
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(16)
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if ((self.delegate) != nil) {
            self.delegate!.didSelectItemAtIndexPath(indexPath)
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
