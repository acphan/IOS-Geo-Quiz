//
//  Capital.swift
//  WorldTrotter
//
//  Created by Andy Phan on 12/18/16.
//  Copyright © 2016 BC. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var country: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title: String, country: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.country = country
        self.coordinate = coordinate
        }
}
