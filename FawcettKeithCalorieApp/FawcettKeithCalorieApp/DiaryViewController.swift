//
//  ViewController.swift
//  FawcettKeithCalorieApp
//
//  Created by Keith Fawcett on 9/6/16.
//  Copyright © 2016 Keith Fawcett. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {

  let color = UIColor(red: 112.0/255.0, green: 199.0/255.0, blue: 253.0/255.0, alpha: 0.7)
  
  override func viewDidLoad() {
    UITabBar.appearance().barTintColor = color
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

