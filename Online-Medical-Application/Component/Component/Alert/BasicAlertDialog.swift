//
//  BasicAlertDialog.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import UIKit

public class BasicAlertDialog: UIView {
	
	private lazy var backgroundView: UIView = {
		let view = UIView()
		view.backgroundColor = .gray
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var containerView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var messageLbl: UILabel = {
		let lbl = UILabel()
		lbl.font = .systemFont(ofSize: 17, weight: .regular)
		lbl.translatesAutoresizingMaskIntoConstraints = false
		return lbl
	}()
	
	private lazy var confirmationBtn: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("Ok", for: .normal)
		return btn
	}()
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	private func setupView() {
		addSubview(backgroundView)
		backgroundView.addSubview(containerView)
		containerView.addSubview(messageLbl)
		containerView.addSubview(confirmationBtn)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
			backgroundView.topAnchor.constraint(equalTo: topAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			
			containerView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
			containerView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
			containerView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
			
			messageLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
			messageLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
			messageLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),

			confirmationBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
			confirmationBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
			confirmationBtn.topAnchor.constraint(equalTo: messageLbl.bottomAnchor, constant: -16),
			confirmationBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16)
		])
	}
	
	public func showAlertDialog(message: String) {
		messageLbl.text = message
	}
}
