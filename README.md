# Swift-CryptoJS
Cross device cryptography in swift using the [Crypto JS library](https://code.google.com/p/crypto-js/).

Allows you to share the same crypto between a native iOS/OSX application and a web application.

#### AES encryption

```swift
// Basic usage
let AES = CryptoJS.AES()
var encrypted = AES.encrypt("secretMessage", secretKey: "password123")

// Custom IV
var encrypted2 = AES.encrypt("secretMessage", secretKey: "password123", options:["iv":123])

// Encrypt AES with custom mode and padding
let ECB = CryptoJS.mode.ECB()
let Iso97971 = CryptoJS.pad.Iso97971()
var encrypted3 = AES.encrypt("secretMessage", secretKey: "password123", options:[ "mode": CryptoJS.mode().ECB, "padding": CryptoJS.pad().Iso97971 ])

// Supported modes: CBC (the default), CFB, CTR, OFB, ECB
// Supported padding shemes: Pkcs7 (the default), Iso97971, AnsiX923, Iso10126, ZeroPadding, NoPadding
```

#### Hashers

```swift
let MD5 = CryptoJS.MD5()
var hash = MD5.hash("mystring")

let SHA1 = CryptoJS.SHA1()
var hash = SHA1.hash("mystring")

let SHA256 = CryptoJS.SHA256()
var hash = SHA256.hash("mystring")

let SHA3 = CryptoJS.SHA3()
var hash = SHA3.hash("mystring")
var hash = SHA3.hash("mystring", outputLength: 256)
```

######Feel free to contribute!
