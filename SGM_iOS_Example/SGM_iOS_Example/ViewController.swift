//
//  ViewController.swift
//  SGM_iOS_Example
//
//  Created by illo on 3/24/24.
//

import CoreBluetooth
import SGM
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanAndLink(_ sender: Any) {
        SGM.shared.scan(callback: { (peripheral: CBPeripheral) -> () in
            print("peripheral.identifier: \(peripheral.identifier)")
            SGM.shared.link(peripheral: peripheral)
        })
    }
    
    @IBAction func test(_ sender: Any) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d, HH:mm:ss"
        SGM.shared.displayReferenceCardSimple(title: "Date", body: dateFormatter.string(from: date))
    }
    
    @IBAction func moveUp(_ sender: Any) {
        SGM.shared.moveReferenceCardSimple(title: "Title", body: "Body", directionUp: true)
    }
    
    @IBAction func moveDown(_ sender: Any) {
        SGM.shared.moveReferenceCardSimple(title: "Title", body: "Body", directionUp: false)
    }
    
}
