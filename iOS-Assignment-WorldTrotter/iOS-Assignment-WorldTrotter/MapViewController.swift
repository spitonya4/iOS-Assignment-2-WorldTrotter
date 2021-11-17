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
        
        switchButton.isOn = true
        
        switchButton.addTarget(self, action: #selector(poiDisplay(_:)), for: .valueChanged)
        
        let labelWidth = pointOfInt.intrinsicContentSize.width + 12
        print(labelWidth)
        let topButtonConstraint = switchButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let leadingButtonConstraint = switchButton.leadingAnchor.constraint(equalTo: pointOfInt.leadingAnchor, constant: labelWidth)
        let trailingButtonConstraint = switchButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topButtonConstraint.isActive = true
        leadingButtonConstraint.isActive = true
        trailingButtonConstraint.isActive = true
        
        let findMe = UIButton()
        findMe.translatesAutoresizingMaskIntoConstraints = false
        
        findMe.setTitle("Find Me", for: .normal)
        findMe.setTitleColor(.black, for: .normal)
        findMe.layer.borderWidth = 1
        findMe.layer.cornerRadius = 2
        findMe.backgroundColor = UIColor.white
        
        view.addSubview(findMe)
        
        findMe.addTarget(self, action: #selector(pressedFind(_:)), for: .touchUpInside)
        
        
        let topFindConstraint = findMe.topAnchor.constraint(equalTo: pointOfInt.bottomAnchor, constant: 8)
        let leadingFindConstraint = findMe.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let fmButtonWidthConstraint = findMe.widthAnchor.constraint(
        equalToConstant: findMe.titleLabel!.intrinsicContentSize.width + 2.0 * 3)
        
        
        topFindConstraint.isActive = true
        leadingFindConstraint.isActive = true
        fmButtonWidthConstraint.isActive = true
        
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
    
    @objc func poiDisplay(_ poiSwitch: UISwitch) {
        if poiSwitch.isOn {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [])
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
        }
    }
    
    @objc func pressedFind(_ findButton: UIButton) {
        if findButton.isTouchInside {
            let burlington = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.478273, longitude: -73.197882), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(burlington, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
}
