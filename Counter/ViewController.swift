//
//  ViewController.swift
//  Counter
//
//  Created by Thai, Kristina on 9/18/16.
//
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
  
    @IBOutlet var tableView: UITableView!
    var counterData = [Int]()
    private let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureWCSession()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureWCSession()
    }
    
    private func configureWCSession() {
        session?.delegate = self;
        session?.activate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.title = "Count List"

        self.tableView.dataSource = self
    }
}

extension ViewController: WCSessionDelegate {
        
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        DispatchQueue.main.async {
            if let counterValue = message["counterValue"] as? Int {
                self.counterData.append(counterValue)
                self.tableView.reloadData()
            }
        }
    }
    
    //Handlers in case the watch and phone watch connectivity session becomes disconnected
    func sessionDidDeactivate(_ session: WCSession) {}
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterData.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CounterCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        let counterValueString = String(counterData[indexPath.row])
        cell?.textLabel?.text = counterValueString
        
        return cell!

    }
}
