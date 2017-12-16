//
//  TaskViewController.swift
//  Todo App
//
//  Created by Akshay More on 09/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    var backButton: UIButton!
    var addTaskLabel: UILabel!
    var addTaskTextView: UITextField!
    var categoryTitleLabel: UILabel!
    var categoryLabel: UILabel!
    var changeLabel: UILabel!
    var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews(){
        //back button
        backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        backButton.imageView?.contentMode = .scaleToFill
        view.addSubview(backButton)
        
        //Label
        addTaskLabel = UILabel()
        addTaskLabel.text = "Add Task"
        addTaskLabel.textColor = UIColor.white
        addTaskLabel.font = UIFont(name: addTaskLabel.font.fontName, size: Constants.TextSizes.EXTRA_LARGE_HUMONGOUS)
        view.addSubview(addTaskLabel)
        //TextField
        addTaskTextView = UITextField()
        addTaskTextView.font = UIFont.systemFont(ofSize: Constants.TextSizes.HUGE)
        addTaskTextView.textColor = UIColor.white
        addTaskTextView.attributedPlaceholder = NSAttributedString(string: "enter unacheivable task", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray])
        view.addSubview(addTaskTextView)
        //underline
        let underline = UIView()
        underline.backgroundColor = UIColor.white
        addTaskLabel.addSubview(underline)
        //categorytitle
        categoryTitleLabel = UILabel()
        categoryTitleLabel.text = "Category"
        categoryTitleLabel.textColor = UIColor.gray
        categoryTitleLabel.font = UIFont.systemFont(ofSize: Constants.TextSizes.REGULAR)
        view.addSubview(categoryTitleLabel)
        //category
        categoryLabel = UILabel()
        categoryLabel.text = "Personal"
        categoryLabel.textColor = UIColor.white
        categoryLabel.font = UIFont.systemFont(ofSize: Constants.TextSizes.LARGE)
        view.addSubview(categoryLabel)
        //change label
        changeLabel = UILabel()
        changeLabel.text = "Change Category"
        changeLabel.textColor = UIColor.white
        changeLabel.font = UIFont.systemFont(ofSize: Constants.TextSizes.MEDIUM)
        view.addSubview(changeLabel)
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
        let width = view.frame.width - Constants.Sizes.EXTRA_SMALL_HUGE * 2
        addTaskTextView.sizeToFit()
        print("view width: \(view.frame.width)")
        print("calculated width: \(width)")
//        addTaskTextView.widthAnchor.constraint(equalToConstant: width).isActive = true
        addTaskTextView.heightAnchor.constraint(equalToConstant: addTaskTextView.frame.height).isActive = true
        
        //underline
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.bottomAnchor.constraint(equalTo: addTaskTextView.bottomAnchor, constant: Constants.Sizes.SMALL).isActive = true
        underline.leftAnchor.constraint(equalTo: addTaskTextView.leftAnchor).isActive = true
        underline.rightAnchor.constraint(equalTo: addTaskTextView.rightAnchor).isActive = true
        //        underline.widthAnchor.constraint(equalTo: addTaskTextView.widthAnchor).isActive = true
        underline.heightAnchor.constraint(equalToConstant: Constants.Sizes.EXTRA_TINY).isActive = true
        
        //Category Title label
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryTitleLabel.topAnchor.constraint(equalTo: addTaskTextView.bottomAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        categoryTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        
        //Category Label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant:Constants.Sizes.TINY).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        
        //Change Label
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: Constants.Sizes.TINY).isActive = true
        changeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE * -1).isActive = true
        backButton.addTarget(self, action: #selector(TaskViewController.onBackClicked), for: .touchUpInside)
        
        //Done Button
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.Sizes.LARGE * -1).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
    }
    
    @objc func onBackClicked(){
        AppDelegate.navigationController.popViewController(animated: true)
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
