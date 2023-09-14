//
//  UpcomingViewController.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 12/09/23.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var mediaList: [Media] = [Media]()
    
    private let upcomingTable: UITableView = {
       let upcomingTable = UITableView()
        upcomingTable.register(MediaTableViewCell.self, forCellReuseIdentifier: MediaTableViewCell.identifier)
        
        return upcomingTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcomingMedia()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcomingMedia() {
        APICaller.shared.getUpcomingMovies { [weak self] results in
            switch results {
            case .success(let movies):
                self?.mediaList = movies
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.identifier, for: indexPath) as? MediaTableViewCell else {
            return UITableViewCell()
        }
        //cell.textLabel?.text = mediaList[indexPath.row].original_name ?? mediaList[indexPath.row].original_title ?? "Unknow"
        let media = mediaList[indexPath.row]
        cell.configure(with: MediaViewModel(mediaName: media.original_name ?? media.original_title ?? "Unknow Media Name", posterURL: media.poster_path ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
