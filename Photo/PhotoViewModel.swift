//
//  PhotoViewModel.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import Foundation



struct PhotoViewModel: Decodable {
    let likes: Int
    let urls: [URLKind.RawValue: String]
//     let location: [PhotoName]
//    let description: String
}

//struct PhotoName: Decodable {
//    let name: String
//}
 
enum URLKind: String {
    case raw
    case full
    case regular
    case small
    case thumb
    
}
 
