//
//  MapViewController.swift
//  iOS-Assignment-WorldTrotter
//
//  Created by Sam Pitonyak on 11/16/21.
//

import UIKit
import MapKit


class MapViewcontroller: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        let margins = view.layoutMarginsGuide
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let pointOfInt = UILabel()
        pointOfInt.translatesAutoresizingMaskIntoConstraints = false
        pointOfInt.text = "Points of Interest"
        
        view.addSubview(pointOfInt)
        
        let topLabelConstraint = pointOfInt.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let leadingLabelConstraint = pointOfInt.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        let trailingLabelConstraint = pointOfInt.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topLabelConstraint.isActive = true
        leadingLabelConstraint.isActive = true
        trailingLabelConstraint.isActive = true
        
        
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchButton)
        
        let labelWidth = pointOfInt.intrinsicContentSize.width + 12
        print(labelWidth)
        let topButtonConstraint = switchButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let leadingButtonConstraint = switchButton.leadingAnchor.constraint(equalTo: pointOfInt.trailingAnchor, constant: -labelWidth)
        let trailingButtonConstraint = switchButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topButtonConstraint.isActive = true
        leadingButtonConstraint.isActive = true
        trailingButtonConstraint.isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
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
        
        print("MapViewController loaded its view.")
    }
}
