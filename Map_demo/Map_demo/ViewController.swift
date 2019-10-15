//
//  ViewController.swift
//  Map_demo
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    var mapView:GMSMapView?
    
    var currentDestination:VacationDestination?
    
    let destinations = [VacationDestination(name: "Sydney", location: CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20), zoom: 15),
                     VacationDestination(name: "Ferruy Buildind", location: CLLocationCoordinate2D(latitude: 37.792871, longitude: -122.393451), zoom:10),
                      VacationDestination(name: "Ferruy Buildind", location: CLLocationCoordinate2D(latitude: 37.792871, longitude: -122.393451), zoom:10)
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCyHUL3b-4GQqWK72GLD1_TI3FmY_Ke80k")
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        navigationItem.rightBarButtonItem=UIBarButtonItem(title:"Next", style: .plain, target: self, action:#selector(nextLocation))
    }

   @objc func nextLocation(){
    
    if currentDestination == nil{
        currentDestination=destinations.first
        
        // let nextLocation=CLLocationCoordinate2DMake(-33.86, 151.20)
        mapView?.camera=GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }else{
        if let index = destinations.indexOf(currentDestination!), index < destinations.count - 1 {
            currentDestination = destinations[index + 1]
        }
            
        }
    }

    
    
    

}

