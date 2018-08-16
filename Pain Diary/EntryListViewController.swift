//
//  EntryListViewController.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import UIKit

class EntryListViewController: UITableViewController {

    private var painEntries: [PainEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return painEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let painEntry = painEntries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        cell.imageView?.image = painEntry.intensity.image
        cell.textLabel?.text = "I was feeling \(painEntry.intensity.name)"

        let dateString = DateFormatter.localizedString(from: painEntry.timestamp, dateStyle: .medium, timeStyle: .short)
        cell.detailTextLabel?.text = "on \(dateString)"

        return cell
    }
}

extension EntryListViewController: PainConfigurable {
    func add(_ painEntry: PainEntry) {
        painEntries.insert(painEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
