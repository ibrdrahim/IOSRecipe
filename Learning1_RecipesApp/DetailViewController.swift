//
//  DetailViewController.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/11/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeContent: UITextView!
    var preRecipe:Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeContent.backgroundColor =
        UIColor.blackColor().colorWithAlphaComponent(0.2)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.title = preRecipe?.title
        self.recipeContent.text = preRecipe?.content
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
