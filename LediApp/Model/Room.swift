//
//  Room.swift
//  Room
//
//  Created by Juan Diego Ocampo on 8/26/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Room: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var location: String
    var city: String
    var dailyUsage: Array<Float>
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var glyphName: String
    var icon: Image {
        Image(glyphName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
