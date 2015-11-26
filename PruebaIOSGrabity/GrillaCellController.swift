//
//  GrillaCellController.swift
//  PruebaIOSGrabity
//
//  Created by Pedro Alonso Daza Balaguera on 26/11/15.
//  Copyright © 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import UIKit

class GrillaCellController: UICollectionViewCell {

    
    @IBOutlet weak var lbNombreAplicacion: UILabel!
    
    @IBOutlet weak var lbNombreDesarrollador: UILabel!
    
    @IBOutlet weak var imAplicacion: UIImageView!
    
    
    func Aplicacion(NombreAplicacion:String, NombreDesarrollador:String, Imagen:UIImage ) {
        lbNombreAplicacion.text = NombreAplicacion
        lbNombreDesarrollador.text = NombreDesarrollador
        
        let data = Imagen //make sure your image in this url does exist, otherwise unwrap in a if let check
        imAplicacion.image = data//UIImage(data: data)
    }
}
