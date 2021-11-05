//
//  ViewControllerHabito6.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito6: UIViewController {

    @IBOutlet weak var lbTemp: UILabel!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var swCompleto: UISwitch!
    
    
    var temp = Timer()
    var seg : Int = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func swCompletar(_ sender: Any) {
        if swCompleto.isOn{
            despliegaAlerta()
        }
    }
    
    
    func despliegaAlerta(){
        let alert = UIAlertController(title: "¡Increible!", message: "La meditacion es el camino a la paz mental.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
        self.present(alert, animated: true, completion: nil)

    }
    
    func despliegaTiempo() {
        var segundos : Int!
        var minutos : Int!
        
        minutos = seg / 60
        segundos = seg % 60
        
        lbTemp.text = String(segundos)
        if segundos == 0{
            lbTemp.text = "00"
        }
        else if segundos < 10{
            lbTemp.text = "0"+String(segundos)
        }
        else{
            lbTemp.text = String(segundos)
        }
        lbMin.text = String(minutos)
        
        if segundos == 0 && minutos == 0{
            swCompleto.isOn = true
            despliegaAlerta()
        }
    }
    
    @IBAction func btIniciar(_ sender: Any) {
        temp.invalidate()
        temp = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewControllerHabito6.temporizador), userInfo: nil, repeats: true)
    }
    
    @IBAction func btPausar(_ sender: Any) {
        temp.invalidate()
    }
    
    @IBAction func btReiniciar(_ sender: Any) {
        temp.invalidate()
        seg = 360
        despliegaTiempo()
    }
    
    @objc func temporizador(){
        seg -= 1
        despliegaTiempo()
        if (seg == 0){
            temp.invalidate()
        }
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
