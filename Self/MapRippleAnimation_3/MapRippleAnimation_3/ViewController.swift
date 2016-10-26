//
//  ViewController.swift
//  MapRippleAnimation_3
//
//  Created by jansti on 16/10/26.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit
import MapKit


class SubView: UIView {
    
    var name: String
    
    init(name: String){
        self.name = name
        super.init(frame: CGRectMake(0, 0, 0, 0))
    }
    
    // 这里required init?(coder aDecoder: NSCoder)之所以是required的,是因为,uiview实现了nscode协议.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController, MKMapViewDelegate {

    // MARK: - Types
    
    struct Constants {
        struct MapViewIdentifiers {
            static let sonarAnnotationView = "sonarAnnotationView"
        }
    }
    
    
    // MARK: - Properties
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 3000
    let latitude = 40.758873
    let longitude = -73.985134
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        let subView = SubView.init(name: "name")
//      这里,没有实现init(frame)没有报错,那么为什么大头针报错了.
        
        mapView.delegate = self
        let initalLocation = CLLocation.init(latitude: latitude, longitude: longitude)
        enterMapOnLocation(initalLocation)
        
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: nil, subtitle: nil)
        mapView.addAnnotation(annotation)
    }
    
    // MARK: - Status Bar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is Annotation else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(Constants.MapViewIdentifiers.sonarAnnotationView)
        
        if annotationView == nil {
            annotationView = SonarAnnotationView.init(annotation: annotation, reuseIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
        }else{
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    
    // MARK: - privateFunc
    
    private func enterMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

   
}

