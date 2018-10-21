//
//  SearchViewController.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import UIKit
import AVFoundation
import SVDismissableProgressHUD
import AudioPlayer

class SearchViewController: ViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: CustomTableView!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var searchHeight: NSLayoutConstraint!
    
    var albums: [MusicItem] = []
    var selectedItem: MusicItem? = nil
    var isAlbum: Bool = true
    var offset: Int = 0
    var newDataLoading: Bool = false
    var context = StrategyContext()
    var hud: SVDismissableProgressHUD = SVDismissableProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchbar.delegate = self
        self.searchHeight.constant = self.context.strategy(isAlbum: self.isAlbum).searchBarHeight()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(play), name: NSNotification.Name(rawValue: "playingSong"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "playingSong"), object: nil)
    }
    
    //MARK: - Table View Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count > 0 ? self.albums.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.albums.count <= 0){
            let cell = UITableViewCell()
            cell.textLabel?.text = context.strategy(isAlbum: self.isAlbum).noDataMessage()
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: context.strategy(isAlbum: self.isAlbum).cellIdentifier(), for: indexPath) as? CellBehavior{
            cell.setup(item: self.albums[indexPath.row])
            return cell as! UITableViewCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(self.isAlbum){
            if let vc = storyboard?.instantiateViewController(withIdentifier: "searchID") as? SearchViewController{
                vc.isAlbum = false
                vc.selectedItem = self.albums[indexPath.row]
                vc.loadViewIfNeeded()
                vc.updateData(text: "")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.context.strategy(isAlbum: self.isAlbum).headerHeight()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.context.strategy(isAlbum: self.isAlbum).headerView(item: self.selectedItem)
    }
    
    //MARK: - Search Bar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.albums = []
        self.offset = 0
        self.updateData(text: searchText)
    }
    
    func updateData(text: String){
        DispatchQueue.global(qos: .background).async {
            self.context.strategy(isAlbum: self.isAlbum).retrieveData(id: self.context.strategy(isAlbum: self.isAlbum).itemId(item: self.selectedItem), offset: self.offset, text: text, success: {
                self.albums.append(contentsOf: $0 as! [MusicItem])
                self.offset = self.offset + 20
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }, failure: {
                self.hud.showDismissableError(status: "Término no encontrado")
                print($0)
            })
        }
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        //Bottom Refresh
        if(!self.context.strategy(isAlbum: self.isAlbum).isPaginable()){
            return
        }
        if scrollView == tableview{
            
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
            {
                if !newDataLoading{
                    
                    newDataLoading = true
                    self.updateData(text: self.searchbar.text!)
                }
            }
        }
    }
    
    @objc func play(notification: Notification){
        guard notification.userInfo != nil else {
            return
        }
        if let url = notification.userInfo!["url"] as? String{
            if let urlFile = URL(string: url){
                self.playUsingAVAudioPlayer(url: urlFile)
            }
        }
    }
    
    func playUsingAVAudioPlayer(url: URL) {
        print("playing \(url)")
        let playerItem = AVPlayerItem(url: url)
        
        let player = AVPlayer(playerItem:playerItem)
        player.volume = 1.0
        player.play()
        
    }

}
