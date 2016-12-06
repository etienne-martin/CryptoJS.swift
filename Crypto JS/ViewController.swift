//
//  ViewController.swift
//  Crypto JS
//
//  Created by Emartin on 7/30/15.
//  Copyright (c) 2015 Emartin. All rights reserved.
//

import UIKit

extension Data {
    func hexString() -> NSString {
        let str = NSMutableString()
        let bytes = UnsafeBufferPointer<UInt8>(start: (self as NSData).bytes.bindMemory(to: UInt8.self, capacity: self.count), count:self.count)
        for byte in bytes {
            str.appendFormat("%02hhx", byte)
        }
        return str
    }
}
extension String {
    func hexadecimal() -> Data? {
        var data = Data(capacity: characters.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, options: [], range: NSMakeRange(0, characters.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else {
            return nil
        }
        
        return data
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load only what's necessary
        let AES = CryptoJS.AES()
        
        // AES encryption
        let encrypted = AES.encrypt("secretMessage", secretKey: "password123")
        let encrypted2 = AES.encrypt("secretMessage", secretKey: "password123", options:["iv":123])
        
        // AES encryption with custom mode and padding
        _ = CryptoJS.mode.ECB() // Load custom mode
        _ = CryptoJS.pad.Iso97971() // Load custom padding scheme
        let encrypted3 = AES.encrypt("secretMessage", secretKey: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])
        
        print(encrypted)
        print(encrypted2)
        print(encrypted3)
        
        // AES decryption
        print(AES.decrypt(encrypted, secretKey: "password123"))
        print(AES.decrypt(encrypted2, secretKey: "password123"))
        
        // AES decryption with custom mode and padding
        print(AES.decrypt(encrypted3, secretKey: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ]))
        
        // AES file encryption
        let sampleFilePath = Bundle.main.path(forResource: "sampleFile", ofType: "jpg")
        let sampleFileData: NSData? = NSData(contentsOfFile: sampleFilePath!)
        
        if let fileData = sampleFileData {
            // Convert the file data to a hexadecimal string
            let fileHexData = (fileData as Data).hexString() as String
            
            // Encrypt the hexadecimal string
            let encryptedFile = AES.encrypt(fileHexData, secretKey: "password123")
            
            // AES file decryption
            let decryptedFile = (AES.decrypt(encryptedFile, secretKey: "password123")).hexadecimal()!
            
            // Write the file to the disk
            FileManager.default.createFile(atPath: URL(string: "/var/tmp")!.appendingPathComponent("sampleFile.jpg").path,contents:decryptedFile, attributes:nil)
        }
        
        // Load TripleDES
        let TripleDES = CryptoJS.TripleDES()
        
        // TripleDES encryption
        let TripleDESencrypted = TripleDES.encrypt("secretMessage", secretKey: "password123")
        
        print(TripleDESencrypted)
        
        // TripleDES decryption
        print(TripleDES.decrypt(TripleDESencrypted, secretKey: "password123"))
        
        // Load DES
        let DES = CryptoJS.DES()
        
        // TripleDES encryption
        let DESencrypted = DES.encrypt("secretMessage", secretKey: "password123")
        
        print(DESencrypted)
        
        // TripleDES decryption
        print(DES.decrypt(DESencrypted, secretKey: "password123"))
        
        
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
