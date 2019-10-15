//
//  ViewController.swift
//  Custome_pinon mapkit
//
//  Created by Admin on 03/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import MapKit

class CustomPin:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String,pinSubtitle:String,location:CLLocationCoordinate2D) {
        self.coordinate=location
        self.title=pinTitle
        self.subtitle=pinSubtitle
        
    }
    
    
    
}

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mymapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mymapview.delegate=self
        let location = CLLocationCoordinate2DMake(28.465, 77.763)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
       self.mymapview.setRegion(region, animated: true)
        let pin=CustomPin(pinTitle: "Appinventiv", pinSubtitle: "Himanchla Up", location: location)
        self.mymapview.addAnnotation(pin)
        // Do any additional setup after loading the view.
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let annotationView=MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")
        annotationView.image=UIImage(named: "pin")
        annotationView.canShowCallout=true
        
        return annotationView
    }
    
    

}

