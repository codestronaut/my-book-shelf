//
//  BooksTableViewCell.swift
//  My Book Shelf
//
//  Created by Aditya on 20/11/22.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
  
  @IBOutlet weak var bookImageView: UIImageView!
  @IBOutlet weak var bookLabel: UILabel!
  @IBOutlet weak var bookWriterLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(
    _ selected: Bool,
    animated: Bool
  ) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

}
