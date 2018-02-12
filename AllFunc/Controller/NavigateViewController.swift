//
//  NavigateViewController.swift
//  AllFunc
//
//  Created by lanet on 11/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit

class NavigateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
    }
    
    func NavBar(){
        self.navigationItem.title = "Navigation Demo"
        
        //left back button
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        //rightside
        let nextbutton = UIButton(type: .system)
        nextbutton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        nextbutton.setTitle("Next", for: .normal)
        nextbutton.addTarget(self, action: #selector(gonext), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextbutton)
    }
    
    //MARK:- Button actions of nav bar
    @objc func gonext(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GonextVCViewController") as! GonextVCViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory Lickege Started")
    }
}
