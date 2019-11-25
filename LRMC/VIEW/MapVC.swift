//
//  MapVC.swift
//  LRMC
//
//  Created by Marko Dreher on 1/3/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    @IBOutlet weak var nextBtn: UIButton!
    
   static let mainColor:UIColor = UIColor(red: 0x00/255.0, green:0xAB/255.0, blue: 0xBF/255.0, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.clipsToBounds = true
        nextBtn.layer.cornerRadius = nextBtn.layer.frame.size.height/2
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        determineCurrentLocation()
    }
    
    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: 33.762509, longitude: -78.8543963)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6))
        
        mapView.setRegion(region, animated: true)
        
        let littleRiver: MKPointAnnotation = MKPointAnnotation()
        littleRiver.coordinate = CLLocationCoordinate2DMake(33.883368,-78.5985851);
//        littleRiver.title = "Little River: 4303 Live Oak Dr, Little River, SC 29566"
        littleRiver.title = "4303 Live Oak Dr, Little River, SC 29566"
        mapView.addAnnotation(littleRiver)
        
        let carolina: MKPointAnnotation = MKPointAnnotation()
        carolina.coordinate = CLLocationCoordinate2DMake(33.762509,-78.9643963);
        carolina.title = "4220 Carolina Exchange Dr, Myrtle Beach, SC 29579"
//        carolina.title = "Carolina Forest: 4220 Carolina Exchange Dr, Myrtle Beach, SC 29579"
        mapView.addAnnotation(carolina)
        
        let loris: MKPointAnnotation = MKPointAnnotation()
        loris.coordinate = CLLocationCoordinate2DMake(34.057794,-78.8931389);
        loris.title = "3817 Main St, Loris, SC 29569"
        mapView.addAnnotation(loris)
        
        let beach: MKPointAnnotation = MKPointAnnotation()
        beach.coordinate = CLLocationCoordinate2DMake(33.748637, -78.816596);
//        beach.title = "Myrtle Beach: 7724 N Kings Hwy, Myrtle Beach, SC 29572"
        beach.title = "7724 N Kings Hwy, Myrtle Beach, SC 29572"
        mapView.addAnnotation(beach)
        
        let strand: MKPointAnnotation = MKPointAnnotation()
        strand.coordinate = CLLocationCoordinate2DMake(33.625906,-79.009232);
        strand.title = "3236 Holmestown Rd, Myrtle Beach, SC 29588"
//        strand.title = "South Strand: 3236 Holmestown Rd, Myrtle Beach, SC 29588"
        mapView.addAnnotation(strand)
        
        let health: MKPointAnnotation = MKPointAnnotation()
        health.coordinate = CLLocationCoordinate2DMake(33.699167,-78.886517);
//        health.title = "Health Access: 1075 Mr. Joe White Ave, Myrtle Beach, SC 29577"
        health.title = "1075 Mr. Joe White Ave, Myrtle Beach, SC 29577"
        mapView.addAnnotation(health)
        
    }
    


    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error \(error)")
    }

    @IBAction func navigateWeb(_ sender: Any) {
        if let url = URL(string: "tel://8436638000"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
