require_relative '../spec_helper'
feature 'User visits statistics page' do
  before(:each) do
    mandrill_emails_dummy_data
    visit '/'
  end

  scenario 'successfully' do
    expect(page).to have_css('h1', :text => 'Mandril Email Stats')
  end

  scenario 'total number of emails sent' do
    expect(page).to have_css('p', :text => 'total number of emails sent: 1')
  end

  scenario 'total number of emails opened' do
    expect(page).to have_css('p', :text => 'total number of emails opened: 1')
  end

  scenario 'total number of clicks' do
    expect(page).to have_css('p', :text => 'total number of clicks: 1')
  end

  scenario 'Email type Shipment' do
    expect(page).to have_css('h4', :text => 'Email type Shipment')
  end

  scenario 'open rate per email type' do
    expect(page).to have_css('p', :text => 'open rate: 50')
  end

  scenario 'click rate per email type' do
    expect(page).to have_css('p', :text => 'click rate: 0')
  end

  scenario 'Email type UserConfirmation' do
    expect(page).to have_css('h4', :text => 'Email type UserConfirmation')
  end

  scenario 'open rate per email type' do
    expect(page).to have_css('p', :text => 'open rate: 0')
  end

  scenario 'click rate per email type' do
    expect(page).to have_css('p', :text => 'click rate: 100')
  end

end
