require 'rails_helper'
describe "Schedule" do
  let(:whenever) { Whenever::JobList.new(file: File.join(Rails.root, "config", "schedule.rb").to_s) }
  it "mail_checkが毎日実行されるか" do
    expect(whenever).to schedule("Matter.mail_check").every('11 0 * * *') 
  end
end
