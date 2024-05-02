import Foundation
import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.catFacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatFactCollectionViewCell.reuseIdentifier, for: indexPath) as! CatFactCollectionViewCell
        let fact = viewModel.catFacts[indexPath.item]
        cell.pageLabel.text = fact.fact
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fact = viewModel.catFacts[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatFactCollectionViewCell.reuseIdentifier, for: indexPath) as! CatFactCollectionViewCell
        cell.pageLabel.text = fact.fact
        
        let width = collectionView.frame.width
        let height: CGFloat = 0
        let targetSize = CGSize(width: width, height: height)
        
        let size = cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .fittingSizeLevel)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0.2
        UIView.animate(withDuration: 0.2) {
            cell.alpha = 1
        }
    }
}
