//
//  ViewController.swift
//  staj
//
//  Created by Isa Melsov on 2/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let  manager = Manager.shared
    
    private let tableView = UITableView()
    
    private var characters = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        manager.fetchCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
            case .failure(let error):
                print(error)
            }
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        let character = characters[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = character.name
        cell.contentConfiguration = content
        
        manager.fetchImage(from: character.image) { imageData in
            content.image = UIImage(data: imageData)
            content.imageProperties.cornerRadius = 10
            cell.contentConfiguration = content
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRow = characters[indexPath.row].status
        
        let secondViewController = SecondViewController()
        secondViewController.selectedStatus = selectedRow
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}



