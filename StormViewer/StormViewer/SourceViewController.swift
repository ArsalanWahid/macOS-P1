//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Arsalan Wahid Asghar on 06/01/2021.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    var pictures = [String]()
    @IBOutlet var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    
    //MARK:- TableView
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        
        vw.textField?.stringValue = pictures[row]
        return vw
    }
}
