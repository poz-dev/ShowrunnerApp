//
//  Show.swift
//  ShowrunnerApp
//
//  Created by Kresimir Ivanjko on 22.04.2023..
//

import Foundation

struct Show: Codable {
    var name: String
    var language: String?
    var summary: String?
    var genres: [String]?
    var rating: Rating?
    var network: Network?
    var image: Image?
}

struct Rating: Codable {
    var average: Double?
}

struct Network: Codable {
    var name: String
}

struct Image: Codable {
    var original: String?
}
