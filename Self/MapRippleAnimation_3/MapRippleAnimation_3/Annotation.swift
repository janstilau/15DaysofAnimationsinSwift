//
//  Annotation.swift
//  MapRippleAnimation_3
//
//  Created by jansti on 16/10/26.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit
import MapKit


class Annotation: NSObject, MKAnnotation{
    
    // MARK: - Properties
    
    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    // MARK: - Initializers
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}
