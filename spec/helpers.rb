def mandrill_emails_dummy_data
  EmailData.create(address: "barney@lostmy.name",email_type: "Shipment",event: "sent",timestamp: 1432820696)
  EmailData.create(address: "tom@lostmy.name",email_type: "UserConfirmation",event: "click",timestamp: 1432820702)
  EmailData.create(address: "vitor@lostmy.name",email_type: "Shipment",event: "open",timestamp: 1432820704)
end
