//
//  User.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

struct User: Codable, Identifiable {
    var id: Int?
    var email: String
    var username: String
    var password: String
    var name: Name
    var address: Address
    var phone: String
}

struct Name: Codable {
    var firstname: String
    var lastname: String
}

struct Address: Codable {
    var city: String
    var street: String
    var number: Int
    var zipcode: String
    var geolocation: GeoLocation
}

struct GeoLocation: Codable {
    var lat: String
    var long: String
}

