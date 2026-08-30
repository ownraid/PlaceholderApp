//
//  DataViewController.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = DataViewModel()
    var dataType: DataType!

    override func viewDidLoad() {
        super.viewDidLoad()
        switch dataType {

        case .posts:
            title = "Posts"

        case .users:
            title = "Users"

        case .todos:
            title = "Todos"

        case .none:
            title = ""
        }
        navigationController?.navigationBar.isHidden = false
        setupTableView()
        bindViewModel()
        viewModel.fetchData(for: dataType)
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {

        tableView.delegate = self
        tableView.dataSource = self
        //post cell
        tableView.register(
            UINib(nibName: PostTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostTableViewCell.identifier
        )
        //user cell
        tableView.register(
            UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier
        )
        //todo cell
        tableView.register(
            UINib(nibName: TodoDataTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TodoDataTableViewCell.identifier
        )
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch dataType {

        case .posts:
            return viewModel.posts.count

        case .users:
            return viewModel.users.count

        case .todos:
            return viewModel.todos.count

        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch dataType {
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostTableViewCell.identifier,
                for: indexPath
            ) as? PostTableViewCell else {return UITableViewCell()}

            let post = viewModel.posts[indexPath.row]

            cell.configure(with: post)

            return cell

        case .users:

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserTableViewCell.identifier,
                for: indexPath
            ) as? UserTableViewCell else {

                return UITableViewCell()
            }

            let user = viewModel.users[indexPath.row]
            cell.configure(with: user)

            return cell

        case .todos:

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoDataTableViewCell.identifier,
                for: indexPath
            ) as? TodoDataTableViewCell else {

                return UITableViewCell()
            }

            let todo = viewModel.todos[indexPath.row]
            cell.configure(with: todo)

            return cell
            
        
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        let detailsVC = DetailsViewController()
        
        switch dataType {
            
        case .posts:
            
            let post = viewModel.posts[indexPath.row]
            
            detailsVC.detailsType = .post(post)
            
        case .todos:
            
            let todo = viewModel.todos[indexPath.row]
            
            detailsVC.detailsType = .todo(todo)
            
        case .users:
            
            let user = viewModel.users[indexPath.row]
            
            detailsVC.detailsType = .user(user)
            
        case .none:
            return
        }
        
        navigationController?.pushViewController(detailsVC, animated: true )
    }
    
    func bindViewModel() {

        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {self?.tableView.reloadData()}
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
