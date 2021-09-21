//
//  Items.swift
//  SmartkargoTask
//
//  Created by Arjun  on 24/02/21.
//



import Foundation

struct Items : Codable {
        let items : [Item]?
        enum CodingKeys: String, CodingKey {
                case items = "items"
        }
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                items = try values.decodeIfPresent([Item].self, forKey: .items)
        }
}

struct Item : Codable {
        let image : String?
        let name : String?
        let releaseDate : String?
        enum CodingKeys: String, CodingKey {
                case image = "image"
                case name = "name"
                case releaseDate = "release_date"
        }
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                image = try values.decodeIfPresent(String.self, forKey: .image)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        }

}
