//
//  PostsViewController.swift
//  Instagram
//
//  Created by Joey Singer on 3/20/17.
//  Copyright © 2017 Joey Singer. All rights reserved.
//

import UIKit
import Parse
class PostsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var posts: [PFObject]!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
     
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.posts?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = self.posts[indexPath.row]
        //self.tableView.reloadData()
        return cell
    }
    
   
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
       
        
        
        // Configure session so that completion handler is executed on main UI thread
       
            
        let query = PFQuery(className: "Post")
        query.order(byDescending: "_created_at")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts{
                print("Does it go here ")
                self.posts = posts
                self.tableView.reloadData()
                
            }else{
                print(error?.localizedDescription)
            }
        }
        self.tableView.reloadData()
    
            // Tell the refreshControl to stop spinning
        refreshControl.endRefreshing()
        //task.resume()
        }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
