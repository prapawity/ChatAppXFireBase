//
//  ChatListViewController.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {
    var chatList: [ChatListModel] = [ChatListModel(name: "test", desc: "chjjjkklasjdiojisjiojiodsjfioagoijiojioejrijroeiwjtiorejwtiorjwoitjwe4itjio4rjtoiejtiojeitjoierjsotjoerjtseafdg"),ChatListModel(name: "test", desc: "rejwtiorjwoitjwe4itjio4rjtoiejtiojeitjoierjsotjoerjtseafdg")]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatListCell", bundle: nil), forCellReuseIdentifier: "ChatList")
        // Do any additional setup after loading the view.
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
extension ChatListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatList", for: indexPath) as? ChatListCell{
            
            cell.setChatCell(name: chatList[indexPath.row].name, desc: chatList[indexPath.row].desc)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toChat", sender: nil)
    }
    
    
}
