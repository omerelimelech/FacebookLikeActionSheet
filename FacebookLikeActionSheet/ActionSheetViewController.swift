//
//  ActionSheetViewController.swift
//  FacebookLikeActionSheet
//
//  Created by Omer Elimelech on 4/28/19.
//  Copyright © 2019 Omer Elimelech. All rights reserved.
//

import Foundation
import UIKit


class ActionSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var topIndicator: UIView!
    var dataSource = [
        ActionItem(iconName: "note", titleString: "Title 1", expString: "description 1sdfsdfsdfsdfsdfsdfsdfsdf1sdfsdfsdfsdfsdfsdfsdfsdf1sdfsdfsdfsdfsdfsdfsdfsdf1sdfsdfsdfsdfsdfsdfsdfsdf1sdfsdfsdfsdfsdfsdfsdfsdf", target: self, selector: #selector(btn1Pressed)),
        ActionItem(iconName: "note", titleString: "Title 2", expString: "description 2", target: self, selector: #selector(btn2Pressed)),
        ActionItem(iconName: "note", titleString: "Title 3", expString: "description 3", target: self, selector: #selector(btn3Pressed)),
       ActionItem(iconName: "note", titleString: "Title 3", expString: "description 3", target: self, selector: #selector(btn3Pressed)),
       ActionItem(iconName: "note", titleString: "Title 3", expString: "description 3", target: self, selector: #selector(btn3Pressed)),
       ActionItem(iconName: "note", titleString: "Title 3", expString: "description 3", target: self, selector: #selector(btn3Pressed))
    ]
    
    var actionCellReuseId = "ActionSheetTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupUi()
        
        
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: actionCellReuseId, bundle: nil), forCellReuseIdentifier: actionCellReuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 8
        tableView.rowHeight = 70
        
    }
    func setupUi(){
        modalPresentationStyle = .overCurrentContext
        topIndicator.layer.cornerRadius = topIndicator.frame.height / 2
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.tableViewHeight.constant = (self?.tableView.contentSize.height)!
            UIView.animate(withDuration: 0.4, animations: {
                self?.view.layoutIfNeeded()
                self?.view.backgroundColor = UIColor(white: 0.7, alpha: 0.5)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: actionCellReuseId, for: indexPath) as? ActionSheetTableViewCell else {return UITableViewCell()}
        
        cell.item = self.dataSource[indexPath.row]
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}


extension ActionSheetViewController {
    
    @objc func btn1Pressed(){
        print ("btn1Pressed")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func btn2Pressed(){
        print ("btn2Pressed")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func btn3Pressed(){
        print ("btn3Pressed")
        self.dismiss(animated: true, completion: nil)
    }
}
