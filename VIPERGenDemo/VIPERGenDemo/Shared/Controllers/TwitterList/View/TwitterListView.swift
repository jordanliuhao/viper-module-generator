//
//  TwitterListView.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import UIKit

class TwitterListView: TWViewController, TwitterListViewProtocol, UITableViewDataSource, UITableViewDelegate
{
    // MARK: - Styles
    private struct Styles
    {
        static let COLOR_NAVIGATION_BAR: UIColor = Stylesheet.COLOR_BLUE_LIGHT
        static let COLOR_NAVIGATION_ITEMS: UIColor = UIColor.whiteColor()
        static let FONT_LOGOUT_BUTTON: UIFont = UIFont.systemFontOfSize(15)
        static let COLOR_REFRESH_CONTROL_BACKGROUND: UIColor = UIColor.whiteColor()
        static let COLOR_REFRESH_CONTROL: UIColor = UIColor.lightGrayColor()
        static let FONT_REFRESH_CONTROL: UIFont = UIFont.systemFontOfSize(12)
    }
    
    
    // MARK: - Attributes
    
    var presenter: TwitterListPresenterProtocol?
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.registerClass(TweetCell.self, forCellReuseIdentifier: "tweetCell")
        tableView.allowsSelection = false
        return tableView
    }()
    lazy var refreshControl: UIRefreshControl = {
        var control: UIRefreshControl = UIRefreshControl()
        control.tintColor = Styles.COLOR_REFRESH_CONTROL
        control.backgroundColor = Styles.COLOR_REFRESH_CONTROL_BACKGROUND
        control.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshing tweets with #viper", comment: ""), attributes: [NSFontAttributeName: Styles.FONT_REFRESH_CONTROL, NSForegroundColorAttributeName: Styles.COLOR_REFRESH_CONTROL])
        return control
    }()
    
    // MARK - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupSubviews()
        self.setupNavigationBar()
        self.setupAutolayouts()
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.presenter?.viewDidLoad()
    }
    
    
    // MARK: - Subviews
    
    private func setupSubviews()
    {
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.addSubview(self.refreshControl)
        self.refreshControl.addTarget(self, action: Selector("userDidSelectRefresh:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    private func setupNavigationBar()
    {
        // Color
        self.navigationController?.navigationBar.barTintColor = Styles.COLOR_NAVIGATION_BAR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Styles.COLOR_NAVIGATION_ITEMS]
        
        // Compose Button
        let composeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: Selector("userDidSelectCompose:"))
        composeButton.tintColor = Styles.COLOR_NAVIGATION_ITEMS
        self.navigationItem.rightBarButtonItem = composeButton
        
        // Logout Button
        let logoutButton: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("logout", comment: "").firstLetterCapitalized(), style: UIBarButtonItemStyle.Done, target: self, action: Selector("userDidSelectLogout"))
        logoutButton.setTitleTextAttributes([NSFontAttributeName: Styles.FONT_LOGOUT_BUTTON], forState: UIControlState.Normal)
        logoutButton.tintColor = Styles.COLOR_NAVIGATION_ITEMS
        self.navigationItem.leftBarButtonItem = logoutButton
    }
    
    private func setupAutolayouts()
    {
        // TableView
        self.tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
    }
    
    
    // MARK: - User Actions
    
    func userDidSelectCompose(sender: AnyObject)
    {
        self.presenter?.composeTweet()
    }
    
    func userDidSelectLogout(sender: AnyObject)
    {
        self.presenter?.logout()
    }
    
    func userDidSelectRefresh(sender: AnyObject)
    {
        self.presenter?.refreshTweets()
    }
    
    
    // MARK: - TwitterListViewProtocol
    
    func setViewTitle(title: String)
    {
        self.title = title
    }
    
    func stopRefreshing()
    {
        self.refreshControl.endRefreshing()
    }
    
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.presenter!.numberOfTweets(inSection: section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var tweetCell: TweetCell = self.tableView.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as TweetCell
        tweetCell.userLabel.text = "@username"
        tweetCell.bodyLabel.text = "asdgas gas dgasdg asdgasdg adsga sdg asdg asdg asd ga dsgaasdgasdgasdgagsg asdgasdgadgas"
        tweetCell.dateLabel.text = "Monday"
        tweetCell.setNeedsUpdateConstraints()
        tweetCell.updateConstraintsIfNeeded()
        return tweetCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return self.presenter!.numberOfSections()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.presenter!.userDidSelectTweet(atIndexPath: indexPath)
    }
}