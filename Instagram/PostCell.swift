//
//  PostCell.swift
//  Instagram
//
//  Created by Joey Singer on 3/20/17.
//  Copyright © 2017 Joey Singer. All rights reserved.
//

import UIKit
import Parse
class PostCell: UITableViewCell {

    @IBOutlet weak var picView: UIImageView!
    
    
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var post: PFObject?{
        didSet{
            self.captionLabel.text = post?.value(forKey: "caption") as? String
            
            
            if let postImage = post?.value(forKey: "media") as? PFFile{
                postImage.getDataInBackground(block: { (image:Data?, error:Error?) in
                    if error == nil{
                        self.picView.image = UIImage.init(data: image!)
                    }else{
                        print(error?.localizedDescription)
                    }
                    
                })
            }
        }
        
    }

}
