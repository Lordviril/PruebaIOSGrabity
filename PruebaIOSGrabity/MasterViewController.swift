

import UIKit



class MasterViewController: UIViewController, UINavigationControllerDelegate{


    var mainViewController: UIViewController!
    var RightController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        let orientation: UIInterfaceOrientationMask = [UIInterfaceOrientationMask.Portrait, UIInterfaceOrientationMask.PortraitUpsideDown]
        return orientation
    }
    
    @IBAction func Lista(sender: AnyObject) {
        let isiPad: Bool = (UIDevice.currentDevice().userInterfaceIdiom == .Pad);
        
        if (isiPad) {
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let Lista = storyboard.instantiateViewControllerWithIdentifier("GrillaCollectionViewController") as! GrillaCollectionViewController
            self.RightController = UINavigationController(rootViewController: Lista)
            
            self.slideMenuController()?.changeMainViewController(self.RightController, close: true)
        }
        else {
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let Lista = storyboard.instantiateViewControllerWithIdentifier("ListaTableViewController") as! ListaTableViewController
            self.RightController = UINavigationController(rootViewController: Lista)
            
            self.slideMenuController()?.changeMainViewController(self.RightController, close: true)
        }
        
    }

    @IBAction func Configuracion(sender: AnyObject) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let general = storyboard.instantiateViewControllerWithIdentifier("GeneralViewController") as! GeneralViewController
        general.Letrero = "Configuracion"
        self.RightController = UINavigationController(rootViewController: general)
        
        self.slideMenuController()?.changeMainViewController(self.RightController, close: true)
    }
    
    
    @IBAction func Perfil(sender: AnyObject) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let general = storyboard.instantiateViewControllerWithIdentifier("GeneralViewController") as! GeneralViewController
        
        general.Letrero = "Perfil"
        
        self.RightController = UINavigationController(rootViewController: general)
        
        self.slideMenuController()?.changeMainViewController(self.RightController, close: true)
    }
   }
