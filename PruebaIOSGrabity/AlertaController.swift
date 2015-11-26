//
//  AlertaController.swift
//  Baykus
//
//  Created by Pedro Alonso Daza Balaguera on 24/06/15.
//  Copyright (c) 2015 Delaware. All rights reserved.
//

import UIKit

class AlertaController: UIViewController {
    
    func alertaLoding() -> UIAlertView
    {
        var alert: UIAlertView = UIAlertView(title: "Cargando", message: "Por favor espere...", delegate: nil, cancelButtonTitle: nil);
        
        var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        loadingIndicator.center = self.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        return alert
    }
}
