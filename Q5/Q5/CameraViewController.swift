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

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func takephotoAction(sender: AnyObject) {
        self.cameraManager.capturePictureWithCompletition({ (image, error) in
            if let imageToSave = image {
                
                let id = String(PhotosArray.shareInstance.data.count + 1 )
                let describe = self.photoDescribeText.text!
                let photo = Photos()
                photo.Id = id
                photo.describe = describe
                photo.photoData = UIImageJPEGRepresentation(imageToSave, 1.0)?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
                
                let photoSave = Photos()
                photoSave.Id = id
                photoSave.describe = describe
                photoSave.photoData = UIImageJPEGRepresentation(imageToSave, 1.0)?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
                print(photoSave.photoData)
                PhotosArray.shareInstance.data.append(photoSave)
                
                Api.save(photo)
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
