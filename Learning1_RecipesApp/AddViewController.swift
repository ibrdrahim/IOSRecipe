//
//  AddViewController.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/11/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var recipeContent: UITextView!
    @IBOutlet weak var iCloudDocsButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleText.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        iCloudDocsButton.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.95)
        addButton.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.95)
        
        //disable input button
        doneButton.enabled = false
        addButton.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddViewController.textTitleDidChange), name: UITextFieldTextDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddViewController.recipeContentDidChange), name: UITextViewTextDidChangeNotification, object: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textTitleDidChange(){
        handdleButtonState()
    }
    
    func recipeContentDidChange(){
        handdleButtonState()
    }
    
    @IBAction func addButton_click(sender: AnyObject) {
        
        activityIndicator.startAnimating()
        
        let time = dispatch_time(DISPATCH_TIME_NOW,Int64( 0.5 *
            Double(NSEC_PER_SEC)))
        
        dispatch_after(time,dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
        }
        RecipeManager.addRecipe(titleText.text!, content: recipeContent.text )
        titleText.text = ""
        recipeContent.text = ""
        
        NSUserDefaultManager.syncronize() 
    }
    
    
    @IBAction func tittleDoneButton_click(sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    
    
    @IBAction func doneButton_click(sender: AnyObject) {
        recipeContent.resignFirstResponder()
    }
    
    // handle buttons state and validation
    func handdleButtonState(){
        // handles add button
        if(recipeContent.text != ""){
            doneButton.enabled = true
        }else{
            doneButton.enabled = false
        }
        // handles add button
        if(titleText.text != "" && recipeContent.text != ""){
            addButton.enabled = true
            addButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }else{
            addButton.enabled = false
            addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
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
