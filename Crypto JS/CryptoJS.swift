//
//  Crypto JS.swift
//  Crypto JS
//
//  Created by Emartin on 2015-08-25.
//  Copyright (c) 2015 Emartin. All rights reserved.
//

import Foundation

import JavaScriptCore

public class CryptoJS{
    
    public class AES: CryptoJS{
        
        private var encryptFunction: JSValue!
        private var decryptFunction: JSValue!
     
        override init(){
            
            // Retrieve the content of aes.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("aes", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
            
                let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                
                if(( cryptoJS ) != nil){
                    println("Loaded aes.js")
                    
                    // Create JS context
                    let cryptoJScontext = JSContext()
                    // Evaluate aes.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    encryptFunction = cryptoJScontext.objectForKeyedSubscript("encrypt")
                    decryptFunction = cryptoJScontext.objectForKeyedSubscript("decrypt")
                }else{
                    println("Unable to load aes.js")
                }
                
            }else{
                println("Unable to find aes.js")
            }
            
        }
        
        public func encrypt(secretMessage: String,secretKey: String)->String {
            return "\(encryptFunction.callWithArguments([secretMessage, secretKey]))"
        }
        public func decrypt(encryptedMessage: String,secretKey: String)->String {
            return "\(decryptFunction.callWithArguments([encryptedMessage, secretKey]))"
        }
        
    }
    
    public class MD5: CryptoJS{
        
        private var MD5: JSValue!
        
        override init(){
            
            // Retrieve the content of md5.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("md5", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                
                if(( cryptoJS ) != nil){
                    println("Loaded md5.js")
                    
                    // Create JS context
                    let cryptoJScontext = JSContext()
                    // Evaluate md5.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.MD5 = cryptoJScontext.objectForKeyedSubscript("MD5")
                }else{
                    println("Unable to load md5.js")
                }
                
            }else{
                println("Unable to find md5.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.MD5.callWithArguments([string]))"
        }
        
    }
    
    public class SHA1: CryptoJS{
        
        private var SHA1: JSValue!
        
        override init(){
            
            // Retrieve the content of sha1.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha1", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                
                if(( cryptoJS ) != nil){
                    println("Loaded sha1.js")
                    
                    // Create JS context
                    let cryptoJScontext = JSContext()
                    // Evaluate sha1.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA1 = cryptoJScontext.objectForKeyedSubscript("SHA1")
                }else{
                    println("Unable to load sha1.js")
                }
                
            }else{
                println("Unable to find sha1.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA1.callWithArguments([string]))"
        }
        
    }
    
    public class SHA256: CryptoJS{
        
        private var SHA256: JSValue!
        
        override init(){
            
            // Retrieve the content of sha256.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha256", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                
                if(( cryptoJS ) != nil){
                    println("Loaded sha256.js")
                    
                    // Create JS context
                    let cryptoJScontext = JSContext()
                    // Evaluate sha256.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA256 = cryptoJScontext.objectForKeyedSubscript("SHA256")
                }else{
                    println("Unable to load sha256.js")
                }
                
            }else{
                println("Unable to find sha256.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA256.callWithArguments([string]))"
        }
        
    }
    
    public class SHA3: CryptoJS{
        
        private var SHA3: JSValue!
        
        override init(){
            
            // Retrieve the content of sha3.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha3", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                
                if(( cryptoJS ) != nil){
                    println("Loaded sha3.js")
                    
                    // Create JS context
                    let cryptoJScontext = JSContext()
                    // Evaluate sha3.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA3 = cryptoJScontext.objectForKeyedSubscript("SHA3")
                }else{
                    println("Unable to load sha3.js")
                }
                
            }
            
        }
        
        public func hash(string: String,outputLength: Int?=nil)->String {
            if let unwrappedOutputLength = outputLength {
                return "\(self.SHA3.callWithArguments([string,unwrappedOutputLength]))"
            } else {
                return "\(self.SHA3.callWithArguments([string]))"
            }
        }
        
    }
    
}