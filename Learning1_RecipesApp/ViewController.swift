//
//  ViewController.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/11/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage( named: "candy"))

        NSUserDefaultManager.defaultInitialize()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell")
            as! RecipeTableViewCell
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }else{
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        
        let recipe = RecipeManager.recipes[indexPath.item]
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = recipe.title
        cell.recipeCell = recipe
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete){
            RecipeManager.deleteRecipe(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        NSUserDefaultManager.syncronize()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailView"){
            let cell = sender as! RecipeTableViewCell
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.preRecipe = cell.recipeCell
            
        }
    }

}

