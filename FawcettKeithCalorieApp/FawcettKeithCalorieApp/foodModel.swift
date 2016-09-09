//
//  foodModel.swift
//  FawcettKeithCalorieApp
//
//  Created by Keith Fawcett on 9/7/16.
//  Copyright © 2016 Keith Fawcett. All rights reserved.
//

import UIKit
import Alamofire

protocol FoodModelDelegate{
  func dataReady()
}


class foodModel: NSObject {
  
  var allFoodsArray = [Food]()
  
  var delegate:FoodModelDelegate?
  
  func getFood(search: String){
    
    Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/search/\(search)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat%2Cnf_protein%2Cnf_total_carbohydrate%2Cnf_serving_size_qty%2Cnf_serving_size_unit&appId=1890ebba&", parameters: ["appKey": "9b5345f984c69e9c2ef9d9ee5139e2d3"]).responseJSON { response in
      
      var foodsArray = [Food]()
      
     
      
      
      if let JSON = response.result.value {
        
        for hits in JSON["hits"] as! NSArray{
          //print("JSON: \(JSON)")
          print(hits)
          
          let foodsObj = Food()
          foodsObj.name = hits.valueForKeyPath("fields.item_name") as? String
          foodsObj.calories = hits.valueForKeyPath("fields.nf_calories") as? Int
          foodsObj.carbohydrates = hits.valueForKeyPath("fields.nf_total_carbohydrate") as? Int
          foodsObj.fat = hits.valueForKeyPath("fields.nf_total_fat") as? Int
          foodsObj.protein = hits.valueForKeyPath("fields.nf_protein") as? Int
          foodsObj.servingSize = hits.valueForKeyPath("fields.nf_serving_size_qty") as? Int
          foodsObj.servingUnit = hits.valueForKeyPath("fields.nf_serving_size_unit") as? String
          
          foodsArray.append(foodsObj)
          
        }
        self.allFoodsArray = foodsArray
        
        if self.delegate != nil{
          self.delegate!.dataReady()
        }
      }
    }
  }
}



