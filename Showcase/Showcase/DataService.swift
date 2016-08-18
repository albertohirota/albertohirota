//
//  DataService.swift
//  Showcase
//
//  Created by Alberto Hirota on 8/17/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase



class DataService {
    static let ds = DataService()
    
    
    //base reference that will be using for logging, accessing, authenticate
    var REF_BASE = FIRDatabase.database().reference()
//    // var _REF_BASE = FIRDatabaseReference(url: "https://console.firebase.google.com/project/showcase-ff9d9/")
//        var REF_BASE: FIRDatabase.database().reference() { //https://showcase-ff9d9.firebaseio.com //old url
    //        return _REF_BASE //https://showcase-ff9d9.firebaseio.com/

//    }
    
}