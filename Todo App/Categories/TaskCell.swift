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
        
        taskLabel.sizeToFit()
        var xPos = Constants.Sizes.NORMAL
        var yPos = Constants.Sizes.NORMAL
        var width = taskLabel.frame.width
        var height = taskLabel.frame.height
        taskLabel.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        cellView.addSubview(taskLabel)
        
        reminderLabel.sizeToFit()
        print("reminder label width \(reminderLabel.frame.width)")
        xPos = contentView.frame.width - (reminderLabel.frame.width + Constants.Sizes.NORMAL)
        yPos = Constants.Sizes.NORMAL
        width = reminderLabel.frame.width
        height = reminderLabel.frame.height
        reminderLabel.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        cellView.addSubview(reminderLabel)
        
        reminderIcon = UIImageView()
        xPos = xPos - (Constants.Sizes.TINY + Constants.Sizes.NORMAL)
        yPos = Constants.Sizes.NORMAL
        width = Constants.Sizes.NORMAL
        height = Constants.Sizes.NORMAL
        reminderIcon.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        reminderIcon.backgroundColor = UIColor.black
        cellView.addSubview(reminderIcon)
        
        contentView.addSubview(cellView)
        
    }
    
    func getCellHeight() -> CGFloat{
        return contentView.frame.height
    }

}
