//
//  CryptoJS.swift
//
//  Created by Emartin on 2015-08-25.
//  Copyright (c) 2015 Emartin. All rights reserved.
//

import Foundation
import JavaScriptCore

private var cryptoJScontext = JSContext()

public class CryptoJS{
    
    public class AES: CryptoJS{
    
        private var encryptFunction: JSValue!
        private var decryptFunction: JSValue!
     
        override init(){
            super.init()
            
            // Retrieve the content of aes.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("aes", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                //let cryptoJS = String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding, error: nil)
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding: NSUTF8StringEncoding)
                    print("Loaded aes.js")
                        
                    // Evaluate aes.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    encryptFunction = cryptoJScontext.objectForKeyedSubscript("encrypt")
                    decryptFunction = cryptoJScontext.objectForKeyedSubscript("decrypt")
                }
                catch {
                    print("Unable to load aes.js")
                }
            }else{
                print("Unable to find aes.js")
            }
            
        }
        
        public func encrypt(secretMessage: String,secretKey: String,options: AnyObject?=nil)->String {
            if let unwrappedOptions: AnyObject = options {
                return "\(encryptFunction.callWithArguments([secretMessage, secretKey, unwrappedOptions]))"
            }else{
                return "\(encryptFunction.callWithArguments([secretMessage, secretKey]))"
            }
        }
        public func decrypt(encryptedMessage: String,secretKey: String,options: AnyObject?=nil)->String {
            if let unwrappedOptions: AnyObject = options {
                return "\(decryptFunction.callWithArguments([encryptedMessage, secretKey, unwrappedOptions]))"
            }else{
                return "\(decryptFunction.callWithArguments([encryptedMessage, secretKey]))"
            }
        }
        
    }
    
    public class MD5: CryptoJS{
        
        private var MD5: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of md5.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("md5", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded md5.js")
                        
                    // Evaluate md5.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.MD5 = cryptoJScontext.objectForKeyedSubscript("MD5")
                }
                catch {
                    print("Unable to load md5.js")
                }
                
            }else{
                print("Unable to find md5.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.MD5.callWithArguments([string]))"
        }
        
    }
    
    public class SHA1: CryptoJS{
        
        private var SHA1: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha1.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha1", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha1.js")
                        
                    // Evaluate sha1.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA1 = cryptoJScontext.objectForKeyedSubscript("SHA1")
                }
                catch {
                    print("Unable to load sha1.js")
                }
                
            }else{
                print("Unable to find sha1.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA1.callWithArguments([string]))"
        }
        
    }
    
    public class SHA224: CryptoJS{
        
        private var SHA224: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha224.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha224", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha224.js")
                        
                    // Evaluate sha224.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA224 = cryptoJScontext.objectForKeyedSubscript("SHA224")
                }
                catch {
                    print("Unable to load sha224.js")
                }
                
            }else{
                print("Unable to find sha224.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA224.callWithArguments([string]))"
        }
        
    }
    
    public class SHA256: CryptoJS{
        
        private var SHA256: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha256.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha256", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha256.js")
                        
                    // Evaluate sha256.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA256 = cryptoJScontext.objectForKeyedSubscript("SHA256")
                }
                catch {
                    print("Unable to load sha256.js")
                }
                
            }else{
                print("Unable to find sha256.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA256.callWithArguments([string]))"
        }
        
    }
    
    public class SHA384: CryptoJS{
        
        private var SHA384: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha384.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha384", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
    
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha384.js")
                        
                    // Evaluate sha384.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA384 = cryptoJScontext.objectForKeyedSubscript("SHA384")
                }
                catch {
                    print("Unable to load sha384.js")
                }
                
            }else{
                print("Unable to find sha384.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA384.callWithArguments([string]))"
        }
        
    }
    
    public class SHA512: CryptoJS{
        
        private var SHA512: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha512.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha512", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha512.js")
                        
                    // Evaluate sha512.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA512 = cryptoJScontext.objectForKeyedSubscript("SHA512")
                }
                catch {
                    print("Unable to load sha512.js")
                }
                
            }else{
                print("Unable to find sha512.js")
            }
            
        }
        
        public func hash(string: String)->String {
            return "\(self.SHA512.callWithArguments([string]))"
        }
        
    }
    
    public class SHA3: CryptoJS{
        
        private var SHA3: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha3.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("sha3", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
            
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded sha3.js")
                        
                    // Evaluate sha3.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.SHA3 = cryptoJScontext.objectForKeyedSubscript("SHA3")
                }
                catch {
                    print("Unable to load sha3.js")
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
    
    public class RIPEMD160: CryptoJS{
        
        private var RIPEMD160: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of ripemd160.js
            let cryptoJSpath = NSBundle.mainBundle().pathForResource("ripemd160", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                    
                    print("Loaded ripemd160.js")
                        
                    // Evaluate ripemd160.js
                    cryptoJScontext.evaluateScript(cryptoJS)
                        
                    // Reference functions
                    self.RIPEMD160 = cryptoJScontext.objectForKeyedSubscript("RIPEMD160")
                }
                catch {
                    print("Unable to load ripemd160.js")
                }
                
            }
            
        }
        
        public func hash(string: String,outputLength: Int?=nil)->String {
            if let unwrappedOutputLength = outputLength {
                return "\(self.RIPEMD160.callWithArguments([string,unwrappedOutputLength]))"
            } else {
                return "\(self.RIPEMD160.callWithArguments([string]))"
            }
        }
        
    }
    
    public class mode: CryptoJS{
        
        var CFB:String = "CFB"
        var CTR:String = "CTR"
        var OFB:String = "OFB"
        var ECB:String = "ECB"
        
        public class CFB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("mode-\(CryptoJS.mode().CFB.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded mode-\(CryptoJS.mode().CFB).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().CFB).js")
                    }
                }
            }
        }
        public class CTR: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("mode-\(CryptoJS.mode().CTR.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded mode-\(CryptoJS.mode().CTR).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().CTR).js")
                    }
                }
            }
        }
        
        public class OFB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("mode-\(CryptoJS.mode().OFB.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded mode-\(CryptoJS.mode().OFB).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().OFB).js")
                    }
                }
            }
        }
        
        public class ECB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("mode-\(CryptoJS.mode().ECB.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded mode-\(CryptoJS.mode().ECB).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().ECB).js")
                    }
                }
            }
        }
    }
    
    public class pad: CryptoJS{
        
        var AnsiX923:String = "AnsiX923"
        var Iso97971:String = "Iso97971"
        var Iso10126:String = "Iso10126"
        var ZeroPadding:String = "ZeroPadding"
        var NoPadding:String = "NoPadding"
        
        public class AnsiX923: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("pad-\(CryptoJS.pad().AnsiX923.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded pad-\(CryptoJS.pad().AnsiX923).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().AnsiX923).js")
                    }
                }
            }
        }
        
        public class Iso97971: CryptoJS{
            override init(){
                super.init()
                
                // Load dependencies
                _ = CryptoJS.pad.ZeroPadding()
                
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("pad-\(CryptoJS.pad().Iso97971.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded pad-\(CryptoJS.pad().Iso97971).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().Iso97971).js")
                    }
                }
            }
        }
        
        public class Iso10126: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("pad-\(CryptoJS.pad().Iso10126.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded pad-\(CryptoJS.pad().Iso10126).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().Iso10126).js")
                    }
                }
            }
        }
        
        public class ZeroPadding: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("pad-\(CryptoJS.pad().ZeroPadding.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded pad-\(CryptoJS.pad().ZeroPadding).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().ZeroPadding).js")
                    }
                }
            }
        }
        
        public class NoPadding: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = NSBundle.mainBundle().pathForResource("pad-\(CryptoJS.pad().NoPadding.lowercaseString)", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:NSUTF8StringEncoding)
                        print("Loaded pad-\(CryptoJS.pad().NoPadding).js")
                        // Evaluate script
                        cryptoJScontext.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().NoPadding).js")
                    }
                }
            }
        }
    }
    
}