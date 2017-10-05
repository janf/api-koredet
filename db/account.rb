account = Account.Create({ account_name: 'Star Wars', active: 1})

user_account = UserAccount.Create({account_id: :account.id, user_id: 9, account_admin: 1})
