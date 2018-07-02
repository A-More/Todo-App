//
//  EditCategory.swift
//  Todo App
//
//  Created by Akshay More on 25/06/18.
//  Copyright © 2018 Akshay More. All rights reserved.
//

import UIKit

class EditCategoryViewController: UIViewController {
    
    var backButton: UIButton!
    var addTaskLabel: UILabel!
    var addTaskTextView: UITextField!
//    var categoryTitleLabel: UILabel!
//    var categoryLabel: UILabel!
    var doneButton: UIButton!
    let database = DatabaseAssistant.instance
    var category: Category?
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews(){
        view.backgroundColor = .black
        
        //back button
        backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        backButton.imageView?.contentMode = .scaleToFill
        view.addSubview(backButton)
        
        //Label
        addTaskLabel = UILabel()
        addTaskLabel.text = "Edit Category"
        addTaskLabel.textColor = UIColor.white
        addTaskLabel.font = UIFont(name: addTaskLabel.font.fontName, size: Constants.TextSizes.EXTRA_LARGE_HUMONGOUS)
        view.addSubview(addTaskLabel)
        //TextField
        addTaskTextView = UITextField()
        addTaskTextView.font = UIFont.systemFont(ofSize: Constants.TextSizes.HUGE)
        addTaskTextView.textColor = UIColor.white
        addTaskTextView.text = category?.catName
        addTaskTextView.attributedPlaceholder = NSAttributedString(string: "enter category name", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray])
        view.addSubview(addTaskTextView)
        //underline
        let underline = UIView()
        underline.backgroundColor = UIColor.white
        addTaskLabel.addSubview(underline)
    
        //Done Button
        doneButton = UIButton()
        doneButton.setTitle("DONE", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.sizeToFit()
        view.addSubview(doneButton)
        
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let height = UIApplication.shared.statusBarView!.frame.height
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: height).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: Constants.Sizes.ACTION_BAR_SIZE).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: Constants.Sizes.ACTION_BAR_SIZE).isActive = true
        backButton.addTarget(self, action: #selector(TaskViewController.onBackClicked), for: .touchUpInside)
        
        addTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        addTaskLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        addTaskLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        addTaskLabel.sizeToFit()
        addTaskLabel.widthAnchor.constraint(equalToConstant: addTaskLabel.frame.width).isActive = true
        addTaskLabel.heightAnchor.constraint(equalToConstant: addTaskLabel.frame.height).isActive = true
        
        addTaskTextView.translatesAutoresizingMaskIntoConstraints = false
        addTaskTextView.topAnchor.constraint(equalTo: addTaskLabel.bottomAnchor, constant: Constants.Sizes.HUGE).isActive = true
        addTaskTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        addTaskTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE * -1).isActive = true
        addTaskTextView.sizeToFit()
        addTaskTextView.heightAnchor.constraint(equalToConstant: addTaskTextView.frame.height).isActive = true
        
        //underline
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.bottomAnchor.constraint(equalTo: addTaskTextView.bottomAnchor, constant: Constants.Sizes.SMALL).isActive = true
        underline.leftAnchor.constraint(equalTo: addTaskTextView.leftAnchor).isActive = true
        underline.rightAnchor.constraint(equalTo: addTaskTextView.rightAnchor).isActive = true
        //        underline.widthAnchor.constraint(equalTo: addTaskTextView.widthAnchor).isActive = true
        underline.heightAnchor.constraint(equalToConstant: Constants.Sizes.EXTRA_TINY).isActive = true
        
        //Done Button
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.Sizes.LARGE * -1).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.addTarget(self, action: #selector(EditCategoryViewController.editCategory), for: .touchUpInside)
        
    }
    
    @objc func onBackClicked(){
        AppDelegate.navigationController.popViewController(animated: true)
    }
    
    @objc func editCategory(){
        category?.catName = addTaskTextView.text!
        database.updateCategory(category: category!)
        self.navigationController?.popViewController(animated: true)
        print("edited category")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

