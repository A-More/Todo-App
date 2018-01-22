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
    var category: Category?
    var cellId = "Cell"
    var tasks = [Task]()
    var database = DatabaseAssistant.instance
    
    override func awakeFromNib() {
        tasks = database.getTask(catId: (category?.catId)!)
        cardView = UICardView()
        cardView.backgroundColor = Constants.Colors.COLOR_CARD
        cardView.cornerRadius = Constants.Sizes.SMALL
        cardView.frame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: contentView
            .frame.width, height: contentView.frame.height - Constants.Sizes.EXTRA_SMALL)
        cardView.clipsToBounds = true
        contentView.addSubview(cardView)
        
        headerImage = UIImageView()
        var xPos = Constants.Sizes.NO_SPACING
        var yPos = Constants.Sizes.NO_SPACING
        var width = contentView.frame.width
        var height = CGFloat(100)
        headerImage.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        headerImage.applyGradient(colours: Constants.Colors.JOOMLA_GRADIENT, startPoint: CGPoint(x:0, y:0), endPoint: CGPoint(x: 1, y: 1))
        headerImage.backgroundColor = UIColor.clear
        headerImage.contentMode = UIViewContentMode.top
        headerImage.layer.cornerRadius = Constants.Sizes.SMALL
        headerImage.clipsToBounds = true
        headerImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.addSubview(headerImage)
        
        categoryTitle = UILabel()
        categoryTitle.text = category?.catName
        categoryTitle.textColor = UIColor.white
        categoryTitle.font = UIFont.boldSystemFont(ofSize: Constants.TextSizes.LARGE)
        xPos = Constants.Sizes.NORMAL
        yPos = Constants.Sizes.LARGE
        categoryTitle.sizeToFit()
        yPos = (height - categoryTitle.frame.height) / 2
        width = categoryTitle.frame.width
        height = categoryTitle.frame.height
        categoryTitle.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(categoryTitle)
        
        addTaskButton = UIButton()
        addTaskButton.setTitle("+ Add Task", for: UIControlState.normal)
        addTaskButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        addTaskButton.sizeToFit()
        xPos = (contentView.frame.width - addTaskButton.frame.width) / 2
        yPos = (contentView.frame.height - addTaskButton.frame.height - Constants.Sizes.SMALL)
        width = addTaskButton.frame.width
        height = addTaskButton.frame.height
        addTaskButton.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(addTaskButton)
        addTaskButton.addTarget(self, action: #selector(CategoryCollectionViewCell.onAddTaskClicked), for:.touchUpInside)
        
        let divider = UIView()
//        divider.backgroundColor = UIColor.red
        divider.applyGradient(colours: Constants.Colors.MIDNIGHT_GRADIENT)
        xPos = Constants.Sizes.NO_SPACING
        yPos = addTaskButton.frame.origin.y - (Constants.Sizes.SMALL - 0.5)
        width = contentView.frame.width
        height = 0.5
        divider.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        contentView.addSubview(divider)
        
        taskList = UITableView()
        taskList.delegate = self
        taskList.dataSource = self
        
        xPos = Constants.Sizes.NO_SPACING
        yPos = headerImage.frame.height
        width = contentView.frame.width
        height = divider.frame.origin.y - (yPos)
        taskList.backgroundColor = Constants.Colors.COLOR_CARD
        taskList.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        taskList.register(TaskCell.self, forCellReuseIdentifier: cellId)
        taskList.separatorStyle = .none
        contentView.addSubview(taskList)
     
        taskList.rowHeight = UITableViewAutomaticDimension
        taskList.estimatedRowHeight = 120
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        let task: Task = tasks[indexPath.row]
        cell.taskLabel.text = task.tName
        cell.reminderLabel.text = task.tRem
        cell.setupView()
        return cell
    }
    
    @objc func onAddTaskClicked(){
        let controller = TaskViewController()
        controller.category = category
        AppDelegate.navigationController.pushViewController(controller, animated: true)
    }
    
}
