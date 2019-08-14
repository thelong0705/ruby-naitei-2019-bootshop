require "rails_helper"

feature "User signs up" do
  before :each do
    visit '/users/sign_up'
    fill_in 'user[name]', with: "Name"
    find("#new_user").fill_in "user_email", with: "email@gmail.com"
    find("#new_user").fill_in "user_password", with: "password"
    find("#new_user").fill_in "user_password_confirmation", with: "password"
  end

  it "queues up a confirmation email job" do
    ActiveJob::Base.queue_adapter = :test

    expect { click_button 'Sign up' }.to \
      have_enqueued_job(ActionMailer::DeliveryJob)
  end
end
