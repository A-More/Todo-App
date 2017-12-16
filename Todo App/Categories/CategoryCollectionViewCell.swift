//
//  CategoryCollectionViewCell.swift
//  Todo App
//
//  Created by Akshay More on 06/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var headerImage: UIImageView!
    var categoryTitle: UILabel!
    var addTaskButton: UIButton!
    var cardView: UICardView!
    var taskList: UITableView!
    var cellId = "Cell"
    
    override func awakeFromNib() {

        cardView = UICardView()
        cardView.backgroundColor = UIColor.white
        cardView.cornerRadius = Constants.Sizes.SMALL
        cardView.frame = contentView.frame
        cardView.clipsToBounds = true
        contentView.addSubview(cardView)
        
        categoryTitle = UILabel()
        categoryTitle.text = "Home"
        var xPos = Constants.Sizes.LARGE
        var yPos = Constants.Sizes.LARGE
        categoryTitle.sizeToFit()
        var width = categoryTitle.frame.width
        var height = categoryTitle.frame.height
        categoryTitle.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(categoryTitle)
        
        headerImage = UIImageView()
        xPos = Constants.Sizes.NO_SPACING
        yPos = Constants.Sizes.NO_SPACING
        width = contentView.frame.width
        height = CGFloat(100)
        headerImage.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        headerImage.image = #imageLiteral(resourceName: "night house")
        headerImage.contentMode = UIViewContentMode.top
        headerImage.layer.cornerRadius = Constants.Sizes.SMALL
        headerImage.clipsToBounds = true
        headerImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.addSubview(headerImage)
        
        addTaskButton = UIButton()
        addTaskButton.setTitle("+ Add Task", for: UIControlState.normal)
        addTaskButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        addTaskButton.sizeToFit()
        xPos = (contentView.frame.width - addTaskButton.frame.width) / 2
        yPos = (contentView.frame.height - addTaskButton.frame.height - Constants.Sizes.SMALL)
        width = addTaskButton.frame.width
        height = addTaskButton.frame.height
        addTaskButton.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(addTaskButton)
        
        addTaskButton.addTarget(self, action: Selector(("addTask")), for:.touchUpInside)
        
        let divider = UIView()
        divider.backgroundColor = UIColor.gray
        xPos = Constants.Sizes.NO_SPACING
        yPos = yPos - (Constants.Sizes.SMALL + 0.5)
        width = contentView.frame.width
        height = 0.5
        print("divider yPos\(yPos)")
        divider.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(divider)
        
        taskList = UITableView()
        taskList.delegate = self
        taskList.dataSource = self
        
        xPos = Constants.Sizes.NO_SPACING
        yPos = headerImage.frame.height
        width = contentView.frame.width
        height = divider.frame.origin.y - (yPos)
        print("divider yPos \(divider.frame.origin.y)")
        
        taskList.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        taskList.register(TaskCell.self, forCellReuseIdentifier: cellId)
        taskList.separatorStyle = .none
        contentView.addSubview(taskList)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        cell.taskLabel.text = "Kapde dhu"
        cell.reminderLabel.text = "aata dhu"
        cell.setupView()
        print("cell width \(cell.frame.width)")
        return cell
    }
    
    @objc func addTask(){
        AppDelegate.navigationController.pushViewController(TaskViewController(), animated: true)
    }
    
}
