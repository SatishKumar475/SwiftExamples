//
//  PlaceOrderViewController.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class PlaceOrderViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate , CLLocationManagerDelegate,MKMapViewDelegate {
    @IBOutlet var addressTableView : UITableView!
    @IBOutlet var addaddressView : UIView!
    @IBOutlet var htNoField : UITextField!
    @IBOutlet var cityField : UITextField!
    @IBOutlet var stateField : UITextField!
    var locationManager = CLLocationManager()
    var activity : UIActivityIndicatorView!
    var appdelegate : AppDelegate!
    var mapView : MKMapView!
    var customMapView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        // Do any additional setup after loading the view.
    }
    @IBAction func nextbuttonClicked (sender : UIBarButtonItem!) {
        let paymentOption = storyboard?.instantiateViewControllerWithIdentifier("PayMentViewController") as! PayMentViewController
        self.navigationController?.pushViewController(paymentOption, animated: true)
    }
    @IBAction func addAddressButtonClicked (sender : UIButton!) {
        addaddressView.hidden = false
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  appdelegate.addressArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("PlaceorderTableViewCell", forIndexPath: indexPath) as! PlaceorderTableViewCell
        cell.line1Label.text = appdelegate.addressArray.objectAtIndex(indexPath.row).valueForKey("Line1") as? String
        cell.line2Label.text = appdelegate.addressArray.objectAtIndex(indexPath.row).valueForKey("Line2") as? String
        cell.line3Label.text = appdelegate.addressArray.objectAtIndex(indexPath.row).valueForKey("Line3") as? String
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let paymentOption = storyboard?.instantiateViewControllerWithIdentifier("PayMentViewController") as! PayMentViewController
        self.navigationController?.pushViewController(paymentOption, animated: true)
    }
    @IBAction func getCurrentLocation (sender : UIButton!) {
        //        let currentloaction = CLLocationManager()
        customMapView = UIView()
        customMapView.frame = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height)
        self.view.addSubview(customMapView)
        mapView = MKMapView()
        mapView.frame = CGRectMake(0, 50, customMapView.frame.size.width, customMapView.frame.size.height-50)
        mapView.delegate = self
        mapView.mapType = .Standard
        mapView.zoomEnabled = true
        customMapView.addSubview(mapView)
        activity = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activity.center = addaddressView.center
        addaddressView.addSubview(activity)
        activity.startAnimating()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        //        if currentloaction.locationServicesEnabled {
        //
        //        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()
        let location = CLLocationCoordinate2D(latitude: 17.3700, longitude: 78.4800)
        let spain = MKCoordinateSpanMake(0.05, 0.05)
        let regin = MKCoordinateRegion(center: location, span: spain)
        mapView.setRegion(regin, animated: true)
        let anootation = MKPointAnnotation()
        anootation.coordinate = location
        anootation.title = "Hyderbad"
        anootation.subtitle = "Telangana"
        mapView.addAnnotation(anootation)
        
    
    }
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        print("the New State is:\(newState)")
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("MyLocation") as! MKPinAnnotationView
//        if annotationView == nil {
           let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MyLocation")
//        }
        print("the New State is:\(annotation.coordinate.latitude)")
//         annotationView.annotation = annotation
        annotationView.enabled = true
        annotationView.draggable = true
        annotationView.canShowCallout = true
        return annotationView
    }
      func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
         print("the New location coordinates is:\(userLocation.coordinate.latitude,userLocation.coordinate.longitude)")
        
    }
    //    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        let location : CLLocationCoordinate2D = (manager.location?.coordinate)!
    //        print("latitude :\(location.latitude)")
    //        print("longitude :\(location.longitude)")
    //    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location : CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("latitude :\(location.latitude)")
        print("longitude :\(location.longitude)")
        print(locations)
        let loc = CLLocation(latitude: location.latitude, longitude: location.longitude)
        CLGeocoder().reverseGeocodeLocation(loc,completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            if placemarks?.count > 0 {
                let pm = placemarks?.last
                let address =  pm!.addressDictionary?["FormattedAddressLines"] as! [String]
                let completAddress = address.joinWithSeparator(",")
                self.activity.stopAnimating()
                self.htNoField.text = completAddress
                self.cityField.text = pm?.subLocality
                self.stateField.text = (pm?.locality)!+(",")+(pm?.postalCode)!
                
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    @IBAction func donebutonClicked (sender : UIButton!) {
        addaddressView .hidden = true
        
        let dictinary = ["Line1" : htNoField.text! , "Line2" : cityField.text!, "Line3" : stateField.text!] as NSDictionary
        appdelegate.addressArray.addObject(dictinary)
        addressTableView.reloadData()
        //        appDelegate.addressArray.addObjectsFromArray(["Line1" : htNoField.text , "Line2" : cityField.text, "Line3" : stateField.text])
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
