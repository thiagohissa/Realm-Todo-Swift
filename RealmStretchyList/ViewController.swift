//
//  ViewController.swift
//  RealmStretchyList
//
//  Created by Thiago Hissa on 2017-08-04.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var navHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackButton: UIStackView!
    @IBOutlet weak var stackHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myTableView: UITableView!
    
    let realm = try! Realm() // [1]
    var arrayOfLanguages: Results<Language> { // [2]
        get {
            return realm.objects(Language.self)
        }
    }
    
    
   // var arrayOfLanguages: Results<Language>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.arrayOfLanguages.description)
    }
    

   
    
    
    //MARK: Button Actions
   
    @IBAction func addButton(_ sender: UIButton) {
        
        if self.navHeight.constant == 200 {
            self.navHeight.constant = 80
            self.stackButton.isHidden = true
            self.stackButton.isHidden = true
        }
        else{
            self.navHeight.constant = 200
            self.stackButton.isHidden = false
            self.stackButton.isHidden = false
        }
        
        UIView.animate(withDuration: 1.6,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: {
                        sender.transform = sender.transform.rotated(by: CGFloat(Double.pi/4))
                        if self.stackButton.isHidden {
                            self.buttonBottomConstraint.constant = 8
                            self.stackHeightConstraint.constant = 30
                        }
                        else{
                            self.buttonBottomConstraint.constant = 50
                            self.stackHeightConstraint.constant = 60
                        }
                        self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    
    @IBAction func swiftButtonPressed(_ sender: Any) {
        let language = Language()
        language.languageName = "Swift"
        language.languageImageString = "swift.png"
        
        
        try! realm.write{
            realm.add(language)
        }
        self.myTableView.insertRows(at: [IndexPath.init(row: self.arrayOfLanguages.count-1, section: 0)], with: .automatic)
    }
    
    
    @IBAction func objcButtonPressed(_ sender: Any) {
        let language = Language()
        language.languageName = "Objective-C"
        language.languageImageString = "objc.png"
        
        
        try! realm.write{
            realm.add(language)
        }
        self.myTableView.insertRows(at: [IndexPath.init(row: self.arrayOfLanguages.count-1, section: 0)], with: .automatic)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        
        let language = self.arrayOfLanguages[indexPath.row]
        
        cell.cellImage.image = UIImage(named: language.languageImageString)
        cell.cellMainLabel.text = language.languageName
        cell.cellDateLabel.text = Date().description
        
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // [2]
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete){
            let item = arrayOfLanguages[indexPath.row]
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
            
        }
        
    }
    
    
    
   
    



}

