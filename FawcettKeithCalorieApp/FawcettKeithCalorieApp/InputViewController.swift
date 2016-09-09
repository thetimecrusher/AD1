//
//  InputViewController.swift
//  FawcettKeithCalorieApp
//
//  Created by Keith Fawcett on 9/7/16.
//  Copyright © 2016 Keith Fawcett. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FoodModelDelegate, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var picker: UIPickerView!

  var pickerArray = ["10", "20", "30", "40", "50", "60"]
  
  var food:[Food] = [Food]()
  var selectedFood:Food?
  let model = foodModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    picker.delegate = self
    
    self.model.delegate = self
    
    
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }
  
  func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    model.getFood((searchBar.text)!)
    searchBar.resignFirstResponder()
  }

 
  
  
  func dataReady() {
    self.food = self.model.allFoodsArray
    self.tableView.reloadData()
  }
  
  

  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerArray[row]
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerArray.count
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return food.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell")!
    
    let foodName = food[indexPath.row].name!
    let foodCalories = food[indexPath.row].calories!
    
   // customize cell
    let foodNamelabel = cell.viewWithTag(1) as! UILabel
    foodNamelabel.text = foodName
    
    let foodCalorieslabel = cell.viewWithTag(2) as! UILabel
    foodCalorieslabel.text = String(foodCalories)
    
    
    return cell
    
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    //which food was selected
    self.selectedFood = self.food[indexPath.row]
    //Call segue
    self.performSegueWithIdentifier("goToDetail", sender: self)
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    //get destination referance
    let detailViewContoller = segue.destinationViewController as! InputDetailViewController
    
    //set the selected food property of the destination view controller
    detailViewContoller.selectedFood = self.selectedFood
    
  }
  
  
}


















