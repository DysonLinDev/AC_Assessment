//
//  CameraViewController.swift
//  Q5
//
//  Created by MBPrDyson on 5/18/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import UIKit
import CameraManager

class CameraViewController: UIViewController {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var photoDescribeText: UITextField!
    
    let cameraManager = CameraManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.initCamera()
    }
    
    func initCamera() {
        self.cameraManager.addPreviewLayerToView(self.previewImageView)
        self.cameraManager.cameraDevice = .Back
        self.cameraManager.cameraOutputMode = .StillImage
        self.cameraManager.cameraOutputQuality = .High
        self.cameraManager.writeFilesToPhoneLibrary = false
    }
    
    @IBAction func backAction(sender: AnyObject) {
    }

    
    @IBAction func takephotoAction(sender: AnyObject) {
        self.cameraManager.capturePictureWithCompletition({ (image, error) in
            if let imageToSave = image {
                
            }
        })
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
