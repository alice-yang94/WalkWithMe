//
//  ViewController.swift
//  WalkWithMe
//
//  Created by yangwenke on 01/06/2016.
//  Copyright © 2016 Wenke Yang. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreGraphics

class ViewController: UIViewController {
    
    @IBOutlet weak var theMapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
                                                          longitude: 151.20, zoom: 6)
        //let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        //let mapView = GMSMapView.mapWithFrame(self.theMapView.bounds, camera: camera)
        let mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, 360, 545), camera: camera)
        
        
       
        
        mapView.myLocationEnabled = true
        
        //[self.view insertSubview:backgroundView atIndex:0];
        //self.view.insertSubview(mapView, atIndex: 1)
        //self.view = mapView
        //self.view.addSubview(mapView)
        self.theMapView.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
   
}

