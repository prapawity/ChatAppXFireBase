//
//  ChatViewController.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ChatViewController: UIViewController {
    var myDb = Firestore.firestore()
    @IBOutlet weak var nav: UINavigationBar!
    var listChat: [Chat] = [Chat(type: .right, name: "Test", desc: "oijiojifgjifsjgiojeiogjeiojfgioefjgijsfgesg"),Chat(type: .left, name: "Test", desc: "oijiojifgjifsjgioje")]
    var destination: UserDetail?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatRightCell", bundle: nil), forCellReuseIdentifier: "chatRight")
        tableView.register(UINib(nibName: "ChatLeftCell", bundle: nil), forCellReuseIdentifier: "chatLeft")
        nav.topItem?.title = destination?.email
        // Do any additional setup after loading the view.
    }
    
    func queryChat(){
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendChat(_ sender: UIButton) {
        myDb.collection("chatData").document("\(UserDefaults.standard.string(forKey: "user"))_\(destination?.email)").setData(["test" : listChat])
    }

}
extension ChatViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch listChat[indexPath.row].type {
        case .right:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "chatRight", for: indexPath) as? ChatRightCell{
                cell.setChat(name: listChat[indexPath.row].name, desc: listChat[indexPath.row].desc)
                return cell
            }
        case .left:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "chatLeft", for: indexPath) as? ChatLeftCell{
                cell.setCell(name: listChat[indexPath.row].name, desc: listChat[indexPath.row].desc)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}
