//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Andy Phan on 10/10/16.
//  Copyright © 2016 BC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate
{
    var mapView: MKMapView!
    
    override func loadView()
    {
        //Create a map view
        mapView = MKMapView()
        
        //set it as "the" view of this view controller
        view = mapView
        
        
        //let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        //segmentedControl.addTarget(self, action: "mapTypeChanged:", for: .valueChanged)
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //anchor the segmentControl
        //let topContraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        //let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        //let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        let topContraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

        topContraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    
    func mapTypeChanged(segControl: UISegmentedControl)
    {
        switch segControl.selectedSegmentIndex
        {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", country: "Britain", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
        
        let paris = Capital(title: "Paris", country: "France", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508))
        
        let hanoi = Capital(title: "Hanoi", country: "Vietnam", coordinate: CLLocationCoordinate2D(latitude: 21.05, longitude: 105.55))
        
        let rome = Capital(title: "Rome", country: "Italy", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5))
        
        let washington = Capital(title: "Washington DC", country: "USA", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
        
        let athens = Capital(title: "Athens", country: "Greece", coordinate: CLLocationCoordinate2D(latitude: 37.58, longitude: 23.46))
        
        
        mapView.addAnnotation(london)
        mapView.addAnnotation(hanoi)
        mapView.addAnnotation(paris)
        mapView.addAnnotation(rome)
        mapView.addAnnotation(washington)
        mapView.addAnnotation(athens)
        
        print("MapViewController loaded its view.")
    
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "annotationPress")
        {
            let vc = segue.destination as! quizViewController
            
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAcessoryControlTapped control: UIControl) {
        
    
        
        
    }
}
