//
//  ViewController.swift
//  My Book Shelf
//
//  Created by Aditya on 20/11/22.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var booksTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    booksTableView.dataSource = self
    booksTableView.delegate = self
    booksTableView.register(
      UINib(nibName: "BooksTableViewCell", bundle: nil),
      forCellReuseIdentifier: "BookCell"
    )
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return dummyBooksData.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: "BookCell",
      for: indexPath
    ) as? BooksTableViewCell {
      let book = dummyBooksData[indexPath.row]
      cell.bookLabel.text = book.title
      cell.bookWriterLabel.text = book.writer
      cell.bookImageView.image = book.cover
      return cell
    } else {
      return UITableViewCell()
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    performSegue(
      withIdentifier: "moveToDetail",
      sender: dummyBooksData[indexPath.row]
    )
  }
  
  override func prepare(
    for segue: UIStoryboardSegue,
    sender: Any?
  ) {
    if segue.identifier == "moveToDetail" {
      if let detailViewController = segue.destination as? DetailViewController {
        detailViewController.book = sender as? BookModel
      }
    }
  }
}
