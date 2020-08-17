//
//  AlbumViewController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    var albumPresenter: AlbumPresenter?
    
    private var cellIdentifier = "AlbumTableViewCell"
    
    // MARK: - Initialization
        
    init(albumPresenter: AlbumPresenter) {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.albumPresenter = albumPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumPresenter?.update(view: self)
        albumPresenter?.viewDidLoad()
        
        setup()
        setupNavigationBar()
    }
    
    // MARK: - Private
    
    private func setup() {
        title = "Albums"
        
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.mainColor]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.mainColor]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .mainColor
        navigationController?.navigationBar.barTintColor = .white
    }
}

// MARK: - Extension AlbumView

extension AlbumViewController: AlbumView {
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

// MARK: - Extension TableView

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumPresenter?.albums.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        
        cell.bind(album: albumPresenter?.albums[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.3,
            delay: 0.05,
            animations: {
                cell.alpha = 1
        })
    }
}
