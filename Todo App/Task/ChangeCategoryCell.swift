//
//  CategoryCell.swift
//  Todo App
//
//  Created by Akshay More on 11/06/18.
//  Copyright © 2018 Akshay More. All rights reserved.
//

import Foundation
import UIKit

class ChangeCategoryCell : UICollectionViewCell {
    
    var categoryButton: UIButton = UIButton()
    var changeCategoryProtocol: ChangeCategoryProtocol?
    var category: Category?
    var view: UIView = UIView()
    
    override func awakeFromNib() {
        contentView.addSubview(self.view)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.isUserInteractionEnabled = true
        self.view.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        self.view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
//        categoryButton.setTitle(category?.catName, for: .normal)
        categoryButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.TextSizes.MEDIUM)
        categoryButton.backgroundColor = UIColor.clear
        categoryButton.isUserInteractionEnabled = true
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.addTarget(self, action: #selector(ChangeCategoryCell.onCategorySelected), for: .touchDown)
        self.view.addSubview(categoryButton)
        self.categoryButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.categoryButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        print("view boudns  \(self.view.bounds)")
        print("button boudns\(self.categoryButton.bounds)")
        
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    @objc func onCategorySelected(){
        print("Cell Category Selected   " + category!.catName)
        changeCategoryProtocol?.onCategorySelected(category: category!)
    }
}
