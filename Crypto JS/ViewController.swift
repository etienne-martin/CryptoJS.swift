//
//  ViewController.swift
//  Crypto JS
//
//  Created by Emartin on 7/30/15.
//  Copyright (c) 2015 Emartin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load only what's necessary
        var AES = CryptoJS.AES()
        var MD5 = CryptoJS.MD5()
        var SHA1 = CryptoJS.SHA1()
        var SHA256 = CryptoJS.SHA256()
        var SHA3 = CryptoJS.SHA3()
        
        var encrypted = AES.encrypt("awd",secretKey: "awd")
        
            println(encrypted)
        
        println(AES.decrypt(encrypted,secretKey: "awd"))
        
        println(MD5.hash("awd"))
        println(SHA1.hash("awd"))
        println(SHA256.hash("awd"))
        println(SHA3.hash("awd"))
        println(SHA3.hash("awd",outputLength: 256))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
