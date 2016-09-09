//
//  inputDetailViewController.swift
//  FawcettKeithCalorieApp
//
//  Created by Keith Fawcett on 9/7/16.
//  Copyright © 2016 Keith Fawcett. All rights reserved.
//

import UIKit

class InputDetailViewController: UIViewController {
  
  @IBOutlet weak var calories: UILabel!
  @IBOutlet weak var fats: UILabel!
  @IBOutlet weak var protien: UILabel!
  @IBOutlet weak var carbohydrates: UILabel!
  @IBOutlet weak var servingSize: UILabel!
  
  
  var selectedFood:Food?

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.title = selectedFood!.name!
      calories.text = String(selectedFood!.calories!)
      fats.text = String(selectedFood!.fat!)
      protien.text = String(selectedFood!.protein!)
      carbohydrates.text = String(selectedFood!.carbohydrates!)
      servingSize.text = String(selectedFood!.servingSize!) + " " + String(selectedFood!.servingUnit!)

        // Do any additional setup after loading the view.
      
      
//      calories.text = String(selectedFood!.calories)
//      fats.text = String(selectedFood!.fat)
      
      
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  

  
  
  
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
