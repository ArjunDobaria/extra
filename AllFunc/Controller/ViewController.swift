//
//  ViewController.swift
//  AllFunc
//
//  Created by lanet on 09/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Custom Variables
    var mainView : UIView = UIView()
    var navigationBarButton : UIButton = UIButton()
    var navigationButton : UIButton = UIButton()
    var tableButton : UIButton = UIButton()
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //Main View
        viewInit()
        
        //Navigation Bar Button
        navBarButton()
        
        //Navigation Button
        navButton()
        
        //Table Button
        tblButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        //Main View
        viewInit()
        
        //Navigation Bar Button
        navBarButton()
        
        //Navigation Button
        navButton()
        
        //Table Button
        tblButton()
    }
    
    
    //MARK:- Initialize View
    func viewInit(){
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        mainView.backgroundColor = UIColor.clear
        self.view.addSubview(mainView)
    }
    //MARK:- Intialize Button
    
    //Navigation Bar Button
    func navBarButton(){
        navigationBarButton.frame = CGRect(x: 20, y: 60, width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/6)
        navigationBarButton.setTitle("Navigation Bar Demo", for: .normal)
        navigationBarButton.setTitleColor(UIColor.white, for: .normal)
        navigationBarButton.backgroundColor = UIColor.black
        navigationBarButton.addTarget(self, action: #selector(navigationBarButtonAction), for: .touchUpInside)
        self.mainView.addSubview(navigationBarButton)
    }
    
    //Navigation Button
    func navButton(){
        navigationButton.frame = CGRect(x: 20, y: navigationBarButton.bounds.height + navigationBarButton.frame.origin.y + 20 , width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/6)
        navigationButton.setTitle("Navigation Demo", for: .normal)
        navigationButton.setTitleColor(UIColor.white, for: .normal)
        navigationButton.backgroundColor = UIColor.black
        navigationButton.addTarget(self, action: #selector(navigationButtonAction), for: .touchUpInside)
        self.mainView.addSubview(navigationButton)
    }
    
    //Table and Collaction View Button
    func tblButton(){
        
//        navigationButton.frame.origin.y
        tableButton.frame = CGRect(x: 20, y: navigationButton.bounds.height + navigationButton.frame.origin.y + 20, width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/6)
        tableButton.setTitle("Table & Collaction Demo", for: .normal)
        tableButton.setTitleColor(UIColor.white, for: .normal)
        tableButton.backgroundColor = UIColor.black
        tableButton.addTarget(self, action: #selector(tableButtonAction), for: .touchUpInside)
        self.mainView.addSubview(tableButton)
    }
    
    //MARK:- Actions of all Buttons
    
    //naviation bar button
    @objc func navigationBarButtonAction(button : UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationTopBarViewController") as! NavigationTopBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //navigation button
    @objc func navigationButtonAction(button : UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NavigateViewController") as! NavigateViewController
        //assign new navigation controller to this present view
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    //table and collaction button
    @objc func tableButtonAction(button : UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Table_CollactionViewController") as! Table_CollactionViewController
        //assign new navigation controller to this present view
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    //MARK:- Memory Warning Method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory Lickege Started")
    }


}

