//
//  MyViewController.swift
//  Q5
//
//  Created by MBPrDyson on 5/18/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        // Do any additional setup after loading the view.
        let backendless = Backendless.sharedInstance()
        let user: BackendlessUser = BackendlessUser()
        user.email = "linshihting1029@gmail.com"
        user.password = "apple21029"
//        if !backendless.userService.isStayLoggedIn {
//            backendless.userService.registering(user)
//        }
        
        
        let cellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        self.myTableView.registerNib(cellNib, forCellReuseIdentifier: "MyTableViewCell")
        
        let allData = backendless.data.of(Photos.ofClass()).find().getCurrentPage()
        for data in allData {
            //print(data)
            //let photoData = Photos()
            //photoData.Id = data.
            PhotosArray.shareInstance.data.append(data as! Photos)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhotoAction(sender: AnyObject) {
        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CameraViewController")
        self.presentViewController(destinationController, animated: true, completion: nil)
    }

    override func viewWillAppear(animated: Bool) {
        self.myTableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTableViewCell") as! MyTableViewCell
        if let des = PhotosArray.shareInstance.data[indexPath.row].describe {
            cell.contentLabel.text = des
        }
        
        if let backendData = PhotosArray.shareInstance.data[indexPath.row].photoData {
            let data = NSData(base64EncodedString: backendData , options:  NSDataBase64DecodingOptions())
            if data != nil  && data != "" {
                cell.photoImageView.image = UIImage(data: data!)
            }
        }
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhotosArray.shareInstance.data.count
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
