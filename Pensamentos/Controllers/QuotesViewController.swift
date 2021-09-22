//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by André Felipe de Sousa Almeida - AAD on 20/09/21.
//

import UIKit

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Refresh"),
                                               object: nil,
                                               queue: nil) { nitification in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    fileprivate func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(named: "primary")!
        lbQuote.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(named: "secondary")! : .yellow
        prepareQuote()
    }
    
    func prepareQuote(){
        timer?.invalidate()
        if config.autorefresh{
            Timer.scheduledTimer(withTimeInterval: config.timeInterval,
                                 repeats: true) { timer in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote(){
        let quote = quotesManager.randomQuote
        lbQuote.text = quote.quoteFormatted
        lbAuthor.text = quote.authorFormatted
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        
        ctTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBg.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
