//
//  NetworkRequest.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/27.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

//创建一个请求类的单利
private let NetworkRequestShareInstance = NetworkRequest()

class NetworkRequest: NSObject {
    class var sharedInstance : NetworkRequest {
         return NetworkRequestShareInstance
    }
}

extension NetworkRequest {
    //MARK：--GET 请求
    //let tools ： NetworkRequest.shareInstance
    func getRequest(urlString: String, params : [String : Any], success: @escaping (_ response : [String : AnyObject]) -> (), failture : @escaping (_ error: Error) -> ()) {
        
        Alamofire.request(urlString, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                success(value as! [String : AnyObject])
                let json = JSON(value)
//                print(json)
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
        }
    }
    //post请求
    func postRequest(urlString: String, params : [String : Any], success: @escaping (_ response : [String : AnyObject]) -> (), failture : @escaping (_ error: Error) -> ()) {
        Alamofire.request(urlString, method: .post, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let value = response.result.value as? [String : AnyObject]{
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
        }
    }
}
