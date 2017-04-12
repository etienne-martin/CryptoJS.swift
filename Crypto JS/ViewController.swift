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
        
        print("[AES]\n")
        
        // Load only what's necessary
        let AES = CryptoJS.AES()
        
        // AES encryption
        let encrypted = AES.encrypt("Secret message", password: "password123")
        
        // AES encryption with custom mode and padding
        _ = CryptoJS.mode.ECB() // Load custom mode
        _ = CryptoJS.pad.Iso97971() // Load custom padding scheme
        let encrypted2 = AES.encrypt("Secret message", password: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])
        
        print(encrypted)
        print(encrypted2)
        
        // AES decryption
        print(AES.decrypt(encrypted, password: "password123"))
        
        // AES decryption with custom mode and padding
        print(AES.decrypt(encrypted2, password: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ]))
        
        print("\n[TripeDES]\n")
        
        // Load TripleDES
        let TripleDES = CryptoJS.TripleDES()
        
        // TripleDES encryption
        let TripleDESencrypted = TripleDES.encrypt("Secret message", password: "password123")
        
        print(TripleDESencrypted)
        
        // TripleDES decryption
        print(TripleDES.decrypt(TripleDESencrypted, password: "password123"))
        
        print("\n[DES]\n")
        
        // Load DES
        let DES = CryptoJS.DES()
        
        // TripleDES encryption
        let DESencrypted = DES.encrypt("Secret message", password: "password123")
        
        print(DESencrypted)
        
        // TripleDES decryption
        print(DES.decrypt(DESencrypted, password: "password123"))
        
        print("\n[Hashing functions]\n")
        
        // Hashers
        let MD5 = CryptoJS.MD5()
        let SHA1 = CryptoJS.SHA1()
        let SHA224 = CryptoJS.SHA224()
        let SHA256 = CryptoJS.SHA256()
        let SHA384 = CryptoJS.SHA384()
        let SHA512 = CryptoJS.SHA512()
        let SHA3 = CryptoJS.SHA3()
        let RIPEMD160 = CryptoJS.RIPEMD160()
        
        print(MD5.hash("mystring"))
        print(SHA1.hash("mystring"))
        print(SHA224.hash("mystring"))
        print(SHA256.hash("mystring"))
        print(SHA384.hash("mystring"))
        print(SHA512.hash("mystring"))
        print(SHA3.hash("mystring"))
        print(SHA3.hash("mystring",outputLength: 256))
        print(RIPEMD160.hash("mystring"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
