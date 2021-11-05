//
//  ViewControllerHabito9.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito9: UIViewController {
    
    var numHabito : Int = 9

    @IBOutlet weak var lbPasos: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
