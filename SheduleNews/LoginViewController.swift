//
//  LoginViewController.swift
//  SheduleNews
//
//  Created by Антон Вовк on 13.03.2018.
//  Copyright © 2018 Anton Vovk. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
//        let username = "slavanb777"
//        let password = "slavik123"
//        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        let headers = ["Authorization": "Token - \(base64Credentials)"]
//        print(headers)

        

       // self.doAuth(username: username, password: password)
    }
    
    var username: String = ""
    var password: String = ""
    
   
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        username = loginTextField.text!
        password = passwordTextField.text!
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: username, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request("https://marks.prosperitas.sumy.ua/frontend/web/index.php?r=rest/get-token", headers: headers)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func doAuth(username:String, password:String) {
//
//         let params = ["user": username, "password": password]
//        let authToken = Alamofire.request(self.authLoginUrl, method: .post, parameters: params)
//        authToken.responseJSON { response in
//            let statusCode = response.response?.statusCode ?? 0
//
//            switch statusCode {
//            case 200...299:
//                let jsonData = JSON(response.result.value!)
//                print(jsonData)
////                if let token = jsonData["key"].string{
////                    self.keychain["token"] = token
////                    self.getProjects()
//
//            case 400...499:
//                print("Server responded no")
//
//            case 500...599:
//                print("Server error")
//
//            default:
//                print("There was an error with your request")
//            }
//
//        }
//    }
//


    
    
    
}
