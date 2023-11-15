//
//  BasicCardView.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import UIKit

public class BasicCardView: UIView {
	private lazy var containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 8
		view.layer.borderColor = UIColor.black.cgColor
		view.layer.borderWidth = 0.5
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = .systemFont(ofSize: 22, weight: .semibold)
		lbl.textColor = Color.primaryBlueColor.instance()
		return lbl
	}()
	
	private lazy var subtitleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.numberOfLines = 2
		lbl.font = .systemFont(ofSize: 17, weight: .regular)
		lbl.textColor = Color.secondaryBlueColor.instance()
		return lbl
	}()
	
	private lazy var button: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = Color.primaryBlueColor.instance()
		btn.layer.cornerRadius = 8
		return btn
	}()
	
	public convenience init(title: String, subtitle: String, buttonTitle: String) {
		self.init(frame: .null)
		titleLabel.text = title
		subtitleLabel.text = subtitle
		button.setTitle(buttonTitle, for: .normal)
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
		addSubview(containerView)
		containerView.addSubview(titleLabel)
		containerView.addSubview(subtitleLabel)
		containerView.addSubview(button)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.topAnchor.constraint(equalTo: topAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(containerView.frame.width/2 + 8)),
			titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
			
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
			subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			
			button.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
			button.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
			button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(containerView.frame.width/2 + 8)),
			button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
		])
	}
}
