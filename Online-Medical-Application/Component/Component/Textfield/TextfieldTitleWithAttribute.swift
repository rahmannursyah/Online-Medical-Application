//
//  TextfieldTitleWithAttribute.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import UIKit
import CommonExtension
import Utility

public class TextfieldTitleWithAttribute: UIView {
	
	private lazy var titleLbl: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 17, weight: .medium)
		label.textColor = Color.primaryBlueColor.instance()
		return label
	}()
	
	private lazy var textField: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.borderStyle = .roundedRect
		tf.layer.borderWidth = 0.25
		tf.layer.borderColor = UIColor.white.cgColor
		tf.layer.cornerRadius = 4
		tf.textColor = Color.primaryBlueColor.instance()
		tf.layer.shadowOpacity = 0.3
		tf.layer.shadowRadius = 8.0
		tf.layer.shadowOffset = CGSize(width: 0, height: 8)
		tf.layer.shadowColor = UIColor.gray.cgColor
		return tf
	}()
	
	private lazy var rightTitleLbl: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 14, weight: .regular)
		label.textColor = Color.secondaryBlueColor.instance()
		return label
	}()
	
	private lazy var rightImgView: UIImageView = {
		let imgView = UIImageView()
		imgView.translatesAutoresizingMaskIntoConstraints = false
		imgView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
		return imgView
	}()
	
	private lazy var titleTextfieldVStack: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.spacing = 8
		stackView.axis = .vertical
		return stackView
	}()
	
	private lazy var titleTextfieldHStack: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.spacing = 8
		stackView.axis = .horizontal
		stackView.distribution = .fillEqually
		return stackView
	}()
	
	public var text: String? {
		get {
			return textField.text
		} set {
			textField.text = newValue
		}
	}
	
	private var isUsingRightTitle = false
	
	public convenience init(title: String, placeholder: String, rightImg: UIImage, rightTitle: String? = nil) {
		self.init(frame: .null)
		titleLbl.text = title
		textField.placeholder = placeholder
		rightImgView.image = rightImg
		textField.rightView = rightImgView
		if let rightTitle = rightTitle {
			isUsingRightTitle = true
			rightTitleLbl.text = rightTitle
		}
		setupView()
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
		if isUsingRightTitle {
			addSubview(titleTextfieldVStack)
			titleTextfieldVStack.addArrangedSubview(titleTextfieldHStack)
			titleTextfieldHStack.addArrangedSubview(titleLbl)
			titleTextfieldHStack.addArrangedSubview(rightTitleLbl)
			titleTextfieldVStack.addArrangedSubview(textField)
		} else {
			addSubview(titleTextfieldVStack)
			titleTextfieldVStack.addArrangedSubview(titleLbl)
			titleTextfieldVStack.addArrangedSubview(textField)
		}
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			titleTextfieldVStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleTextfieldVStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleTextfieldVStack.topAnchor.constraint(equalTo: topAnchor),
			titleTextfieldVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
			titleLbl.heightAnchor.constraint(equalToConstant: 32),
			textField.heightAnchor.constraint(equalToConstant: 40)
		])
		
		if isUsingRightTitle {
			NSLayoutConstraint.activate([
				titleTextfieldHStack.leadingAnchor.constraint(equalTo: titleTextfieldVStack.leadingAnchor),
				titleTextfieldHStack.trailingAnchor.constraint(equalTo: titleTextfieldVStack.trailingAnchor),
				titleTextfieldHStack.topAnchor.constraint(equalTo: titleTextfieldVStack.topAnchor)
			])
		}
		
	}
}
