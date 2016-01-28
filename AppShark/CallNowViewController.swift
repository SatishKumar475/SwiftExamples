//
//  CallNowViewController.swift
//  AppShark
//
//  Created by satish on 11/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class CallNowViewController: UIViewController , CLLocationManagerDelegate {
    @IBOutlet var menubutton_CallNow : UIBarButtonItem!
    @IBOutlet var favourateButton_CallNow : UIBarButtonItem!
    @IBOutlet var searchButton_CallNow : UIBarButtonItem!
    @IBOutlet var filterButton_CallNow : UIBarButtonItem!
    var locationManager : CLLocationManager!
    var activity : UIActivityIndicatorView!
    var marakersArray : NSMutableArray!
    var mapView : GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 67/255, blue: 160/255, alpha: 1.0)
        self.navigationItem.setHidesBackButton(true, animated:true);
        let logo = UIImage(named: "covered16.png")
        let imageView = UIImageView(image:logo)
        //        imageView.layer.cornerRadius = imageView.frame.size.width/2
        //        imageView.layer.borderWidth = 1
        //        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.navigationItem.titleView = imageView
        if revealViewController() != nil {
            menubutton_CallNow.target = revealViewController()
            menubutton_CallNow.action = "revealToggle:"
            //For left view
//            revealViewController().rightViewRevealWidth = 200
//            filterButton_CallNow.target = revealViewController()
//            filterButton_CallNow.action = "rightRevealToggle:"
            
            //            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        activity = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activity.center = self.view.center
        self.view.addSubview(activity)
        activity.startAnimating()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        //        if currentloaction.locationServicesEnabled {
        //
        //        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         locationManager.stopUpdatingLocation()
        let location : CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("latitude :\(location.latitude)")
        print("longitude :\(location.longitude)")
        print(locations)
        activity.stopAnimating()
        let camera = GMSCameraPosition.cameraWithLatitude(location.latitude, longitude: location.longitude, zoom: 10)
         mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        let maraker = GMSMarker()
//        maraker.position = camera.target
//        maraker.snippet = "Hyderbad"
//        maraker.map = mapView
        self.view = mapView
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
                self.getSorroundingRestrunts(completAddress)
                
//                self.activity.stopAnimating()
//                self.htNoField.text = completAddress
//                self.cityField.text = pm?.subLocality
//                self.stateField.text = (pm?.locality)!+(",")+(pm?.postalCode)!
                
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    func getSorroundingRestrunts (currentAddress : String) {
        let urlString = NSString(format: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=hospital+in+%@&key=AIzaSyDFnpK7Pa3uAMcOQzGFVUOQwiPZOFgRHaw",currentAddress)
        let url : NSURL = NSURL(string: urlString as String)!
        let urlRequest = NSURLRequest(URL: url)
//        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {(respnce,data, connectionError) -> Void in
//            var error: NSError? = nil
//            let result = NSJSONSerialization.JSONObjectWithData(da, options: <#T##NSJSONReadingOptions#>)
////            var result: [NSObject : AnyObject] = NSJSONSerialization.JSONObjectWithData(data!, options: 0)
////            markerArray = (result["results"] as! String)
////            self.showMarkersonMapView()
//        })
        
//        var responceerror : NSError?
        var responce : NSURLResponse?
        let urldata : NSData = try! NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: &responce)
//        let responcedata : NSString = NSString(data: urldata, encoding: NSUTF8StringEncoding)
        let result = (try! NSJSONSerialization.JSONObjectWithData(urldata, options:[])) as! NSDictionary
        marakersArray = result.objectForKey("results") as! NSMutableArray
//        placetheArray(marakersArray)
    }
    func placetheArray (marakerList : NSMutableArray!) {
        for var i :Int = 0 ; i < marakerList.count ; i++ {
            let maraker = GMSMarker()
//            [markerArray[i][@"geometry"][@"location"][@"lat"] floatValue]
//            let lat = (marakerList.objectAtIndex(i).objectForKey("geometry")?.objectForKey("location")?.objectForKey("lat"))! as AnyObject
//            let lng = (marakerList.objectAtIndex(i).objectForKey("geometry")?.objectForKey("location")?.objectForKey("lng"))! as AnyObject
            
            
//                    maraker.position = CLLocationCoordinate2DMake(lat as Float ,lng as Float)
                    maraker.snippet = "Hyderbad"
                    maraker.map = mapView
        }
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
