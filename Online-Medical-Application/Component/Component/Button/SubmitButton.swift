//
//  SubmitButton.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 14/11/23.
//

import UIKit

public class SubmitButton: UIView {
	
	private lazy var button: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = Color.primaryBlueColor.instance()
		btn.layer.cornerRadius = 8
		return btn
	}()
	
	private lazy var btnRightImgView: UIImageView = {
		let imgView = UIImageView()
		imgView.translatesAutoresizingMaskIntoConstraints = false
		imgView.contentMode = .scaleAspectFill
		imgView.tintColor = .white
		return imgView
	}()
	
	private var btnAction: (() -> Void)?
	
	public convenience init(title: String, rightImage: UIImage, action: @escaping () -> Void) {
		self.init(frame: .null)
		btnAction = action
		btnRightImgView.image = rightImage
		button.setTitle(title, for: .normal)
		button.addTarget(self, action: #selector(didTappedBtn), for: .touchUpInside)
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	private func setupView() {
		addSubview(button)
		button.addSubview(btnRightImgView)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: leadingAnchor),
			button.trailingAnchor.constraint(equalTo: trailingAnchor),
			button.topAnchor.constraint(equalTo: topAnchor),
			button.bottomAnchor.constraint(equalTo: bottomAnchor),
			button.heightAnchor.constraint(equalToConstant: 48),
			
			btnRightImgView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -24),
			btnRightImgView.centerYAnchor.constraint(equalTo: centerYAnchor),
			btnRightImgView.heightAnchor.constraint(equalToConstant: 24)
		])
	}
	
	@objc private func didTappedBtn() {
		btnAction?()
	}
}
