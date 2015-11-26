//
//  MemCashe.swift
//  VillavoIN
//
//  Created by Pedro Alonso Daza Balaguera on 4/09/15.
//  Copyright (c) 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import Foundation
import UIKit

class MemCashe{
    
    func llamadoImagenes (url:String) -> (UIImage)
    {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var ImagenDomicilio:UIImage?
        if defaults.objectForKey(url) != nil
        {
            
            ImagenDomicilio = UIImage(data: defaults.objectForKey(url) as! NSData)
            
        }
        else
        {
            print(url)
            let url1 = NSURL(string: url)

            if let data = NSData(contentsOfURL: url1!){

                    ImagenDomicilio = UIImage(data: NSData(contentsOfURL: url1!)!)
                    defaults.setObject(data, forKey: url)
                
            }
            else
            {
                let url2 = NSURL(string: "http://villavoin.co/VillavoINApi/Domicilios/NoDisponible.PNG")
                ImagenDomicilio = UIImage(data: NSData(contentsOfURL: url2!)!)
                //defaults.setObject(NSData(contentsOfURL: url2!)!, forKey: url)
            }
            
            
        }
        return ImagenDomicilio!
    }
}