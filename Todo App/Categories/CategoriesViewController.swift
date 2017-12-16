//
//  CategoriesViewController.swift
//  Todo App
//
//  Created by Akshay More on 04/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import Foundation
import UIKit
class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
     var dayText: UILabel!
     var dateText: UILabel!
     var taskList: UITableView!
//    var cardView: UICardView!
    var collectionView: UICollectionView!
    var xPos: CGFloat = 0
    var yPos: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var tasks: [String] = []
    

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.black
        
        dayText = UILabel()
        dayText.text = "Monday"
        dayText.font = UIFont(name: dayText.font.fontName, size: Constants.TextSizes.EXTRA_LARGE_HUMONGOUS)
        dayText.textColor = UIColor.white
        dayText.sizeToFit()
        xPos = Constants.Sizes.EXTRA_SMALL_HUGE
        yPos = UIApplication.shared.statusBarView!.frame.height + Constants.Sizes.EXTRA_SMALL_HUGE
        width = dayText.frame.width
        height = dayText.frame.height
        dayText.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        view.addSubview(dayText)
        
        let label = UILabel()
        label.text = "0,0"
        label.textColor = UIColor.green
        label.backgroundColor = UIColor.blue
        label.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.addSubview(label)
        
        dateText = UILabel()
        dateText.text = "25 Sept"
        dateText.font = UIFont(name: dateText.font.fontName, size: Constants.TextSizes.HUGE)
        dateText.textColor = UIColor.white
        dateText.sizeToFit()
        xPos = Constants.Sizes.EXTRA_SMALL_HUGE
        yPos = yPos + height + Constants.Sizes.SMALL
        width = dateText.frame.width
        height = dateText.frame.height
        dateText.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        view.addSubview(dateText)
        
        setupCollectionView()
//        collectionView = UICollectionView()
//        collectionView.backgroundColor = UIColor.gray
//        xPos = Constants.Sizes.NO_SPACING
//        yPos = yPos + height + Constants.Sizes.EXTRA_SMALL_HUGE
//        width = Constants.screenWidth
//        height = Constants.screenHeight - yPos
//        collectionView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
//        view.addSubview(collectionView)
        
//        cardView = UICardView()
//        cardView.backgroundColor = UIColor.white
//        cardView.cornerRadius = Constants.Sizes.SMALL
//        xPos = Constants.Sizes.EXTRA_SMALL_HUGE
//        yPos = yPos + height + Constants.Sizes.EXTRA_SMALL_HUGE
//        width = Constants.screenWidth - (Constants.Sizes.EXTRA_SMALL_HUGE * 2)
//        height = Constants.screenHeight - (yPos + Constants.Sizes.EXTRA_SMALL_HUGE)
//        cardView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
//        view.addSubview(cardView)
        
    }
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumLineSpacing = Constants.Sizes.LARGE
        xPos = Constants.Sizes.NO_SPACING
        yPos = yPos + height + Constants.Sizes.EXTRA_SMALL_HUGE
        width = Constants.screenWidth
        height = Constants.screenHeight - (yPos + Constants.Sizes.EXTRA_SMALL_HUGE)
        let frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsetsMake(0, Constants.Sizes.EXTRA_SMALL_HUGE, 0, Constants.Sizes.EXTRA_SMALL_HUGE)
        view.addSubview(collectionView)
        

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       let foodCell = cell as! CategoryCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        width = Constants.screenWidth - (Constants.Sizes.EXTRA_SMALL_HUGE * 2)
        height = Constants.screenHeight - (yPos + Constants.Sizes.EXTRA_SMALL_HUGE)
        return CGSize(width: width, height: height)
    }
    
}


