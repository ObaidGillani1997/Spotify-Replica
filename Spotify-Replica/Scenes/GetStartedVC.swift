//
//  GetStartedVC.swift
//  UIKit-Programatically
//
//  Created by Administrator on 19.11.22.
//

import UIKit

class GetStartedVC: UIViewController {
    
    let spotifyIconImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage.appImages.spotifyIconImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let backgroundImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage.appImages.getStartedBGImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.text = "Enjoy listening to music"
        label.textColor = UIColor.appColors.lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam."
        label.textColor = UIColor.appColors.darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let getStartedButton: SpotifyButton = {
        let button = SpotifyButton()
        button.setTitle("Get started", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    
    var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupConstraints()
    }
    
    @objc func startButtonTapped(_ button: UIButton) {
        button.zoomInWithEasing()
        let vc = ChooseModeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
}

extension GetStartedVC {
    
    private func configureUI() {
         
         textStackView.addArrangedSubview(titleLabel)
         textStackView.addArrangedSubview(descriptionLabel)
         
         mainStackView.addArrangedSubview(textStackView)
         mainStackView.addArrangedSubview(getStartedButton)
    
         view.addSubview(backgroundImageView)
         view.addSubview(spotifyIconImageView)
         view.addSubview(mainStackView)
        
        getStartedButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
     }
     
     private func setupConstraints() {
         
         let spotifyIconImageContraints: [NSLayoutConstraint] = [
             spotifyIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
             spotifyIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
         ]
         
         let bgImageContraints: [NSLayoutConstraint] = [
             backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
             backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
             backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
         ]
         let buttonContraints: [NSLayoutConstraint] = [
             getStartedButton.heightAnchor.constraint(equalToConstant: 92),
             getStartedButton.widthAnchor.constraint(equalToConstant: 200)
         ]
         
         let mainStackContraints: [NSLayoutConstraint] = [
             mainStackView.topAnchor.constraint(greaterThanOrEqualTo: spotifyIconImageView.bottomAnchor, constant: 24),
             mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
             mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
             mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
         ]
         
         var  viewConstraints: [NSLayoutConstraint] = []
         viewConstraints.append(contentsOf: spotifyIconImageContraints)
         viewConstraints.append(contentsOf: bgImageContraints)
         viewConstraints.append(contentsOf: mainStackContraints)
         viewConstraints.append(contentsOf: buttonContraints)
         
         NSLayoutConstraint.activate(viewConstraints)
     }
}
