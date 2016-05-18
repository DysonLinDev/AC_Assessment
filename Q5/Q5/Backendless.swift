//
//  Backendless.swift
//  Q5
//
//  Created by MBPrDyson on 5/18/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import Foundation


class Photos: NSObject
{
    var Id: String?
    var describe: String?
    var photoData: String?
}


class PhotosArray {
    var data:[Photos] = []
    
    func load() {
        // Read data and react to changes
    }
    
    
    
    static let shareInstance = PhotosArray()
}

class Api {
    
    class func save(photo:Photos) {
        var error : Fault? = Fault()
        let result = Backendless.sharedInstance().persistenceService.of(Photos.ofClass()).save(photo, fault: &error) as? Photos
        
        if error == nil {
            print("Contact has been saved: \(result!.Id)")
        }
        else {
            print("Server reported an error: \(error)")
        }
    }
}