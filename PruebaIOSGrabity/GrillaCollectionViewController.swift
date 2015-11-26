//
//  GrillaViewController.swift
//  PruebaIOSGrabity
//
//  Created by Pedro Alonso Daza Balaguera on 26/11/15.
//  Copyright © 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import UIKit

class GrillaCollectionViewController: UICollectionViewController {
    
    let textCellIdentifier = "CellID"
    
    var APLICACIONES = [Aplicaciones]()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let Url = GlobalConstants.URLPRUEBA
        let request = Respuesta()
        request.Get(Url, Ok: {(result: NSDictionary)-> () in
            
            let requestImage = MemCashe()
            
            
            print("\(result)")
            
            let Arrayentry = result.valueForKey("feed")?.valueForKey("entry") as! NSArray;
            
            for apli in Arrayentry
            {
                let im_name = apli.valueForKey("im:name")?.valueForKey("label") as! String
                let im_image = requestImage.llamadoImagenes(((apli.valueForKey("im:image") as! NSArray).valueForKey("label") as! NSArray)[0] as! String)
                let summary = apli.valueForKey("summary")?.valueForKey("label") as! String
                let amount = apli.valueForKey("im:price")?.valueForKey("attributes")?.valueForKey("amount") as! String
                let currency = apli.valueForKey("im:price")?.valueForKey("attributes")?.valueForKey("currency") as! String
                let im_contentType = apli.valueForKey("im:contentType")?.valueForKey("attributes")?.valueForKey("label") as! String
                let rights = apli.valueForKey("rights")?.valueForKey("label") as! String
                let releaseDate = apli.valueForKey("im:releaseDate")?.valueForKey("attributes")?.valueForKey("label") as! String
                
                self.APLICACIONES.append(Aplicaciones(Aplicaciones: im_name, im_image: im_image, summary: summary, amount: amount, currency: currency, im_contentType: im_contentType, rights: rights, releaseDate: releaseDate))
            }
            
            self.collectionView!.reloadData()
            }, Error: {(result: String)-> () in
                
                let alertController = UIAlertController(title: "Precaucion", message:
                    "\(result)", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return APLICACIONES.count
    }
    

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(textCellIdentifier, forIndexPath: indexPath) as! GrillaCellController
        
        let row = indexPath.row

        
        cell.Aplicacion(APLICACIONES[row].im_name, NombreDesarrollador: APLICACIONES[row].rights, Imagen: APLICACIONES[row].im_image)
        self.animationforpostiondeslat(cell,ajuste_y: 0.0,pfinal: 950.0)
        return cell
    }
    
    func animationforpostiondeslat(ob : NSObject, ajuste_y:CGFloat, pfinal:CGFloat)
    {
        
        let objectcc:UIView = ob as! UIView
        let osurface = objectcc.frame
        let originalx = osurface.origin.x + 0.0
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: originalx ,y: osurface.origin.y + ajuste_y))
        path.addCurveToPoint( CGPoint(x: ((pfinal/3)*1), y: osurface.origin.y + ajuste_y), controlPoint1: CGPoint(x: ((pfinal/3)*1), y: osurface.origin.y + ajuste_y), controlPoint2: CGPoint(x: ((pfinal/3)*2), y: osurface.origin.y + ajuste_y))
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        //anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = 1//Float.infinity
        anim.duration = 0.7
        
        // we add the animation to the squares 'layer' property
        objectcc.layer.addAnimation(anim, forKey: "animate position along path")
        
        objectcc.frame.origin = CGPoint(x: osurface.origin.x, y: osurface.origin.y)
        
        //ArrayObjetos.append(objectcc)
        //objectcc.hidden = true;
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        print(APLICACIONES[row].im_name)
        
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetallesViewController") as! DetallesViewController
        
        viewController.APLICACION = APLICACIONES[row]
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
