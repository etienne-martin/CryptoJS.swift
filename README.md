# CryptoJS.swift
Cross-platform cryptographic functions in swift using the [Crypto JS library](https://github.com/brix/crypto-js). Allows you to share the same crypto between a native iOS/OSX application and a web application.

Compatible with https://github.com/brix/crypto-js.

### Platforms Supported

iOS  
macOS  
Web browsers  
openSSL  

### Installation

Drag and drop [CryptoJS.swift](https://raw.githubusercontent.com/etienne-martin/CryptoJS.swift/master/Crypto%20JS/CryptoJS.swift) and the [javascript files](https://github.com/etienne-martin/CryptoJS.swift/tree/master/Crypto%20JS/components) in your Xcode project.

## AES

Supported modes: CBC (the default), CFB, CTR, OFB, ECB  
Supported padding schemes: Pkcs7 (the default), Iso97971, AnsiX923, Iso10126, ZeroPadding, NoPadding

```swift
// Load the AES module
let AES = CryptoJS.AES()

// Basic AES encryption
let encrypted = AES.encrypt("secretMessage", password: "password123")

// AES encryption with custom mode and padding
CryptoJS.mode.ECB() // Load custom mode
CryptoJS.pad.Iso97971() // Load custom padding scheme
let encrypted = AES.encrypt("secretMessage", password: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])

// Basic AES decryption
let decrypted = AES.decrypt(encrypted, password: "password123")

// AES decryption with custom mode and padding
let decrypted = AES.decrypt(encrypted, password: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])
```
##### Compatible with OpenSSL

```bash
# Basic openSSL AES encryption
openssl enc -aes-256-cbc -e -in /foo/thePlainTextFile.txt -out /bar/theEncryptedFile.txt -pass pass:"password123" -base64

# Basic openSSL AES decryption
openssl enc -aes-256-cbc -d -in /foo/theEncryptedFile.txt -out /bar/theDecryptedFile.txt -pass pass:"password123" -base64
```

## TripleDES

```swift
// Load the TripleDES module
let TripleDES = CryptoJS.TripleDES()

// Basic TripleDES encryption
let encrypted = TripleDES.encrypt("secretMessage", secretKey: "password123")

// Basic TripleDES decryption
let decrypted = TripleDES.decrypt(encrypted, secretKey: "password123")
```

## DES

```swift
// Load the DES module
let DES = CryptoJS.DES()

// Basic DES encryption
let encrypted = DES.encrypt("secretMessage", secretKey: "password123")

// Basic DES decryption
let decrypted = DES.decrypt(encrypted, secretKey: "password123")
```

## Hashers

```swift
let MD5 = CryptoJS.MD5()
let SHA1 = CryptoJS.SHA1()
let SHA224 = CryptoJS.SHA224()
let SHA256 = CryptoJS.SHA256()
let SHA384 = CryptoJS.SHA384()
let SHA512 = CryptoJS.SHA512()
let SHA3 = CryptoJS.SHA3()
let RIPEMD160 = CryptoJS.RIPEMD160()

var hash = MD5.hash("mystring")
var hash = SHA1.hash("mystring")
var hash = SHA224.hash("mystring")
var hash = SHA256.hash("mystring")
var hash = SHA384.hash("mystring")
var hash = SHA3.hash("mystring")
var hash = SHA512.hash("mystring")
var hash = SHA3.hash("mystring",outputLength: 256)
var hash = RIPEMD160.hash("mystring")
```

## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Update the README.md with details of changes to the plugin.

Update the [examples](https://github.com/etienne-martin/CryptoJS.swift/blob/master/Crypto%20JS/ViewController.swift) by demonstrating the changes to the plugin.

Build the project & test all the features before submitting your pull request.

## Authors

* **Etienne Martin** - *Initial work* - [etiennemartin.ca](http://etiennemartin.ca/)
* **Mladen Kajic** - *Improvements* - [mladen.kajic2@mail.dcu.ie](mailto:mladen.kajic2@mail.dcu.ie)

## License

This project is licensed under the MIT License - see the [LICENSE.txt](https://github.com/etienne-martin/CryptoJS.swift/blob/master/LICENSE.txt) file for details.
