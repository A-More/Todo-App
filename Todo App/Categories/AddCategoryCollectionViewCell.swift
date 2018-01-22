//
//  AddCategoryCollectionViewCell.swift
//  Todo App
//
//  Created by Akshay More on 16/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit

class AddCategoryCollectionViewCell: UICollectionViewCell {
    
    var addIcon: UIImageView!
    var addCatLabel: UIButton!
    var cardView: UICardView!
    var container: UIView!
    
    override func awakeFromNib() {
        addIcon = UIImageView()
        addCatLabel = UIButton()
        container = UIView()
        cardView = UICardView()
        cardView.backgroundColor = Constants.Colors.COLOR_CARD
        cardView.cornerRadius = Constants.Sizes.SMALL
        cardView.clipsToBounds = true
        contentView.addSubview(cardView)
        cardView.addSubview(container)
        
        addCatLabel.setTitle("Add Category", for: .normal)
        addCatLabel.setTitleColor(UIColor.white, for: .normal)
        addCatLabel.sizeToFit()
        
        container.addSubview(addIcon)
        container.addSubview(addCatLabel)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.Sizes.EXTRA_SMALL * -1).isActive = true
        cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: addCatLabel.frame.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: addCatLabel.frame.height + Constants.Sizes.LARGE ).isActive = true
        //set container height as label's height + margin + button's height
        
        addIcon.translatesAutoresizingMaskIntoConstraints = false
        addIcon.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        addIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        addCatLabel.translatesAutoresizingMaskIntoConstraints = false
        addCatLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        addCatLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        addCatLabel.addTarget(self, action:#selector(AddCategoryCollectionViewCell.addCategory), for: .touchUpInside)
        
    }
    
    @objc func addCategory(){
        AppDelegate.navigationController.pushViewController(AddCategoryViewController(), animated: true)
    }
    
    
}
