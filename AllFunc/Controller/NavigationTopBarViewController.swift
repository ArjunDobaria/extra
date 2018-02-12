//
//  NavigationTopBarViewController.swift
//  AllFunc
//
//  Created by lanet on 09/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit

class NavigationTopBarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var mainView = UIView()
    var imgView = UIImageView()
    var containerView = UIView()
    
    var titleView = UIView()
    var bottomView = UIView()
    
    var pickerView : UIPickerView = UIPickerView()
    
    var pickerArray = ["Arjun" ,"Ravi", "Sharad", "Sagar", "Soham"]
    var imgArray : [UIImage] = [UIImage(named: "plus")!,UIImage(named: "compose")!,UIImage(named: "person_add")!,UIImage(named: "search")!,UIImage(named: "twitter_logo")!]
    
    var myImg : UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
    }
    func picker(){
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //main View
        mainView.backgroundColor = UIColor.black
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(mainView)

        //Img View
        imgView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        imgView.backgroundColor = UIColor.blue
//        self.mainView.addSubview(imgView)

        //Container View
        containerView.frame = CGRect(x: 20, y: UIScreen.main.bounds.height / 5.5, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2)
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 10
        self.mainView.addSubview(containerView)

        //Title View
        titleView.frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height / 6)
        let textlbl = UILabel()
        textlbl.frame = CGRect(x: 0, y: 0, width: titleView.bounds.width, height: titleView.bounds.height)
        textlbl.text = "Welcome"
        textlbl.textAlignment = .center
        textlbl.textColor = UIColor.black
        titleView.backgroundColor = UIColor.clear
        
        let imgview = UIImageView()
        imgview.frame = CGRect(x: 0, y: titleView.bounds.height - 1, width: titleView.bounds.width, height: 1)
        imgview.backgroundColor = UIColor.lightGray
        
        self.titleView.addSubview(imgview)
        self.titleView.addSubview(textlbl)
        self.containerView.addSubview(titleView)
        
        //Bottom View
        let imgview2 = UIImageView()
        imgview2.frame = CGRect(x: 0, y: 0, width: titleView.bounds.width, height: 1)
        imgview2.backgroundColor = UIColor.lightGray
        
        bottomView.frame = CGRect(x: 0, y: (titleView.bounds.height) * 5, width: containerView.bounds.width, height: containerView.bounds.height / 6)
        bottomView.backgroundColor = UIColor.clear
        
        let cancle = UIButton()
        cancle.setTitle("Cancle", for: .normal)
        cancle.setTitleColor(UIColor.black, for: .normal)
        cancle.addTarget(self, action: #selector(canclebtn), for: .touchUpInside)
        cancle.frame = CGRect(x: 0, y: 1, width: (bottomView.bounds.width / 2) - 1, height: bottomView.bounds.height - 1)
        
        let imgview3 = UIImageView()
        imgview3.frame = CGRect(x: bottomView.bounds.width / 2, y: 0, width: 1, height: bottomView.bounds.height)
        imgview3.backgroundColor = UIColor.lightGray
        
        let ok = UIButton()
        ok.setTitle("Ok", for: .normal)
        ok.setTitleColor(UIColor.black, for: .normal)
        ok.addTarget(self, action: #selector(okbtn), for: .touchUpInside)
        ok.frame = CGRect(x: bottomView.bounds.width / 2, y: 1, width: bottomView.bounds.width / 2, height: bottomView.bounds.height - 1)
        
        self.bottomView.addSubview(imgview3)
        self.bottomView.addSubview(ok)
        self.bottomView.addSubview(cancle)
        self.bottomView.addSubview(imgview2)
        self.containerView.addSubview(bottomView)
        
        //PickerView
        pickerView.frame = CGRect(x: 0, y: titleView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height - (titleView.bounds.height + bottomView.bounds.height))
        self.containerView.addSubview(pickerView)
        
        containerView.layer.borderColor = UIColor.black.cgColor
    }
    
    //MARK:- Picker Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //When to show text
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Tapped")
    }
    
    //when to show custome view with img all anything else
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let myView = UIView()
//        myView.frame = CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 35)
//        myView.backgroundColor = UIColor.clear
//
//        myImg.frame = CGRect(x: myView.bounds.width / 2, y: 0, width: 25, height: 25)
//        myImg = UIImageView(image: imgArray[row])
//
//        myView.addSubview(myImg)
//
//        return myView
//    }
    
    
    func NavBar(){
        //Center Image - Priority is first
        let titleimage = UIImageView(image: #imageLiteral(resourceName: "twitter_logo"))
        titleimage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        titleimage.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleimage
        
        //Center Name - priority is second
        self.navigationItem.title = "Navigation Bar Demo"
        
        //left side button
        let followbutton = UIButton(type: .system)
        followbutton.setImage(#imageLiteral(resourceName: "person_add").withRenderingMode(.alwaysOriginal), for: .normal)
        followbutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        followbutton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        let followbutton1 = UIButton(type: .system)
        followbutton1.setImage(#imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), for: .normal)
        followbutton1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: followbutton), UIBarButtonItem(customView: followbutton1)]
        
        //right side button
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        let composebutton = UIButton(type: .system)
        composebutton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composebutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        composebutton.addTarget(self, action: #selector(gonext), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composebutton), UIBarButtonItem(customView: searchButton)]
        
        //Background color = white and default color = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func removeVireFromSuperView(){
        titleView.removeFromSuperview()
        
        bottomView.removeFromSuperview()
        pickerView.removeFromSuperview()
        containerView.removeFromSuperview()
        mainView.removeFromSuperview()
    }

    //MARK:- Button Actions
    @objc func okbtn(){
        removeVireFromSuperView()
    }
    
    @objc func canclebtn(){
        removeVireFromSuperView()
    }
    
    @objc func gonext(){
        
        picker()
    }
    
    @objc func back()
    {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory Lickege Started")
    }

}
