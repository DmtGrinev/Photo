//
//  PhotoViewModel.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import Foundation

struct PhotoViewModel: Decodable {
    let photos: [CurrentPhoto]
}

struct CurrentPhoto: Decodable {
    let description: String?
    let width: Int
    let location: PhotoName?
    let urls: [URLKind.RawValue: String]
}

struct PhotoName: Decodable {
    let name: String?
}
 
enum URLKind: String {
    case raw
    case full
    case regular
    case small
    case thumb
}
 
