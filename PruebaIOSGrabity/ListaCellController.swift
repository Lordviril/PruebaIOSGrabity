//
//  DomiciliosListaDeProductosCellController.swift
//  VillavoIN
//
//  Created by Pedro Alonso Daza Balaguera on 16/07/15.
//  Copyright (c) 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//
/*
import UIKit

class DomiciliosListaDeProductosCellController: UITableViewCell {

@IBOutlet weak var imProducto: UIImageView!
@IBOutlet weak var lbNombre: UILabel!

@IBOutlet weak var lbPrecio: UILabel!

func Productos(Nombre:String, Precio:String, Imagen:UIImage ) {


}

}*/
import UIKit

class ListaCellController: UITableViewCell {
    
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
