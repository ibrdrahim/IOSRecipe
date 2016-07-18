//
//  Recipe.swift
//  Learning1_RecipesApp
//
//  Created by ibrahim on 7/12/16.
//  Copyright © 2016 ibrahim. All rights reserved.
//

import UIKit

// Recipe class
// title : recipe title
// content : the content of recipe

class Recipe: NSObject,NSCoding{
    var title:String?
    var content:String?
    
    // initiate recipe object
    init(title:String,content:String) {
        self.title = title
        self.content = content
    }
    
    // if caller doesn't provide the required field (title,content)
    // overide init to return null object
    override init() {
        super.init()
    }
    
    required init(coder aDecoder : NSCoder ){
        if let titleDecoded = aDecoder.decodeObjectForKey("title") as? String{
            title = titleDecoded
        }
        
        if let contentDecoded = aDecoder.decodeObjectForKey("content") as? String{
            content = contentDecoded
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = title{
            aCoder.encodeObject(titleEncoded, forKey: "title")
        }
        if let contentDecoded = content{
            aCoder.encodeObject(contentDecoded,forKey: "content")
        }
    }
}
