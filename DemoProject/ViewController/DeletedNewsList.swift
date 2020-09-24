//
//  DeletedNewsList.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 18/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import UIKit

class DeletedNewsList: UIViewController {
    var Deletednewslist : [NewsList]? = nil
    @IBOutlet weak var table:UITableView!
    private let manager = NewsManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.Deletednewslist = self.manager.fetchDeletedNews()
            self.table.reloadData()
        }
    }


}
extension DeletedNewsList:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Deletednewslist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "DeletedTableViewCell") as! DeletedTableViewCell
        cell.lbl_date.text = "Date \n\(ConvertDate(date:Deletednewslist?[indexPath.row].updatedAt ?? "1-07-2020"))"
        cell.lbl_title.text = "Title\n\(Deletednewslist?[indexPath.row].newsTitle ?? "")"
        cell.lbl_desc.attributedText = Deletednewslist?[indexPath.row].newsDescription.htmlToAttributedString
        if let img = Deletednewslist?[indexPath.row].imageURL
        {
             cell.img.downloaded(from: img)
        }
        return cell
    }
    
    
}
