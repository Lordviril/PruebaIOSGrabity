//
//  Respuesta.swift
//  VillavoIN
//
//  Created by Pedro Alonso Daza Balaguera on 8/09/15.
//  Copyright (c) 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//


import UIKit


    
    class Respuesta : NSObject {
        var alertaloding: UIAlertView = UIAlertView()

        func Get(url: String, Ok: (NSDictionary)-> (), Error: (String)-> ()) {
            alertaloding = AlertaController().alertaLoding()
            alertaloding.show()
            //var request = HTTPTask()
            var errores:String = ""
            let Url = url
            let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            //var params = ["email":""+ETUser.text, "password":""+ETPassword.text]
            if (Reachability.isConnectedToNetwork())
            {
                do {
                    let opt = try HTTP.GET(Url)
                    opt.start { response in
                        
                        if let err = response.error {
                            
                            errores = err.localizedDescription
                            print("error: \(err.localizedDescription)")
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                self.alertaloding.dismissWithClickedButtonIndex(-1, animated: true)
                                Error("Verifique su conexion de internet")
                            }
                            return //also notify app of failure as needed
                        }
                        if let data = response.collectData as? NSData {
                            
                            let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                            var err: NSError?
                            //var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
                            
                            print("error: \(str)")
                            var Datos = str
                            
                            var json:NSDictionary?// = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
                            
                            
                            
                            do {
                                json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                                // use anyObj here
                            } catch {
                                print("json error: \(error)")
                            }
                            
                            let obres = json
                            dispatch_async(dispatch_get_main_queue()) {
                                self.alertaloding.dismissWithClickedButtonIndex(-1, animated: true)
                                defaults.setObject(obres, forKey: "ituns")
                                Ok(obres!)
                            }
                        }
                    }
                } catch let error {
                    print("got an error creating the request: \(error)")
                    
                    errores = "\(error)"
                    
                    let obres = errores
                    dispatch_async(dispatch_get_main_queue()) {
                        self.alertaloding.dismissWithClickedButtonIndex(-1, animated: true)
                        Error(obres)
                    }
                }
                
            }
            else
            {

                self.alertaloding.dismissWithClickedButtonIndex(-1, animated: true)
                
                if defaults.objectForKey("ituns") != nil
                {
                    Ok(defaults.objectForKey("ituns") as! NSDictionary)
                }
                else
                {
                    
                    Error("recuerden que debe estar conectado a internet aunque sea la primera vez que use la aplicacion")
                }
            }
        }


    }

