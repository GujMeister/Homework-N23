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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = collectionView.bounds.width
//        
//        let fact = viewModel.catFacts[indexPath.item]
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatFactCollectionViewCell.reuseIdentifier, for: indexPath) as! CatFactCollectionViewCell
//        cell.pageLabel.text = fact.fact
//        
//        // Calculate the height based on the text content and font
//        let size = cell.pageLabel.sizeThatFits(CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude))
//        
//        return CGSize(width: availableWidth, height: size.height + 20)
//    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let availableWidth = collectionView.bounds.width
    
            let fact = viewModel.catFacts[indexPath.item]
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatFactCollectionViewCell.reuseIdentifier, for: indexPath) as! CatFactCollectionViewCell
            cell.pageLabel.text = fact.fact
            
            let width = collectionView.frame.width
            let height: CGFloat = 0

            let targetSize = CGSize(width: width, height: height)

            let size = cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .fittingSizeLevel)

            return size
        }
    

}
