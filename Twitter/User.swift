//
//  User.swift
//  Twitter
//
//  Created by Mary Martinez on 10/29/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: String?
    var screenname: String?
    var profileURL: URL?
    var tagline: String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        let profileURLString = dictionary["profile_image_url_https"] as? String
        if let profileURLString = profileURLString {
            profileURL = URL(string: profileURLString)
        }
        
        tagline = dictionary["description"] as? String
    }
}
