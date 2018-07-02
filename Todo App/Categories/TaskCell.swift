//
//  TaskCell.swift
//  Todo App
//
//  Created by Akshay More on 07/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    var taskLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var reminderLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var reminderIcon: UIImageView!
    
    let cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        cellView.frame = contentView.frame
        cellView.backgroundColor = Constants.Colors.COLOR_CARD
        contentView.backgroundColor = UIColor.clear
        
        taskLabel.font = UIFont.systemFont(ofSize: Constants.TextSizes.REGULAR)
        taskLabel.sizeToFit()
        taskLabel.textColor = UIColor.white
        var xPos = Constants.Sizes.NORMAL
        var yPos = Constants.Sizes.NORMAL
        var width = taskLabel.frame.width
        var height = taskLabel.frame.height
        taskLabel.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        cellView.addSubview(taskLabel)
        
        reminderLabel.font = UIFont.systemFont(ofSize: Constants.TextSizes.SMALL)
        reminderLabel.sizeToFit()
        reminderLabel.textColor = UIColor.white
        xPos = (Constants.screenWidth - (Constants.Sizes.EXTRA_SMALL_HUGE * 2)) - (reminderLabel.frame.width + Constants.Sizes.NORMAL)
        yPos = Constants.Sizes.NORMAL
        width = reminderLabel.frame.width
        height = reminderLabel.frame.height
        reminderLabel.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        cellView.addSubview(reminderLabel)
        
        reminderIcon = UIImageView()
        xPos = xPos - (Constants.Sizes.MEDIUM + Constants.Sizes.MEDIUM)
        yPos = Constants.Sizes.NORMAL
        width = Constants.Sizes.MEDIUM
        height = Constants.Sizes.MEDIUM
        
        reminderIcon.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        reminderIcon.image = #imageLiteral(resourceName: "reminder icon")
        cellView.addSubview(reminderIcon)
        
        var taskFrame = taskLabel.frame
        width = xPos - Constants.Sizes.NORMAL
        taskFrame = CGRect(x: taskFrame.origin.x, y: taskFrame.origin.y, width: width, height: taskFrame.height)
        taskLabel.frame = taskFrame
        
        contentView.addSubview(cellView)
        self.selectionStyle = .none
        
    }
    
    func getCellHeight() -> CGFloat{
        return contentView.frame.height
    }

}
