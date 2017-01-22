require "rails_helper"
require 'rspec/active_model/mocks'

RSpec.describe NominationMailer, :type => :mailer do
  describe 'confirmation_email' do
    #let(:user) { User.create( name: 'Lucas', email: 'lucas@email.com') }
    let(:nomination) {Nomination.create(nominating_point_of_contact_email: 'someone@test.com', nominee_first_name: 'Tester')}
    let(:info) { {:year => "2016", :title => "test"}}
    let(:info) {NominationType.create(year: 2016, title: 'test')}

    let(:mail) { NominationMailer.confirmation_email(nomination, info).deliver_now }
    #let(:user){ User.create(email: 'hi@hi.com') }

    it 'renders the subject' do
      expect(mail.subject).to eq("#{info.year} #{info.title} Form Submission")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([nomination.nominating_point_of_contact_email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@saic.com'])
    end

    it 'includes nominee_first_name' do
      expect(mail.body.encoded).to match(nomination.nominee_first_name)
    end

  end
end
