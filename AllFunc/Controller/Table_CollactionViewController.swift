//
//  Table_CollactionViewController.swift
//  AllFunc
//
//  Created by lanet on 11/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit

class Table_CollactionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    let tableButoon = UIButton()
    let colButoon = UIButton()
    let tblView = UITableView()
    var colView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Table Collaction Demo"
        
        //left back button
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        tableButoon.setTitleColor(UIColor.white, for: .normal)
        tableButoon.backgroundColor = UIColor.black
        
        colButoon.setTitleColor(UIColor.lightGray, for: .normal)
        colButoon.backgroundColor = UIColor.white
        
        tableButoon.isSelected = true
        
        tableView()
        CollectionView()
        
        //TableView
        tableeView()
        
        //CollactioView
        collView()
    }
    
    //MARK:- Create Table View
    func tableeView(){
        tblView.delegate = self
        tblView.dataSource = self
        tblView.frame = CGRect(x: 0, y: tableButoon.frame.origin.y + tableButoon.bounds.height + 10 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - tableButoon.frame.origin.y + tableButoon.bounds.height )
        tblView.register(UINib(nibName: "TableViewUITTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewUITTableViewCell")
        self.view.addSubview(tblView)
    }
    
    //MARK:- Create Collection View
    func collView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
        let fram = CGRect(x: 10, y: tableButoon.frame.origin.y + tableButoon.bounds.height + 10 , width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - tableButoon.frame.origin.y + tableButoon.bounds.height )
        colView = UICollectionView(frame: fram, collectionViewLayout: layout)
        colView.delegate   = self
        colView.dataSource = self
        colView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        colView.backgroundColor = UIColor.white
        self.view.addSubview(colView)
        colView.isHidden = true
    }
    
    //MARK:- This Methos call when your screen frame get change
    override func viewDidLayoutSubviews() {
        colView.removeFromSuperview()
        tblView.removeFromSuperview()
        
        if(tableButoon.isSelected)
        {
            tableButoon.setTitleColor(UIColor.white, for: .normal)
            tableButoon.backgroundColor = UIColor.black
            
            colButoon.setTitleColor(UIColor.lightGray, for: .normal)
            colButoon.backgroundColor = UIColor.white
            
            colView.removeFromSuperview()
            tblView.isHidden = false
            colView.isHidden = true
            self.view.addSubview(tblView)
        }
        else
        {
            colButoon.setTitleColor(UIColor.white, for: .normal)
            colButoon.backgroundColor = UIColor.black
            
            tableButoon.setTitleColor(UIColor.lightGray, for: .normal)
            tableButoon.backgroundColor = UIColor.white
            
            tblView.removeFromSuperview()
            tblView.isHidden = true
            colView.isHidden = false
            self.view.addSubview(colView)
            
        }
        
        tableView()
        CollectionView()
        
        //TableView
        tableeView()
        
        //CollactioView
        collView()
    }
    
    //MARK:- Create Two Buttons Table View and Collection View
    func tableView()
    {
        tableButoon.setTitle("Table View", for: .normal)
        tableButoon.frame = CGRect(x: 20, y: 10, width: UIScreen.main.bounds.width / 2-20, height: 50)
        tableButoon.addTarget(self, action: #selector(tbl), for: .touchUpInside)
        self.view.addSubview(tableButoon)
    }
    func CollectionView()
    {
        colButoon.setTitle("Collection View", for: .normal)
        colButoon.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: 10, width: UIScreen.main.bounds.width / 2-20, height: 50)
        colButoon.addTarget(self, action: #selector(col), for: .touchUpInside)
        self.view.addSubview(colButoon)
    }
    
    //MARK:- CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    //MARK:- TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Use this when work with xib
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewUITTableViewCell", for: indexPath) as! TableViewUITTableViewCell
        
        //Use this when need to create cell programetically
//        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //MARK:- Actions of button
    @objc func tbl(){
        changeColor(btn1: tableButoon, btn2: colButoon)
        tblView.isHidden = false
        colView.isHidden = true
        tableButoon.isSelected = true
        colButoon.isSelected = false
    }
    
    @objc func col(){
        changeColor(btn1: colButoon, btn2: tableButoon)
        tblView.isHidden = true
        colView.isHidden = false
        tableButoon.isSelected = false
        colButoon.isSelected = true
    }
    
    //MARK:- Common Function
    func changeColor(btn1 : UIButton, btn2 : UIButton){
        btn1.setTitleColor(UIColor.white, for: .normal)
        btn1.backgroundColor = UIColor.black
        btn2.setTitleColor(UIColor.lightGray, for: .normal)
        btn2.backgroundColor = UIColor.white
    }
    
    //MARK:- Back Button action
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory Lickege Started")
    }

    

}
