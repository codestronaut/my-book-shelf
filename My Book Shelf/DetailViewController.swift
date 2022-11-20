//
//  DetailViewController.swift
//  My Book Shelf
//
//  Created by Aditya on 20/11/22.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var bookImage: UIImageView!
  @IBOutlet weak var bookCategoryYearLabel: UILabel!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookWriterLabel: UILabel!
  @IBOutlet weak var bookSynopsisLabel: UILabel!
  
  var book: BookModel? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let result = book {
      bookImage.image = result.cover
      bookCategoryYearLabel.text = "\(result.category) - \(result.yearPublished)"
      bookTitleLabel.text = result.title
      bookWriterLabel.text = result.writer
      bookSynopsisLabel.text = result.synopsis
    }
  }

}
