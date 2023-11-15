//
//  HomeVC.swift
//  Home
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import UIKit
import Component
import CommonExtension
import Utility

protocol HomeDisplayLogic: AnyObject {
}

public class HomeVC: UIViewController, HomeDisplayLogic {
	
	private lazy var solusiKesehatanCardView: BasicCardView = {
		let cardView = BasicCardView(title: "Solusi, Kesehatan Anda", subtitle: "Update informasi seputar kesehatan semua bisa disini", buttonTitle: "Selengkapnya")
		cardView.translatesAutoresizingMaskIntoConstraints = false
		return cardView
	}()
	
	private lazy var layananKhususCardView: BasicCardView = {
		let cardView = BasicCardView(title: "Layanan Khusus", subtitle: "Test Covid 19, Cegah Corona Sedini Mungkin", buttonTitle: "Daftar Tes")
		cardView.translatesAutoresizingMaskIntoConstraints = false
		return cardView
	}()
	
	private lazy var trackPemeriksaanCardView: BasicCardView = {
		let cardView = BasicCardView(title: "Track Pemeriksaan", subtitle: "Kamu dapat mengecek progress pemeriksaanmu disini", buttonTitle: "Track")
		cardView.translatesAutoresizingMaskIntoConstraints = false
		return cardView
	}()
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	var vm: HomeBusinessLogic?
	var router: HomeRouterLogic?
	
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
		let homeVM = HomeVM()
		let homeRouter = HomeRouter()
		let homeWorker = HomeWorker()
		viewController.vm = homeVM
		viewController.router = homeRouter
		homeVM.viewController = viewController
		homeVM.worker = homeWorker
		homeRouter.viewController = viewController
		homeWorker.vm = homeVM
	}
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(scrollView)
		scrollView.addSubview(solusiKesehatanCardView)
		scrollView.addSubview(layananKhususCardView)
		scrollView.addSubview(trackPemeriksaanCardView)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
			scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
			scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			solusiKesehatanCardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			solusiKesehatanCardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			solusiKesehatanCardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
			
			layananKhususCardView.leadingAnchor.constraint(equalTo: solusiKesehatanCardView.leadingAnchor),
			layananKhususCardView.trailingAnchor.constraint(equalTo: solusiKesehatanCardView.trailingAnchor),
			layananKhususCardView.topAnchor.constraint(equalTo: solusiKesehatanCardView.bottomAnchor, constant: 100),
			
			trackPemeriksaanCardView.leadingAnchor.constraint(equalTo: solusiKesehatanCardView.leadingAnchor),
			trackPemeriksaanCardView.trailingAnchor.constraint(equalTo: solusiKesehatanCardView.trailingAnchor),
			trackPemeriksaanCardView.topAnchor.constraint(equalTo: layananKhususCardView.bottomAnchor, constant: 8),
		])
	}
}
