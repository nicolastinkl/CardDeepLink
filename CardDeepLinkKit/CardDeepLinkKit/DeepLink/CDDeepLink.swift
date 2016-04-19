//
//  CDDeepLink.swift
//
// Copyright (c) 2016 AsiaInfo
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

// MARK: -
// MARK: public access
// MARK: -

/// The DeepLink of application object.

public class CDDeepLink : NSObject {
    
    // MARK: -> public properties
    
    /**
    The serialized URL representation of the deep link.
    */
    public var URL: NSURL?
    
    /**
     The query parameters parsed from the incoming URL.
     @note If the URL conforms to the App Link standard, this will be the query parameters found on `target_url'.
     */
    public var queryParameters: NSDictionary?
    
    /**
     A dictionary of values keyed by their parameterized route component matched in the deep link URL path.
     @note Given a route `alert/:title/:message' and a path `xxxx://alert/hello/world',
     the route parameters dictionary would be `@{ @"title": @"hello", @"message": @"world" }'.
     */
    public var routeParameters: NSDictionary?
    

    // MARK: -> public properties with AppLinks.
    
    public var targetURL: NSURL?
    
    public var extras: NSDictionary?
    
    public var version: String?
    
    public var userAgent: String?
    
    public var appLinkData: NSDictionary?
    
    public var referrerTargetURL: NSURL?
    
    public var referrerURL: NSURL?
    
    public var referrerAppName: String?
    
    /**
    A deep link URL for linking back to the source application.
    */
    public var callbackURL: NSURL? {
        get{
            var url:String? = ""
            if let queryParameters = queryParameters {
                url = queryParameters[CDApplication.Config.CDCallbackURLKey] as? String
            }
            
            if let appLinkData = appLinkData {
                url = appLinkData[CDApplication.AppLinks.CDAppLinksReferrerURLKey] as? String
            }
            
            return NSURL(string: url!)!
        }
    }
    
    
    // MARK: -> public subscript
    
    /**
    Parameter Retrieval via Object Subscripting
    
    - returns: object
    */
    subscript(key : String) -> AnyObject? {
        get{
            if let routeParameters = routeParameters {
                return routeParameters[key]
            }
            return nil
        }
    }
    
    // MARK: -> public  init
    
    public init(url: NSURL) {
        
        URL = url
        queryParameters = URL?.query?.cd_parametersFromQueryString()
        
    }
    
    public func hashValue() -> Int{
        return self.URL?.hash ?? 0
    }
    
    
}