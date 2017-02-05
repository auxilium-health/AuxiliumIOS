//
//  Map.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/5/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Map : UIViewController {
    MKPointAnnotation *point;
    CLLocationManager *locationManager;
    MKPlacemark *placemark;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
