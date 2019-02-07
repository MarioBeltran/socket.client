//
//  ViewController.swift
//  socket.client
//
//  Created by Flia Beltran Mendez on 24/01/18.
//  Copyright © 2018 Flia Beltran Mendez. All rights reserved.
//

import UIKit
import SwiftSocket

let client = TCPClient(address: "192.168.0.17", port: 8091)

class ViewController: UIViewController {

    @IBOutlet weak var enterMensaje: UITextField!
    @IBOutlet weak var recibirMensaje: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recibirMensaje.text = "Esperando"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Send(_ sender: Any) {
    
        //PRIMERA PRUEBA SI FUNCIONO
     /*   switch client.connect(timeout: 1) {
        case .success:
            client.send(string: "02/551489775,32.;")
        case .failure(let error):
            print(error)
        }
        client.close()
                    */
        
        //Segunda prueba con retorno
        switch client.connect(timeout:5) {
        case .success:
          switch client.send(string: enterMensaje.text!) {
            case .success:
            
                guard let data = client.read(1024*10) else { return }
                
               if let response = String(bytes: data, encoding: .utf8) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
      
    }
    
    
}

