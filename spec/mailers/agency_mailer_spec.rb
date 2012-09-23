require "spec_helper"

describe AgencyMailer do
  describe "reservation_confirmation" do
    let(:mail) { AgencyMailer.reservation_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Reservation confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
