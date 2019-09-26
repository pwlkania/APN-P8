import UIKit

/// NOTE : The following data is just an example, you must provide it

let PAYLOAD = """
{"aps":{"content-available" : 1, "data":"Some Data"}}
"""
let DEVICE_TOKEN = "933e3112d1eae4a1d8eb48617a265b303be28b300193b9677f0ccf52a63a5b1e"
let KEY_ID = "66HAR8S7J6"
let TEAM_ID = "UDRT3OY4H3"
let BUNDLE_ID = "com.myapp"
let P8 = """
-----BEGIN PRIVATE KEY-----
MIIJKAIBAAKCAgEApuQkFrZ46cPwueCW+Vfev44sgeguXH7jCoZ7yLO05FUSAv4k
JI60dvnS1zGxBLwVcSozR4tBBgihpGwk1yoQ82pGQcZLR/rm+h1UAjfXAl3gmEZF
4BK8GJ1i755k7Gre0jYFsq42NxGzQf2rQyevsv3AYaVP2DFzvvRiPl+g2K2iKR2O
7j7665Di
-----END PRIVATE KEY-----
"""

/// NOTE: You should not modify code below

let jwt = JWT(keyID: KEY_ID, teamID: TEAM_ID, issueDate: Date(), expireDuration: 60 * 60)
let token = try jwt.sign(with: P8)
var request = URLRequest(url: URL(string: "https://api.sandbox.push.apple.com:443/3/device/" + DEVICE_TOKEN)!)
request.httpMethod = "POST"
request.addValue("bearer \(token)", forHTTPHeaderField: "authorization")
request.addValue(BUNDLE_ID, forHTTPHeaderField: "apns-topic")
request.httpBody = PAYLOAD.data(using: .utf8)

URLSession.shared.dataTask(with: request) { (data, response, error) in
    guard error == nil else {
        print(error!.localizedDescription)
        return
    }
    guard let data = data else {
        print("Empty data")
        return
    }
    if let str = String(data: data, encoding: .utf8) {
        print(str)
    }
}.resume()
