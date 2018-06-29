//
//  ViewController.swift
//  HelloCLLocationManager
//
//  Created by 林奕德 on 2018/3/27.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation //使用者類別

class ViewController: UIViewController,CLLocationManagerDelegate{
   
    @IBOutlet weak var map: MKMapView!
    
     var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()// 請求使用者授權
        locationManager?.delegate = self //用self(自己) 當delegate(代表)的屬性
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest //準確度
        locationManager?.activityType = .automotiveNavigation //導航模式
        locationManager?.startUpdatingLocation() //每次更新移動 觸發protocol的方法
        
        if let coordinate = locationManager?.location?.coordinate {
            //座標
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            map.setRegion(region, animated: true)
        }
        map.userTrackingMode = .followWithHeading //跟蹤(Track)使用者 並保持中間點 且轉向
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
         print("___________________")
         print(locations[0].coordinate.latitude)
         print(locations[0].coordinate.longitude)
    }
    override func viewDidDisappear(_ animated: Bool) {
        locationManager?.stopUpdatingLocation() //停止更新
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

