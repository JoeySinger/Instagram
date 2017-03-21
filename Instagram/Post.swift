//
//  Post.swift
//  Instagram
//
//  Created by Joey Singer on 3/20/17.
//  Copyright © 2017 Joey Singer. All rights reserved.
//

import UIKit
import Parse
class Post: NSObject {
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {

        let post = PFObject(className: "Post")
        

        post["media"] = getPFFileFromImage(image: image)
        post["caption"] = caption
       
        
        
        post.saveInBackground(block: completion)
    }
    
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
     
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }

}
