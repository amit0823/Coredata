//
//  ViewController.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    
    @IBOutlet weak var table:UITableView!
    
    private let manager = NewsManager()
    
    var newslist : [NewsList]? = nil
    var Deletednewslist : [NewsList]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        newslist = manager.fetchNews()
        
       if(newslist != nil && newslist?.count != 0)
       {
           DispatchQueue.main.async
            {
            self.table.reloadData()
                      }
        
       }else
       {
         CallApi()
        
       }
        
        
        
       
    }
    
    
    
func CallApi()
{
    
    
    ApiManager.shared.callApiWithRequest(url: ApiUrl.url, mehtod: "GET")
    { (result:(Result<APIResponse,ApiManager.ApiError>)) in
        
        switch result
        {
            
        case .success(let response):
            print(response)
            if response.news.count > 0
            {
                response.news.forEach({(getdata) in
                  
                    
                    let news = NewsList(imageURL:getdata.imageURL , newsTitle: getdata.newsTitle, updatedAt: getdata.updatedAt, newsDescription: getdata.newsDescription, iD: UUID())
                                  
                    self.manager.createNews(news: news)
                })
                
        
                
            }
            
            DispatchQueue.main.async {
                self.newslist = self.manager.fetchNews()
                self.table.reloadData()
            }
            
        case .failure(let error) :
            print(error.localizedDescription)
        }
        
    }
    
}

    
    
    
    


}
extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newslist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lbl_date.text = "Date \n\(ConvertDate(date:newslist?[indexPath.row].updatedAt ?? "1-07-2020"))"
        cell.lbl_title.text = "Title\n\(newslist?[indexPath.row].newsTitle ?? "")"
        cell.lbl_desc.attributedText = newslist?[indexPath.row].newsDescription.htmlToAttributedString
        if let img = newslist?[indexPath.row].imageURL
        {
            cell.img.downloaded(from: img)

        }
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
        
        
        if manager.deleteNews(id:(newslist?[indexPath.row].iD)!)
        {
            manager.createDeletedNews(news: (newslist?[indexPath.row])!)
            newslist?.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
        }
           
        
       }
       
   }
    
 
    
    
}
