//
//  CodeSnippets.swift
//  Counter WatchKit Extension
//
//  Created by Thai, Kristina on 9/18/16.
//
//

/* 
 * 1 - Create a variable for your counter
 */
var counter = 0


/*
 * 2 - Import Watch Connectivity framework
 */
import WatchConnectivity


/*
 * 3 - Add WCSessionDelegate to class definition
 */
class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    
/*
 * 4 - Set up Watch Connectivity
 */
private let session : WCSession? = WCSession.isSupported() ? WCSession.default : nil

override init() {
    super.init()
    
    session?.delegate = self
    session?.activate()
}

func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    
/*
 * 5 - Setup your incrementCounter() function
 */
counter+=1;
counterLabel.setText(String(counter))
    

/*
 * 6 - Setup your saveCounter() function
 */
let applicationData = ["counterValue" : counter]

if let session = session, session.isReachable {
    session.sendMessage(applicationData, replyHandler: nil, errorHandler: { error in
        print(error)
    })
}
