//
//  Datos.swift
//  PruebaIOSGrabity
//
//  Created by Pedro Alonso Daza Balaguera on 25/11/15.
//  Copyright © 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import UIKit

class Aplicaciones {
    
    
    let im_name: String
    let im_image: UIImage
    let summary: String
    let amount: String
    let currency: String
    let im_contentType: String
    let rights: String
    let releaseDate: String

    
    
    // designated initializer for a Monster
    init(Aplicaciones: String, im_image:UIImage, summary:String, amount:String, currency:String, im_contentType:String, rights:String, releaseDate: String)
    {
        self.im_name = Aplicaciones
        self.im_image = im_image
        self.summary = summary
        self.amount = amount
        self.currency = currency
        self.im_contentType = im_contentType
        self.rights = rights
        self.releaseDate = releaseDate
        
    }
    
}
