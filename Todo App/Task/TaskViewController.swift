//
//  TaskViewController.swift
//  Todo App
//
//  Created by Akshay More on 09/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import UIKit
import EventKit

class TaskViewController: UIViewController{

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventStore = EKEventStore()
        view.backgroundColor = UIColor.black
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
        //datePicker
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(TaskViewController.setReminder), for: .valueChanged)
//        self.view.addSubview(datePicker)
        
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
        doneButton.addTarget(self, action: #selector(TaskViewController.addTask), for: .touchUpInside)
        
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
        
        //Date Picker
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        datePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        datePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        datePicker.widthAnchor.constraint(equalToConstant: Constants.screenWidth).isActive = true
        reminderButton.inputView = datePicker
    }
    
    @objc func onBackClicked(){
        AppDelegate.navigationController.popViewController(animated: true)
    }
    
    @objc func addTask(){
        if (addTaskTextView.text != nil && addTaskTextView.text != "") {
            database.addTask(taskName: addTaskTextView.text!, catId: (category?.catId)!)
            onBackClicked()
        }
    }
    
    @objc func setReminder(){
        print("this function was called ")
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
        var dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        var alarm = EKAlarm(absoluteDate: myDate)
        reminder.addAlarm(alarm)
        let stringdate = dateFormat.string(from: myDate)
        print("selected date \(stringdate)")
        do {
            try eventStore?.save(reminder,commit: true)
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
            return
        }
        print("Reminder set")
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
