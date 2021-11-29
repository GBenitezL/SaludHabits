//
//  ViewControllerHabito6.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito6: UIViewController {
    var habitos = [Habito]()

    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }


    @IBOutlet weak var lbTemp: UILabel!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var swCompleto: UISwitch!
    @IBOutlet weak var lbCompletado: UILabel!
    
    var temp = Timer()
    var seg : Int = 360
    var numHabito : Int = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func swCompletar(_ sender: Any) {
        if swCompleto.isOn{
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
            despliegaAlerta()
            habitos[5].completo = true
        } else {
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
            habitos[5].completo = false
        }
    }
    
    
    func despliegaAlerta(){
        let alert = UIAlertController(title: "¡Increible!", message: "La meditacion es el camino a la paz mental.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
        self.present(alert, animated: true, completion: nil)
        completarHabito(numHabito: numHabito)
        lbCompletado.text = "Completado ✔️"
        lbCompletado.textColor = UIColor.black
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
        if seg == 0 {
            seg = 360
        }
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
        do {
            let data = try PropertyListEncoder().encode(habitos)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print(" al escribir en el archivo")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        
        if(habitos[5].completo){
            swCompleto.isOn = true
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }else{
            swCompleto.isOn = false
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
        
    }
}
