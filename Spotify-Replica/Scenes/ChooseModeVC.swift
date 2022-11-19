//
//  ChooseModeVC.swift
//  Spotify-Replica
//
//  Created by Administrator on 19.11.22.
//

import UIKit

class ChooseModeVC: UIViewController {
    
    let spotifyIconImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage.appImages.spotifyIconImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let backgroundImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage.appImages.chooseModeImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let continueButton: SpotifyButton = {
        let button = SpotifyButton()
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lightModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.appImages.lightModeImage, for: .normal)
        button.layer.cornerRadius = 35
        button.layer.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.20)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let darkModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.appImages.darkModeImage, for: .normal)
        button.layer.cornerRadius = 35
        button.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.20)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var lightModeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var darkModeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var modesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var chooseModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Mode"
        label.textColor = UIColor.appColors.lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var darkModeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dark Mode"
        label.textColor = UIColor.appColors.lightGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    var lightModeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Light Mode"
        label.textColor = UIColor.appColors.lightGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupConstraints()
    }
    
    @objc func continueButtonTapped(_ button: UIButton) {
        button.zoomInWithEasing()
    }
}
extension ChooseModeVC {
    
    private func configureUI() {
        
        lightModeStackView.addArrangedSubview(lightModeButton)
        lightModeStackView.addArrangedSubview(lightModeLabel)
        darkModeStackView.addArrangedSubview(darkModeButton)
        darkModeStackView.addArrangedSubview(darkModeLabel)
        modesStackView.addArrangedSubview(lightModeStackView)
        modesStackView.addArrangedSubview(darkModeStackView)
        
        view.addSubview(backgroundImageView)
        view.addSubview(spotifyIconImageView)
        view.addSubview(modesStackView)
        view.addSubview(chooseModeLabel)
        view.addSubview(continueButton)
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        let modesButtonsContraints: [NSLayoutConstraint] = [
            lightModeButton.heightAnchor.constraint(equalToConstant: 70),
            lightModeButton.widthAnchor.constraint(equalToConstant: 70),
            darkModeButton.heightAnchor.constraint(equalToConstant: 70),
            darkModeButton.widthAnchor.constraint(equalToConstant: 70)
        ]
        
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
            continueButton.heightAnchor.constraint(equalToConstant: 92),
            continueButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        let modeStackContraints: [NSLayoutConstraint] = [
            chooseModeLabel.topAnchor.constraint(greaterThanOrEqualTo: spotifyIconImageView.bottomAnchor, constant: 24),
            chooseModeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            chooseModeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            chooseModeLabel.bottomAnchor.constraint(equalTo: modesStackView.topAnchor, constant: -24),
            modesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            modesStackView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -24)
        ]
        
        let continueButtonContraints: [NSLayoutConstraint] = [
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ]
        
        var  viewConstraints: [NSLayoutConstraint] = []
        viewConstraints.append(contentsOf: spotifyIconImageContraints)
        viewConstraints.append(contentsOf: bgImageContraints)
        viewConstraints.append(contentsOf: continueButtonContraints)
        viewConstraints.append(contentsOf: buttonContraints)
        viewConstraints.append(contentsOf: modeStackContraints)
        viewConstraints.append(contentsOf: modesButtonsContraints)
        
        NSLayoutConstraint.activate(viewConstraints)
    }
}

extension ChooseModeVC {
    
}
