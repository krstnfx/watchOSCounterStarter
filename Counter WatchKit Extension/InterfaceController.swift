//
//  InterfaceController.swift
//  Counter WatchKit Extension
//
//  Created by Thai, Kristina on 9/18/16.
//
//

import WatchKit
import Foundation
//2 - Import Watch Connectivity framework

//3 - Add WCSessionDelegate to class definition
class InterfaceController: WKInterfaceController {
    
    //1 - Create a variable for your counter
    
    //4 - Set up Watch Connectivity
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //5 - Setup your saveCounter() function

 
    //6 - Setup your incrementCounter() function

}
