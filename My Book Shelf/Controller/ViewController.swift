import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var booksTableView: UITableView!
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksTableView.dataSource = self
        booksTableView.delegate = self
        booksTableView.layoutMargins = UIEdgeInsets.zero
        booksTableView.separatorInset = UIEdgeInsets.zero
        booksTableView.register(
            UINib(nibName: "BooksTableViewCell", bundle: nil),
            forCellReuseIdentifier: "BookCell"
        )
        
        loadBooks()
    }
    
    func loadBooks() {
        if let path = Bundle.main.path(forResource: "BookShelf", ofType: "json") {
            if let bookShelfData = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe) {
                if let bookShelf = try? JSONDecoder().decode(BookShelf.self, from: bookShelfData as Data) {
                    books = bookShelf.items
                    booksTableView.reloadData()
                }
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BooksTableViewCell {
            let book = books[indexPath.row]
            cell.bookLabel.text = book.title
            cell.bookWriterLabel.text = book.writer
            cell.bookImageView.image = UIImage(named: book.cover)!
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: books[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.book = sender as? Book
            }
        }
    }
    
}
