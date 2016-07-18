//
//  NSUserDefaultManager.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/13/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

class NSUserDefaultManager: NSObject {
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    class func syncronize(){
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "recipeArr")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func defaultInitialize(){
        if let recipesRaw = NSUserDefaults.standardUserDefaults().dataForKey("recipeArr"){
            if let recipes = NSKeyedUnarchiver.unarchiveObjectWithData(recipesRaw) as? [Recipe]{
                RecipeManager.recipes = recipes
            }
        }
    }
    
}
