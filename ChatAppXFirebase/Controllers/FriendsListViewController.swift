//
//  FriendsListViewController.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit
import FirebaseFirestore
import PopupDialog

class FriendsListViewController: UIViewController {
    weak var myDb = Firestore.firestore()
    var friendList: [UserDetail] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        queryFriend()
        
    }
    
    func createDialog(index: Int){
        // Prepare the popup assets
        let title = friendList[index].email
        let message = "Let's Chats With Me!!"
        let image: UIImage = #imageLiteral(resourceName: "logo")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "Chat", dismissOnTap: true) {
            self.myDb?.collection("ChatData").document("\(UserDefaults.standard.string(forKey: "user"))_\(title)")
            self.performSegue(withIdentifier: "toChat", sender: self.friendList[index])
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    func queryFriend(){
        friendList.removeAll()
        tableView.reloadData()
        myDb?.collection("AllUser").getDocuments(completion: { (querySnapshot, Error) in
            if let error = Error {
                print(error)
            }else{
                for document in querySnapshot!.documents {
                    if document.documentID != UserDefaults.standard.string(forKey: "user"){
                        let newUser = UserDetail(email: document.data()["email"] as! String, uid: document.data()["uid"] as! String)
                        self.friendList.append(newUser)
                       
                    }
                }
                 self.tableView.reloadData()
            }
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChat"{
            if let destination = segue.destination as? ChatViewController{
                let data = ( sender as? UserDetail)
                destination.destination = data
            }
        }
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

extension FriendsListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(friendList)
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendCell{
            cell.setFriendListCell(name: friendList[indexPath.row].email)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        createDialog(index: indexPath.row)
    }
    
    
}
