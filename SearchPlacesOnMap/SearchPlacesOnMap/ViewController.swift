//
//  ViewController.swift
//  SearchPlacesOnMap
//
//  Created by Admin on 03/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var MyMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   MyMapView.delegate=self
        // Do any additional setup after loading the view.
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //ignoring the Users
        UIApplication.shared.beginIgnoringInteractionEvents()
        //Activity indicater
        let activityIndicater=UIActivityIndicatorView()
        activityIndicater.style = UIActivityIndicatorView.Style.gray
        activityIndicater.center=self.view.center
        activityIndicater.hidesWhenStopped=true
        activityIndicater.startAnimating()
        
        self.view.addSubview(activityIndicater)
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Create a search request
        let searchRequest=MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery=searchBar.text
        
        let activeSearch=MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (reponse,err) in
            
            //stopping the activity indicater as our results have come
            
            activityIndicater.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            //handling the result
            
            if reponse==nil{
                guard let err = err else {return}
                print(err.localizedDescription)
                return
            }
            else{
                for item in reponse!.mapItems{
                    print(item.placemark.countryCode!)
                    print(item.placemark.title!)
                }
                //getting data from the response
                guard  let latitude=reponse?.boundingRegion.center.latitude else{return}
                guard let longitude=reponse?.boundingRegion.center.longitude else {return}

                //create annotation from the above data

                let annotation = MKPointAnnotation()
                annotation.title=searchBar.text
                annotation.coordinate=CLLocationCoordinate2DMake(latitude , longitude)
                self.MyMapView.addAnnotation(annotation)

                //Zooming out the location

                let loc:CLLocationCoordinate2D=CLLocationCoordinate2DMake(latitude, longitude)
                let span=MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)

              //  let region = MKCoordinateRegion(center: loc, latitudinalMeters: 1000, longitudinalMeters: 1000)
                let region = MKCoordinateRegion(center: loc, span: span)
                self.MyMapView.setRegion(region, animated: true)


                //Remove Annotations
                guard let annotations = self.MyMapView.annotations as? MKAnnotation else{return}
                    self.MyMapView.removeAnnotation((annotations ))
            }
        }
    }

    @IBAction func searchTapped(_ sender: Any) {
        
        let searchcontroller = UISearchController(searchResultsController: nil)
        searchcontroller.searchBar.delegate=self
        present(searchcontroller, animated: true) {
            
        }
        
        
    }
    
}

