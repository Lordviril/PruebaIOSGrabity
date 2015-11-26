//
//  DetallesViewController.swift
//  PruebaIOSGrabity
//
//  Created by Pedro Alonso Daza Balaguera on 25/11/15.
//  Copyright © 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import UIKit

class DetallesViewController: UIViewController {
    
    @IBOutlet weak var imAplicacion: UIImageView!
    
    @IBOutlet weak var lbNombreAplicacion: UILabel!
    
    @IBOutlet weak var lbPrecio: UILabel!
    
    @IBOutlet weak var lbDetalles: UILabel!
    var APLICACION:Aplicaciones?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imAplicacion.image = APLICACION!.im_image
        lbNombreAplicacion.text = APLICACION!.im_name
        
        lbPrecio.text = APLICACION!.rights + "\n$" + APLICACION!.amount + "\n" + APLICACION!.currency + "\nRelase date: " + APLICACION!.releaseDate + "\n" + APLICACION!.im_contentType
        
        lbDetalles.text = "Summary: " + APLICACION!.summary
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
