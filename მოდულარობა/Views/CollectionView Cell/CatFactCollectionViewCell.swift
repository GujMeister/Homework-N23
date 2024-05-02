import UIKit

class CatFactCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseIdentifier = "CatFactCollectionViewCell"
    
    lazy var backgroundColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor().randomColor()
        return view
    }()
    
    lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI setup
    private func setupViews() {
        
        contentView.addSubview(backgroundColorView)
        contentView.addSubview(pageLabel)
        
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        pageLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            backgroundColorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            backgroundColorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            backgroundColorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            pageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            pageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            pageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
        ])
    }
}
