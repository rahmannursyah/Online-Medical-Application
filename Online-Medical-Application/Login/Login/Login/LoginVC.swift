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

protocol LoginDisplayLogic: AnyObject {
	func didSuccessLogin()
	func didFailedLogin(errorMsg: String)
}

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
	
	private lazy var passwordTextField: TextfieldTitleWithAttribute = {
		let customTextfield = TextfieldTitleWithAttribute(title: "Password", placeholder: "Masukkan password anda", rightImg: UIImage(systemName: "eye.fill")!, rightTitle: "Lupa Password anda ?")
		customTextfield.translatesAutoresizingMaskIntoConstraints = false
		return customTextfield
	}()
	
	private lazy var loginButton: SubmitButton = {
		let customBtn = SubmitButton(title: "Login", rightImage: UIImage(systemName: "arrow.right")!) { [weak self] in
			self?.vm?.login(email: self?.emailTextField.text ?? "", password: self?.passwordTextField.text ?? "")
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
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	private lazy var alertDialog: BasicAlertDialog = {
		let dialog = BasicAlertDialog()
		dialog.translatesAutoresizingMaskIntoConstraints = false
		dialog.isHidden = true
		return dialog
	}()
	
	var vm: LoginBusinessLogic?
	var router: LoginRouterLogic?
	
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	private func setup() {
		let viewController = self
		let loginVM = LoginVM()
		let loginRouter = LoginRouter()
		let loginWorker = LoginWorker()
		viewController.vm = loginVM
		viewController.router = loginRouter
		loginVM.viewController = viewController
		loginVM.worker = loginWorker
		loginRouter.viewController = viewController
		loginWorker.vm = loginVM
	}
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(scrollView)
		scrollView.addSubview(welcomeTitleLbl)
		scrollView.addSubview(welcomeSubtitleLbl)
		scrollView.addSubview(dashboardImageView)
		scrollView.addSubview(emailTextField)
		scrollView.addSubview(passwordTextField)
		scrollView.addSubview(loginButton)
		scrollView.addSubview(alertDialog)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
			scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
			scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			welcomeTitleLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			welcomeTitleLbl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			welcomeTitleLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
			
			welcomeSubtitleLbl.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			welcomeSubtitleLbl.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			welcomeSubtitleLbl.topAnchor.constraint(equalTo: welcomeTitleLbl.bottomAnchor, constant: 8),
			
			dashboardImageView.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor, constant: 80),
			dashboardImageView.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			dashboardImageView.topAnchor.constraint(equalTo: welcomeSubtitleLbl.bottomAnchor, constant: 16),
			dashboardImageView.heightAnchor.constraint(equalToConstant: 200),
			
			emailTextField.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			emailTextField.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			emailTextField.topAnchor.constraint(equalTo: dashboardImageView.bottomAnchor, constant: 16),

			passwordTextField.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			passwordTextField.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
			
			loginButton.leadingAnchor.constraint(equalTo: welcomeTitleLbl.leadingAnchor),
			loginButton.trailingAnchor.constraint(equalTo: welcomeTitleLbl.trailingAnchor),
			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
			
			alertDialog.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			alertDialog.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}
}

extension LoginVC: LoginDisplayLogic {
	
	func didSuccessLogin() {
		DispatchQueue.main.async { [weak self] in
			self?.router?.routeToHomeScreen()
		}
	}
	
	func didFailedLogin(errorMsg: String) {
		DispatchQueue.main.async { [weak self] in
			self?.alertDialog.isHidden = false
			self?.alertDialog.showAlertDialog(message: errorMsg)
		}
	}
}
