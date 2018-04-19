//
//  ViewController.swift
//  bluetoothTest
//
//  Created by Michael  Murphy on 4/17/18.
//  Copyright © 2018 Michael  Murphy. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralManagerDelegate {
    
    var manager: CBManager!
    var peripheral: CBPeripheral!
    
    @IBOutlet weak var Label: UILabel!
    
    
    var centralManager: CBCentralManager!
        override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        central.scanForPeripherals(withServices: nil, options: nil)
        
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var output = Label.text! + "\n"
        view.backgroundColor = .red
        if let device = (advertisementData as NSDictionary)
            .object(forKey: CBAdvertisementDataLocalNameKey)
            as? String {
            output += device
        }
        Label.text = output
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
    }
    
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}



        

