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
        
        // Encrypt AES
        var encrypted = AES.encrypt("secretMessage", secretKey: "password123")
        var encrypted2 = AES.encrypt("secretMessage", secretKey: "password123", options:["iv":123])
        
        // Encrypt AES with custom mode & padding
        let ECB = CryptoJS.mode.ECB()
        let Iso97971 = CryptoJS.pad.Iso97971()
        var encrypted3 = AES.encrypt("secretMessage", secretKey: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])
        
        println(encrypted)
        println(encrypted2)
        println(encrypted3)
        
        // Decrypt AES
        println(AES.decrypt(encrypted, secretKey: "password123"))
        println(AES.decrypt(encrypted2, secretKey: "password123"))
        
        // Decrypt AES with custom mode & padding
        println(AES.decrypt(encrypted3, secretKey: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ]))
        
        // Hashers
        let MD5 = CryptoJS.MD5()
        let SHA1 = CryptoJS.SHA1()
        let SHA224 = CryptoJS.SHA224()
        let SHA256 = CryptoJS.SHA256()
        let SHA384 = CryptoJS.SHA384()
        let SHA512 = CryptoJS.SHA512()
        let SHA3 = CryptoJS.SHA3()
        let RIPEMD160 = CryptoJS.RIPEMD160()
        
        println(MD5.hash("mystring"))
        println(SHA1.hash("mystring"))
        println(SHA224.hash("mystring"))
        println(SHA256.hash("mystring"))
        println(SHA384.hash("mystring"))
        println(SHA3.hash("mystring"))
        println(SHA512.hash("mystring"))
        println(SHA3.hash("mystring",outputLength: 256))
        println(RIPEMD160.hash("mystring"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
