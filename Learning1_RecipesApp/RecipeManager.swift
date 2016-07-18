//
//  RecipeManager.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/12/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    
    // array of Recipe Object
    static var recipes = [Recipe]()
    
    // class to add new recipe
    class func addRecipe(title:String,content:String){
        let r = Recipe(title:title, content:content)
        recipes.append(r)
    }
    
    // class to delete recipe by id
    class func deleteRecipe(id:Int){
        recipes.removeAtIndex(id)
    }
    
    // class to get recipes by id
    class func getRecipe(id:Int) -> Recipe{
        // check if recipes not empty
        if(recipes.count > 0){
            return recipes[id]
        }
        
        // return Recipe Object if recipes in empty
        return Recipe()
    }
}
