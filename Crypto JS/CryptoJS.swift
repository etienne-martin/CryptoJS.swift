//
//  CryptoJS.swift
//
//  Created by Emartin on 2015-08-25.
//  Copyright (c) 2015 Emartin. All rights reserved.
//

import Foundation
import JavaScriptCore

private var cryptoJScontext = JSContext()

open class CryptoJS{
    
    open class AES: CryptoJS{
        
        fileprivate var encryptFunction: JSValue!
        fileprivate var decryptFunction: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of aes.js
            let cryptoJSpath = Bundle.main.path(forResource: "aes", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding: String.Encoding.utf8)
                    print("Loaded aes.js")
                    
                    // Evaluate aes.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    encryptFunction = cryptoJScontext?.objectForKeyedSubscript("encrypt")
                    decryptFunction = cryptoJScontext?.objectForKeyedSubscript("decrypt")
                }
                catch {
                    print("Unable to load aes.js")
                }
            }else{
                print("Unable to find aes.js")
            }
            
        }
        
        open func encrypt(_ message: String, password: String,options: Any?=nil)->String {
            if let unwrappedOptions: Any = options {
                return "\(encryptFunction.call(withArguments: [message, password, unwrappedOptions])!)"
            }else{
                return "\(encryptFunction.call(withArguments: [message, password])!)"
            }
        }
        open func decrypt(_ message: String, password: String,options: Any?=nil)->String {
            if let unwrappedOptions: Any = options {
                return "\(decryptFunction.call(withArguments: [message, password, unwrappedOptions])!)"
            }else{
                return "\(decryptFunction.call(withArguments: [message, password])!)"
            }
        }
        
    }
    
    open class TripleDES: CryptoJS{
        
        fileprivate var encryptFunction: JSValue!
        fileprivate var decryptFunction: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of tripledes.js
            let cryptoJSpath = Bundle.main.path(forResource: "tripledes", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding: String.Encoding.utf8)
                    print("Loaded tripledes.js")
                    
                    // Evaluate tripledes.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    encryptFunction = cryptoJScontext?.objectForKeyedSubscript("encryptTripleDES")
                    decryptFunction = cryptoJScontext?.objectForKeyedSubscript("decryptTripleDES")
                }
                catch {
                    print("Unable to load tripledes.js")
                }
            }else{
                print("Unable to find tripledes.js")
            }
            
        }
        
        open func encrypt(_ message: String, password: String)->String {
            return "\(encryptFunction.call(withArguments: [message, password])!)"
        }
        open func decrypt(_ message: String, password: String)->String {
            return "\(decryptFunction.call(withArguments: [message, password])!)"
        }
        
    }
    
    open class DES: CryptoJS{
        
        fileprivate var encryptFunction: JSValue!
        fileprivate var decryptFunction: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of tripledes.js
            let cryptoJSpath = Bundle.main.path(forResource: "tripledes", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding: String.Encoding.utf8)
                    print("Loaded tripledes.js (DES)")
                    
                    // Evaluate tripledes.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    encryptFunction = cryptoJScontext?.objectForKeyedSubscript("encryptDES")
                    decryptFunction = cryptoJScontext?.objectForKeyedSubscript("decryptDES")
                }
                catch {
                    print("Unable to load tripledes.js (DES)")
                }
            }else{
                print("Unable to find tripledes.js (DES)")
            }
            
        }
        
        open func encrypt(_ message: String, password: String)->String {
            return "\(encryptFunction.call(withArguments: [message, password])!)"
        }
        open func decrypt(_ message: String, password: String)->String {
            return "\(decryptFunction.call(withArguments: [message, password])!)"
        }
        
    }
    
    open class MD5: CryptoJS{
        
        fileprivate var MD5: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of md5.js
            let cryptoJSpath = Bundle.main.path(forResource: "md5", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded md5.js")
                    
                    // Evaluate md5.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.MD5 = cryptoJScontext?.objectForKeyedSubscript("MD5")
                }
                catch {
                    print("Unable to load md5.js")
                }
                
            }else{
                print("Unable to find md5.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.MD5.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA1: CryptoJS{
        
        fileprivate var SHA1: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha1.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha1", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha1.js")
                    
                    // Evaluate sha1.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA1 = cryptoJScontext?.objectForKeyedSubscript("SHA1")
                }
                catch {
                    print("Unable to load sha1.js")
                }
                
            }else{
                print("Unable to find sha1.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.SHA1.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA224: CryptoJS{
        
        fileprivate var SHA224: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha224.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha224", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha224.js")
                    
                    // Evaluate sha224.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA224 = cryptoJScontext?.objectForKeyedSubscript("SHA224")
                }
                catch {
                    print("Unable to load sha224.js")
                }
                
            }else{
                print("Unable to find sha224.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.SHA224.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA256: CryptoJS{
        
        fileprivate var SHA256: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha256.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha256", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha256.js")
                    
                    // Evaluate sha256.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA256 = cryptoJScontext?.objectForKeyedSubscript("SHA256")
                }
                catch {
                    print("Unable to load sha256.js")
                }
                
            }else{
                print("Unable to find sha256.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.SHA256.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA384: CryptoJS{
        
        fileprivate var SHA384: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha384.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha384", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha384.js")
                    
                    // Evaluate sha384.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA384 = cryptoJScontext?.objectForKeyedSubscript("SHA384")
                }
                catch {
                    print("Unable to load sha384.js")
                }
                
            }else{
                print("Unable to find sha384.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.SHA384.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA512: CryptoJS{
        
        fileprivate var SHA512: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha512.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha512", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha512.js")
                    
                    // Evaluate sha512.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA512 = cryptoJScontext?.objectForKeyedSubscript("SHA512")
                }
                catch {
                    print("Unable to load sha512.js")
                }
                
            }else{
                print("Unable to find sha512.js")
            }
            
        }
        
        open func hash(_ string: String)->String {
            return "\(self.SHA512.call(withArguments: [string])!)"
        }
        
    }
    
    open class SHA3: CryptoJS{
        
        fileprivate var SHA3: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of sha3.js
            let cryptoJSpath = Bundle.main.path(forResource: "sha3", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded sha3.js")
                    
                    // Evaluate sha3.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.SHA3 = cryptoJScontext?.objectForKeyedSubscript("SHA3")
                }
                catch {
                    print("Unable to load sha3.js")
                }
            }
            
        }
        
        open func hash(_ string: String,outputLength: Int?=nil)->String {
            if let unwrappedOutputLength = outputLength {
                return "\(self.SHA3.call(withArguments: [string,unwrappedOutputLength])!)"
            } else {
                return "\(self.SHA3.call(withArguments: [string])!)"
            }
        }
        
    }
    
    open class RIPEMD160: CryptoJS{
        
        fileprivate var RIPEMD160: JSValue!
        
        override init(){
            super.init()
            
            // Retrieve the content of ripemd160.js
            let cryptoJSpath = Bundle.main.path(forResource: "ripemd160", ofType: "js")
            
            if(( cryptoJSpath ) != nil){
                
                do {
                    let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                    
                    print("Loaded ripemd160.js")
                    
                    // Evaluate ripemd160.js
                    _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    
                    // Reference functions
                    self.RIPEMD160 = cryptoJScontext?.objectForKeyedSubscript("RIPEMD160")
                }
                catch {
                    print("Unable to load ripemd160.js")
                }
                
            }
            
        }
        
        open func hash(_ string: String,outputLength: Int?=nil)->String {
            if let unwrappedOutputLength = outputLength {
                return "\(self.RIPEMD160.call(withArguments: [string,unwrappedOutputLength])!)"
            } else {
                return "\(self.RIPEMD160.call(withArguments: [string])!)"
            }
        }
        
    }
    
    open class mode: CryptoJS{
        
        var CFB:String = "CFB"
        var CTR:String = "CTR"
        var OFB:String = "OFB"
        var ECB:String = "ECB"
        
        open class CFB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "mode-\(CryptoJS.mode().CFB.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded mode-\(CryptoJS.mode().CFB).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().CFB).js")
                    }
                }
            }
        }
        open class CTR: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "mode-\(CryptoJS.mode().CTR.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded mode-\(CryptoJS.mode().CTR).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().CTR).js")
                    }
                }
            }
        }
        
        open class OFB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "mode-\(CryptoJS.mode().OFB.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded mode-\(CryptoJS.mode().OFB).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().OFB).js")
                    }
                }
            }
        }
        
        open class ECB: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "mode-\(CryptoJS.mode().ECB.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded mode-\(CryptoJS.mode().ECB).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load mode-\(CryptoJS.mode().ECB).js")
                    }
                }
            }
        }
    }
    
    open class pad: CryptoJS{
        
        var AnsiX923:String = "AnsiX923"
        var Iso97971:String = "Iso97971"
        var Iso10126:String = "Iso10126"
        var ZeroPadding:String = "ZeroPadding"
        var NoPadding:String = "NoPadding"
        
        open class AnsiX923: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "pad-\(CryptoJS.pad().AnsiX923.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded pad-\(CryptoJS.pad().AnsiX923).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().AnsiX923).js")
                    }
                }
            }
        }
        
        open class Iso97971: CryptoJS{
            override init(){
                super.init()
                
                // Load dependencies
                _ = CryptoJS.pad.ZeroPadding()
                
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "pad-\(CryptoJS.pad().Iso97971.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded pad-\(CryptoJS.pad().Iso97971).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().Iso97971).js")
                    }
                }
            }
        }
        
        open class Iso10126: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "pad-\(CryptoJS.pad().Iso10126.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded pad-\(CryptoJS.pad().Iso10126).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().Iso10126).js")
                    }
                }
            }
        }
        
        open class ZeroPadding: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "pad-\(CryptoJS.pad().ZeroPadding.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded pad-\(CryptoJS.pad().ZeroPadding).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().ZeroPadding).js")
                    }
                }
            }
        }
        
        open class NoPadding: CryptoJS{
            override init(){
                super.init()
                // Retrieve the content of the script
                let cryptoJSpath = Bundle.main.path(forResource: "pad-\(CryptoJS.pad().NoPadding.lowercased())", ofType: "js")
                
                if(( cryptoJSpath ) != nil){
                    do {
                        let cryptoJS = try String(contentsOfFile: cryptoJSpath!, encoding:String.Encoding.utf8)
                        print("Loaded pad-\(CryptoJS.pad().NoPadding).js")
                        // Evaluate script
                        _ = cryptoJScontext?.evaluateScript(cryptoJS)
                    }
                    catch {
                        print("Unable to load pad-\(CryptoJS.pad().NoPadding).js")
                    }
                }
            }
        }
    }
    
}
