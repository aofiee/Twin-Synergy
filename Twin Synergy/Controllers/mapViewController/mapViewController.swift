//
//  mapViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    private var mapViewModel: MapViewModel!
    let mAddress = """
                        1,3 Soi 4 Seri Village 8  Suan-Luang
                        Suan-Luang bangkok 10250
                       """
    
    @IBAction func getDirection(_ sender: UIButton) {
        let placeMark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(CLLocationDegrees(mapViewModel.lat), CLLocationDegrees(mapViewModel.lng)))
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Twin Synergy Co., Ltd."
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    func setupMapView(){
        mapViewModel = MapViewModel(map: MapModel(placeName: "Twin Synergy Co., Ltd.", address: mAddress, lat: 13.7405067, lng: 100.6314097))
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        let center = CLLocationCoordinate2D(latitude: CLLocationDegrees(mapViewModel.lat), longitude: CLLocationDegrees(mapViewModel.lng))
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = mapViewModel.placeName
        annotation.subtitle = mapViewModel.address
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(mapViewModel.lat), longitude: CLLocationDegrees(mapViewModel.lng))
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated:Bool){
        super.viewWillDisappear(animated)
        applyMapViewMemoryFix()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.showsUserLocation = true
        mapView.delegate = self
        
    }
    func applyMapViewMemoryFix(){
        mapView.showsUserLocation = false
        mapView.delegate = nil
        //mapView.removeFromSuperview()
    }
}
