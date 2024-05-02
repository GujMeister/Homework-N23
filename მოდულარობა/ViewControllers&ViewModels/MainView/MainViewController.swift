import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    var viewModel: MainViewControllerModel!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🐈 Facts"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor(hex: "#865e00")
        return label
    }()
    
    lazy var factCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#865e00")
        return label
    }()
    
    let wallpaperImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wallpaper")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 21
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CatFactCollectionViewCell.self, forCellWithReuseIdentifier: CatFactCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewControllerModel()
        setupUI()
        reloadData()
        viewModel.didLoad()
    }
    // MARK: - UI Setup
    func setupUI() {
        view.addSubview(wallpaperImageView)
        view.addSubview(titleLabel)
        view.addSubview(factCountLabel)
        view.addSubview(collectionView)
        
        wallpaperImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        factCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wallpaperImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wallpaperImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wallpaperImageView.topAnchor.constraint(equalTo: view.topAnchor),
            wallpaperImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            factCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            factCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: factCountLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Helper functions
    internal func reloadData() {
        viewModel.onCatFactsUpdated = { [weak self] in
            DispatchQueue.main.async {
                print("onCatFactsUpdated closure called. Reloading data...")
                self?.collectionView.reloadData()
                self?.factCountLabel.text = "Today we have \(self?.viewModel.catFacts.count ?? 0) facts to show you"
            }
        }
    }
}

