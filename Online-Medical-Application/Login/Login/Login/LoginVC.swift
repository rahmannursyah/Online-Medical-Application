//
//  LoginVC.swift
//  Login
//
//  Created by Rahmannur Rizki Syahputra on 14/11/23.
//

import Foundation
import UIKit
import Component
import CommonExtension
import Utility

public class LoginVC: UIViewController {
	
	private lazy var welcomeTitleLbl: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = .systemFont(ofSize: 22, weight: .bold)
		lbl.text = "Hai, Selamat Datang"
		lbl.textColor = Color.primaryBlueColor.instance()
		return lbl
	}()
	
	private lazy var welcomeSubtitleLbl: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = .systemFont(ofSize: 13, weight: .regular)
		lbl.text = "Silahkan login untuk melanjutkan"
		lbl.textColor = Color.primaryBlueColor.instance()
		return lbl
	}()
	
	private lazy var dashboardImageView: UIImageView = {
		let imgView = UIImageView()
		imgView.translatesAutoresizingMaskIntoConstraints = false
		imgView.image = UIImage.init(named: "ic_dashboard", bundle: Constant.Bundle.component)
		imgView.contentMode = .scaleAspectFill
		imgView.layer.cornerRadius = 8
		imgView.clipsToBounds = true
		return imgView
	}()
	
	private lazy var emailTextField: TextfieldWithTitle = {
		let customTextfield = TextfieldWithTitle(title: "Email", placeholder: "Masukkan email anda")
		customTextfield.translatesAutoresizingMaskIntoConstraints = false
		return customTextfield
	}()
	
	private lazy var passwordTextField: TextfieldWithTitle = {
		let customTextfield = TextfieldWithTitle(title: "Password", placeholder: "Masukkan password anda")
		customTextfield.translatesAutoresizingMaskIntoConstraints = false
		return customTextfield
	}()
	
	private lazy var loginButton: SubmitButton = {
		let customBtn = SubmitButton(title: "Login", rightImage: UIImage(systemName: "arrow.right")!) {
			print("btn tapped")
		}
		customBtn.translatesAutoresizingMaskIntoConstraints = false
		return customBtn
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.spacing = 8
		stackView.axis = .vertical
		return stackView
	}()
	
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	private func setup() {
		
	}
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(welcomeTitleLbl)
		view.addSubview(welcomeSubtitleLbl)
		view.addSubview(dashboardImageView)
		view.addSubview(emailTextField)
		view.addSubview(passwordTextField)
		view.addSubview(loginButton)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			welcomeTitleLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			welcomeTitleLbl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			welcomeTitleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
			
			welcomeSubtitleLbl.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			welcomeSubtitleLbl.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			welcomeSubtitleLbl.topAnchor.constraint(equalTo: welcomeTitleLbl.bottomAnchor, constant: 8),
			
			dashboardImageView.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor, constant: 80),
			dashboardImageView.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			dashboardImageView.topAnchor.constraint(equalTo: welcomeSubtitleLbl.bottomAnchor, constant: 8),
			dashboardImageView.heightAnchor.constraint(equalToConstant: 200),
			
			emailTextField.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			emailTextField.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			emailTextField.topAnchor.constraint(equalTo: dashboardImageView.bottomAnchor, constant: 8),

			passwordTextField.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			passwordTextField.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
			
			loginButton.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			loginButton.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24)
		])
	}
}
