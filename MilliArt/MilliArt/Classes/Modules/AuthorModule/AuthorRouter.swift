//
//  AuthorRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import UIKit
import MessageUI

final class AuthorRouter: NSObject, MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension AuthorRouter: AuthorRouterInput {
    func openAbout(with view: AuthorViewInput?, author: FullAuthor?) {
        guard let view = view as? UIViewController, let author = author else { return }
        let itemDesc = AuthorAboutContainer.assemble(with: AuthorAboutContext(author: author))
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
    
    func openMail(with view: AuthorViewInput?, info: Mail) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([info.to])
            mail.setSubject(info.subject)
            mail.setMessageBody("<p>\(info.body)</p>", isHTML: true)
            guard let view = view as? UIViewController else { return }
            view.present(mail, animated: true)
        }
    }
    
    func itemSelected(with view: AuthorViewInput?, and id: Int) {
        guard let view = view as? UIViewController else { return }
        let itemDesc = ItemDescContainer.assemble(with: ItemDescContext(id: id))
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
}
