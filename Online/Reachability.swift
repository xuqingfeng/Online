//
//  Reachability.swift
//  Online
//
//  Created by jsxqf on 15/5/24.
//  Copyright (c) 2015年 jsxqf. All rights reserved.
//

import Foundation

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
    
        var status:Bool = false
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10
        
        var response: NSURLResponse?
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
        
        if let httpResponse = response as? NSHTTPURLResponse {
            if httpResponse.statusCode == 200 {
                status = true
            }
        }
    
        return status
    }
}