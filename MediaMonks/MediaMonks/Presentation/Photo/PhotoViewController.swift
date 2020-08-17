//
//  PhotoViewController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    
    var photoPresenter: PhotoPresenter?
    
    private var cellIdentifier = "PhotoCollectionViewCell"
    
    // MARK: - Initialization
        
    init(photoPresenter: PhotoPresenter) {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.photoPresenter = photoPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoPresenter?.update(view: self)
        photoPresenter?.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        title = "Photos"
        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 23, right: 16)
        collectionView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extension AlbumView

extension PhotoViewController: PhotoView {
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}

// MARK: - Extension UICollectionViewDelegate, UICollectionViewDataSource

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoPresenter?.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(photo: photoPresenter?.photos[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.3,
            delay: 0.05,
            animations: {
                cell.alpha = 1
        })
    }
}

// MARK: - Extension CollectionViewDelegateFlowLayout

extension PhotoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 8
        let spacing: CGFloat = 32
        let collectionCellWidth: CGFloat = (collectionView.bounds.width - (padding + spacing)) / 3
        let collectionCellHeight = collectionCellWidth

        return CGSize(width: collectionCellWidth, height: collectionCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
