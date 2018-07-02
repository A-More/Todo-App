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
//    var tasks: [String] = []
    var categories: [Category] = []
    var database: DatabaseAssistant?
    let date = Date()
    let formatter = DateFormatter()
    var day = "", dateString: String = ""

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clear
        self.view.applyGradient(colours: Constants.Colors.MIDNIGHT_GRADIENT)
        database = DatabaseAssistant.instance
        categories = (database?.getCategories())!
        getCurrentDate()
        
        dayText = UILabel()
        dayText.text = day
        dayText.font = UIFont(name: dayText.font.fontName, size: Constants.TextSizes.EXTRA_LARGE_HUMONGOUS)
        dayText.textColor = UIColor.white
        dayText.sizeToFit()
        xPos = Constants.Sizes.EXTRA_SMALL_HUGE
        yPos = UIApplication.shared.statusBarView!.frame.height + Constants.Sizes.EXTRA_SMALL_HUGE
        width = dayText.frame.width
        height = dayText.frame.height
        dayText.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        view.addSubview(dayText)
        
        dateText = UILabel()
        dateText.text = dateString
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        categories = (database?.getCategories())!
        collectionView.reloadData()
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
        collectionView.register(AddCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "AddCategoryCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsetsMake(0, Constants.Sizes.EXTRA_SMALL_HUGE, 0, Constants.Sizes.EXTRA_SMALL_HUGE)
        view.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == categories.count){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCategoryCell", for: indexPath) as! AddCategoryCollectionViewCell
            cell.awakeFromNib()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            cell.category = categories[indexPath.row]
            cell.awakeFromNib()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        width = Constants.screenWidth - (Constants.Sizes.EXTRA_SMALL_HUGE * 2)
        height = Constants.screenHeight - (yPos + Constants.Sizes.EXTRA_SMALL_HUGE)
        return CGSize(width: width, height: height)
    }
    
    
    func getCurrentDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        let date = Date()
        let stringDate = formatter.string(from: date)
        let dates = stringDate.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: true)
        day = String(dates[0])
        dateString = String(dates[1])
        
    }
}


