//
//  ViewController.swift
//  ThemSuaXoa2dulieuTableview
//
//  Created by Mac on 3/1/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
//              mảng 2 chiều
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchOutlet: UISwitch!
    var numberDelegetDataSource = NumberDelegetDataSource()
    var textDelegetDataSource   = TextDelegetDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate     = numberDelegetDataSource
        tableView.dataSource   = numberDelegetDataSource
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination    = segue.destination as? ToolViewController
        if let indexPath   = tableView.indexPathForSelectedRow {
            if (tableView.dataSource is NumberDelegetDataSource) {
                destination?.data = String(numberDelegetDataSource.number[indexPath.row])
            } else {
                destination?.data = textDelegetDataSource.textString[indexPath.row]
            }
            
            //    cach 2
            //            if switchOutlet.isOn {
            //               destination?.data = String(numberDelegetDataSource.number[indexPath.row])
            //
            //            }else {
            //                destination?.data = textDelegetDataSource.textString[indexPath.row]
            //
            //            }
            
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source as? ToolViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            (tableView.dataSource as? NumberDelegetDataSource)?.number[indexPath.row] = Int((source?.data)!) ?? 0
            //            (tableView.delegate as? NumberDelegetDataSource)?.number[indexPath.row]     = Int((source?.data)!) ?? 0
            (tableView.dataSource as? TextDelegetDataSource)?.textString[indexPath.row] = source?.data ?? ""
            //            (tableView.delegate as? TextDelegetDataSource)?.textString[indexPath.row] = source?.data ?? ""
            
            //   cach 2
            //            if switchOutlet.isOn {
            //                numberDelegetDataSource.number[indexPath.row] = Int((source?.data)!) ?? 0
            //            } else {
            //                textDelegetDataSource.textString[indexPath.row] = (source?.data)!
            //
            //            }
        } else {
            (tableView.dataSource as? NumberDelegetDataSource)?.number.append(Int((source?.data)!) ?? 0)
            //            (tableView.delegate as? NumberDelegetDataSource)?.number.append(Int((source?.data)!) ?? 0)
            (tableView.dataSource as? TextDelegetDataSource)?.textString.append((source?.data) ?? "")
            //             (tableView.delegate as? TextDelegetDataSource)?.textString.append((source?.data) ?? "")
            
            //            cach 2
            //            if switchOutlet.isOn {
            //                numberDelegetDataSource.number.append(Int((source?.data)!) ?? 0)
            //            } else {
            //                textDelegetDataSource.textString.append(source?.data ?? "")
            //            }
            
        }
        tableView.reloadData()
    }
    
    
    @IBAction func Switch(_ sender: UISwitch) {
        tableView.dataSource = sender.isOn ? numberDelegetDataSource : textDelegetDataSource
        tableView.delegate = sender.isOn ? numberDelegetDataSource : textDelegetDataSource
        tableView.reloadData()
    }
}
class NumberDelegetDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var number = [Int](1...100)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNew", for: indexPath) as! TableViewCell
        cell.textLabel?.text = String(number[indexPath.row])
        if indexPath.row % 10 == 0 {
         cell.contentView.backgroundColor = UIColor.red
        }
        return cell
    }
//    ham xoá
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
class TextDelegetDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var textString = ["anh vu", "max", "hello", "word", "..."]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textString.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNew", for: indexPath)
        cell.textLabel?.text = textString[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            textString.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
