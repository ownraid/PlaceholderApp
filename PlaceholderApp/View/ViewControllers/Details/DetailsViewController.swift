//
//  DetailsViewController.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    let viewModel = DetailsViewModel()
    var detailsType: DetailsType!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        bindViewModel()
        viewModel.loadDetails(for: detailsType)
        // Do any additional setup after loading the view.
    }
    
    func setupTitle() {
        switch detailsType {
            case .post: title = "Post Details"
            case .todo: title = "Todo Details"
            case .user(let user): title = user.name ?? "User"
            case .none: title = "none"
        }
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        // Post cell register
        tableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostTableViewCell.identifier)
        //Todo cell register
        tableView.register(UINib(nibName: TodoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TodoTableViewCell.identifier)
        // User Contact cell register
        tableView.register(UINib(nibName: UserContactTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserContactTableViewCell.identifier)
        // User Address cell register
        tableView.register(UINib(nibName: UserAddressTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserAddressTableViewCell.identifier)
        // User Company cell register
        tableView.register(UINib(nibName: UserCompanyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserCompanyTableViewCell.identifier)
        // Comment cell register
        tableView.register(UINib(nibName: CommentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    func bindViewModel() {
            
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async { self?.tableView.reloadData()}
        }
            
        viewModel.onError = { [weak self] error in
            var errorMessage = ""
            switch error {
            case .noInternet: errorMessage = "No Internet Connection"
            case .decodingFailed: errorMessage = "Failed Loading Data"
            case .unknown: errorMessage = "Unknown Error"
            }
            
            DispatchQueue.main.async {
                self?.showErrorAlert(message: errorMessage)
            }
        }
    }
    
    private func showErrorAlert(message: String) {
            
            let alert = UIAlertController(title: "Error Occurred", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default ))
            present(alert, animated: true)
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {

        switch detailsType {
            case .user: return 3
            default:return 1
        }
    }
    
    func tableView(
            _ tableView: UITableView,
            numberOfRowsInSection section: Int
        ) -> Int {
        switch detailsType {
            case .post: return 1 + viewModel.comments.count
            case .todo: return 1
            case .user: return 1
            case .none: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if case .user = detailsType {
            switch section{
            case 0 : return "Contact"
            case 1 : return "Address"
            case 2 : return "Company"
            default:
                return nil
            }
        }
        else{
            return nil
        }
    }
    
    func tableView(
            _ tableView: UITableView,
            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        switch detailsType {
        case .post:
            
            if indexPath.row == 0 {
                
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: PostTableViewCell.identifier,
                    for: indexPath
                ) as? PostTableViewCell else {
                    
                    return UITableViewCell()
                }
                
                if let post = viewModel.post {
                    cell.configure(with: post)
                }
                
                return cell
            }
            
            let commentIndex = indexPath.row - 1
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CommentTableViewCell.identifier,
                for: indexPath
            ) as? CommentTableViewCell else {
                
                return UITableViewCell()
            }
            
            let comment = viewModel.comments[commentIndex]
            
            cell.configure(with: comment)
            
            return cell
            
            
        case .todo:
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoTableViewCell.identifier,
                for: indexPath
            ) as? TodoTableViewCell else {
                
                return UITableViewCell()
            }
            
            if let todo = viewModel.todo {
                cell.configure(with: todo)
            }
            
            return cell
            
            
        case .user:
            
            switch indexPath.section{
            case 0 :
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: UserContactTableViewCell.identifier,
                    for: indexPath
                ) as? UserContactTableViewCell else {
                    
                    return UITableViewCell()
                }
                
                if let user = viewModel.user {
                    cell.configure(with: user)
                }
                
                return cell
                
            case 1 :
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: UserAddressTableViewCell.identifier,
                    for: indexPath
                ) as? UserAddressTableViewCell else {
                    
                    return UITableViewCell()
                }
                
                if let user = viewModel.user {
                    cell.configure(with: user)
                }
                
                return cell
                
            case 2 :
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: UserCompanyTableViewCell.identifier,
                    for: indexPath
                ) as? UserCompanyTableViewCell else {
                    
                    return UITableViewCell()
                }
                
                if let user = viewModel.user {
                    cell.configure(with: user)
                }
                
                return cell
                
            default:
                return UITableViewCell()
                
            }
            
        case .none:
            return UITableViewCell()
        }
    }
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
