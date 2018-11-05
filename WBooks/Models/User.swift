//
//  User.swift
//  WBooks
//
//  Created by Argentino Ducret on 05/08/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let imageURL: URL?

    init(id: Int, firstName: String, lastName: String, imageURL: String?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.imageURL = imageURL.map { URL (string: $0)! }
    }
}

extension User: Argo.Decodable {

    static func decode(_ json: JSON) -> Decoded<User> {
        return curry(User.init)
            <^> json <| "id"
            <*> json <| "first_name"
            <*> json <| "last_name"
            <*> json <|? "image_url"
    }

}
