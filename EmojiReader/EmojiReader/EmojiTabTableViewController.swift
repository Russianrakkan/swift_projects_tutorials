//
//  EmojiTabTableViewController.swift
//  EmojiReader
//
//  Created by Андрей Дуров on 09.12.2021.
//

import UIKit

class EmojiTabTableViewController: UITableViewController {
    
    var objects = [
        Emoji(emoji: "😍", name: "Love", description: "Let's love each other", isFavourite: false),
        Emoji(emoji: "🤡", name: "Clown", description: "Very funny", isFavourite: false),
        Emoji(emoji: "🎃", name: "Pumpkin", description: "Kinda spooky", isFavourite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")      //Если ячейка уже настроена в Main.storyboard, то здесь ее регистрировать не нужно
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        let object = objects[indexPath.row]
        cell.set(object: object)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //return .delete      //То же самое происходило бы, если бы этой функции вообще не было. А для добавления в список нужно писать return: .insert
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }

}
