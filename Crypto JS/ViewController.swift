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
        let AES = CryptoJS.AES()
        let MD5 = CryptoJS.MD5()
        let SHA1 = CryptoJS.SHA1()
        let SHA256 = CryptoJS.SHA256()
        let SHA3 = CryptoJS.SHA3()
        
        var encrypted = AES.encrypt("secretMessage",secretKey: "password123")
        
        println(encrypted)
        
        println(AES.decrypt(encrypted,secretKey: "password123"))
        
        println(MD5.hash("mystring"))
        println(SHA1.hash("mystring"))
        println(SHA256.hash("mystring"))
        println(SHA3.hash("mystring"))
        println(SHA3.hash("mystring",outputLength: 256))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
