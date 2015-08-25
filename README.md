# Swift-Crypto-JS
Cross device cryptography written in swift using the [Crypto JS library](https://code.google.com/p/crypto-js/).

Allows you to share the same crypto between a native iOS/OSX application and a web application.

#### AES

```swift
let AES = CryptoJS.AES()
var encrypted = AES.encrypt("secretMessage", secretKey: "password123")
var decrypted = AES.decrypt(encrypted, secretKey: "password123")
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
