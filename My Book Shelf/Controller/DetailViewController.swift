import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookCategoryYearLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookSynopsisLabel: UILabel!
    
    var book: Book? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = book {
            bookImage.image = UIImage(named: result.cover)!
            bookCategoryYearLabel.text = "\(result.category) - \(result.yearPublished)"
            bookTitleLabel.text = result.title
            bookWriterLabel.text = result.writer
            bookSynopsisLabel.text = result.synopsis
        }
    }
    
}
