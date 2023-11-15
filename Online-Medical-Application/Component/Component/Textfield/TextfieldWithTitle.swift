//
//  TextfieldWithTitle.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 14/11/23.
//

import Foundation
import UIKit

public class TextfieldWithTitle: UIView {
	
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
	
	private lazy var titleTextfieldVStack: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.spacing = 8
		stackView.axis = .vertical
		return stackView
	}()
	
	public var text: String? {
		get {
			return textField.text
		} set {
			textField.text = newValue
		}
	}
	
	public convenience init(title: String, placeholder: String) {
		self.init(frame: .null)
		titleLbl.text = title
		textField.placeholder = placeholder
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
		addSubview(titleTextfieldVStack)
		titleTextfieldVStack.addArrangedSubview(titleLbl)
		titleTextfieldVStack.addArrangedSubview(textField)
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
	}
	
}
