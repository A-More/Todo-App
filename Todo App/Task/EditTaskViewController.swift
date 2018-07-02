//
//  EditTaskViewController.swift
//  Todo App
//
//  Created by Akshay More on 25/06/18.
//  Copyright © 2018 Akshay More. All rights reserved.
//

//
//  TaskViewController.swift
//  Todo App
//
//  Created by Akshay More on 09/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit
import EventKit

class EditTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ChangeCategoryProtocol{
    
    var backButton: UIButton!
    var addTaskLabel: UILabel!
    var addTaskTextView: UITextField!
    var categoryTitleLabel: UILabel!
    var categoryLabel: UILabel!
    var changeLabel: UILabel!
    var doneButton: UIButton!
    var reminderButton: UITextField!
    var reminderIcon: UIImageView!
    var category: Category?
    var eventStore: EKEventStore?
    var datePicker: UIDatePicker!
    var database = DatabaseAssistant.instance
    var heightConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var stringDate:String?
    var categoryList: UICollectionView!
    var categories: [Category] = []
    var task: Task
    
    
    init(category: Category, task: Task) {
        self.category = category
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventStore = EKEventStore()
        view.backgroundColor = UIColor.black
        database = DatabaseAssistant.instance
        categories = (database.getCategories())
        eventStore?.requestAccess(to: .reminder, completion: {(granted, error) in
            if !granted {
                print ("Access not granted")
            }
        })
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
        addTaskLabel.text = "Edit Task"
        addTaskLabel.textColor = UIColor.white
        addTaskLabel.font = UIFont(name: addTaskLabel.font.fontName, size: Constants.TextSizes.EXTRA_LARGE_HUMONGOUS)
        view.addSubview(addTaskLabel)
        //TextField
        addTaskTextView = UITextField()
        addTaskTextView.font = UIFont.systemFont(ofSize: Constants.TextSizes.HUGE)
        addTaskTextView.textColor = UIColor.white
        addTaskTextView.text = task.tName
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
        categoryLabel.text = category?.catName
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
        //Reminder Button
        reminderButton = UITextField()
        reminderButton.text = "Set Reminder"
        reminderButton.allowsEditingTextAttributes = false
        reminderButton.font = UIFont.systemFont(ofSize: Constants.TextSizes.MEDIUM)
        reminderButton.textColor = UIColor.white
        view.addSubview(reminderButton)
        // Reminder Icon
        reminderIcon = UIImageView()
        reminderIcon.image = #imageLiteral(resourceName: "reminder icon")
        view.addSubview(reminderIcon)
        //categoryList
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: Constants.screenWidth - Constants.Sizes.EXTRA_SMALL_HUGE * 2, height: 20)
        categoryList = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        categoryList.register(ChangeCategoryCell.self, forCellWithReuseIdentifier: "ChangeCategoryCell")
        categoryList.dataSource = self
        categoryList.delegate = self
        view.addSubview(categoryList)
        //datePicker
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(TaskViewController.setReminder), for: .valueChanged)
        //        self.view.addSubview(datePicker)
        
        //CONSTRAINTS
        //backButton
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
        addTaskTextView.sizeToFit()
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
        categoryLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant:Constants.Sizes.SMALL).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        
        //Change Label
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: Constants.Sizes.TINY).isActive = true
        changeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE * -1).isActive = true
        changeLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(TaskViewController.onChangeCategoryClicked))
        changeLabel.addGestureRecognizer(tap)
        
        //CategoryList
        heightConstraint = categoryList.heightAnchor.constraint(equalToConstant: 0.0)
        heightConstraint?.isActive = true
        widthConstraint = categoryList.widthAnchor.constraint(equalToConstant: 0.0)
        widthConstraint?.isActive = true
        categoryList.translatesAutoresizingMaskIntoConstraints = false
        categoryList.topAnchor.constraint(equalTo: changeLabel.bottomAnchor).isActive = true
        categoryList.rightAnchor.constraint(equalTo: addTaskTextView.rightAnchor).isActive = true
        categoryList.leftAnchor.constraint(equalTo: addTaskTextView.leftAnchor).isActive = true
//        categoryList.setContentHuggingPriority(.init(750), for: .horizontal)
        categoryList.addConstraint(heightConstraint!)
        //        categoryList.addConstraint(widthConstraint!)
        
        //Done Button
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.Sizes.LARGE * -1).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.addTarget(self, action: #selector(EditTaskViewController.editTask), for: .touchUpInside)
        
        //Reminder Icon
        reminderIcon.translatesAutoresizingMaskIntoConstraints = false
        reminderIcon.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        reminderIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Sizes.EXTRA_SMALL_HUGE).isActive = true
        reminderIcon.widthAnchor.constraint(equalToConstant: Constants.Sizes.NORMAL).isActive = true
        reminderIcon.heightAnchor.constraint(equalToConstant: Constants.Sizes.NORMAL).isActive = true
        
        // Reminder Button
        reminderButton.translatesAutoresizingMaskIntoConstraints = false
        reminderButton.topAnchor.constraint(equalTo: reminderIcon.topAnchor).isActive = true
        reminderButton.leftAnchor.constraint(equalTo: reminderIcon.rightAnchor, constant: Constants.Sizes.TINY * 2).isActive = true
        reminderButton.bottomAnchor.constraint(equalTo: reminderIcon.bottomAnchor).isActive = true
        reminderButton.inputView = datePicker
        
        // Back Button
        backButton.addTarget(self, action: #selector(TaskViewController.onBackClicked), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChangeCategoryCell", for: indexPath) as! ChangeCategoryCell
        cell.category = categories[indexPath.row]
        cell.categoryButton.setTitle(categories[indexPath.row].catName, for: .normal)
        cell.changeCategoryProtocol = self
        cell.awakeFromNib()
        return cell
    }
    
    @objc func onBackClicked(){
        AppDelegate.navigationController.popViewController(animated: true)
    }
    
    @objc func editTask(){
        if (addTaskTextView.text != nil && addTaskTextView.text != "" && stringDate != nil) {
            database.addTask(taskName: addTaskTextView.text!, catId: (category?.catId)!, taskReminder: stringDate!)
            let newTask = Task(tId: self.task.tId, tName: addTaskTextView.text!, tCatId: self.category!.catId, tRem: stringDate!)
//            var result = database.updateTask(task: newTask)
                onBackClicked()
        }
    }
    
    @objc func onChangeCategoryClicked(){
        print("Change Category Clicked")
        if(heightConstraint?.constant == 0.0){
            heightConstraint?.constant = Constants.Sizes.HUGE * 4
        } else {
            heightConstraint?.constant = 0.0
        }
        categoryList.layoutIfNeeded()
        //        widthConstraint?.constant = Constants.screenWidth - Constants.Sizes.HUGE * 2
    }
    
    func onCategorySelected(category:Category){
        print("Category Selected")
        self.category = category
        print("Selected Category" + category.catName)
        heightConstraint?.constant = 0.0
        categoryLabel.text = category.catName
    }
    
    @objc func setReminder(){
        self.view.endEditing(true)
        let myDate = datePicker.date
        let reminder = EKReminder(eventStore: self.eventStore!)
        let calendar = eventStore?.defaultCalendarForNewReminders()
        reminder.title = addTaskTextView.text
        //create datecomponent object using date and insert nil on the components that you don't have
        let someCalendar = Calendar.current
        let year = someCalendar.component(.year, from: myDate)
        let month = someCalendar.component(.month, from: myDate)
        let day = someCalendar.component(.day, from: myDate)
        let hour = someCalendar.component(.hour, from: myDate)
        let min = someCalendar.component(.minute, from: myDate)
        let dueDateComponent = DateComponents(calendar: someCalendar,
                                              timeZone: nil,
                                              era: nil,
                                              year: year,
                                              month: month,
                                              day: day,
                                              hour: hour,
                                              minute: min,
                                              second: nil,
                                              nanosecond: nil,
                                              weekday: nil,
                                              weekdayOrdinal: nil,
                                              quarter: nil,
                                              weekOfMonth: nil,
                                              weekOfYear: nil,
                                              yearForWeekOfYear: nil)
        reminder.calendar = calendar
        reminder.dueDateComponents = dueDateComponent
        reminder.title = addTaskTextView.text ?? "Some Event"
        let alarm = EKAlarm(absoluteDate: myDate)
        reminder.addAlarm(alarm)
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM dd, yyyy"
        stringDate = dateFormat.string(from: myDate)
        print("selected date \(stringDate!)")
        do {
            try eventStore?.save(reminder,commit: true)
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
            return
        }
        print("Reminder set")
    }
    
}
