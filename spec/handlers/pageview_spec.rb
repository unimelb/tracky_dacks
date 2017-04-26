require "spec_helper"

RSpec.describe TrackyDacks::Handlers::Pageview do
  describe "#call" do
    subject { described_class.new(tracker).call(params) }

    let(:tracker) {
      spy("tracker")
    }

    let(:params) {
      {
        "target" => "https://pursuit.unimelb.edu.au/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
        "location" => "https://pursuit.unimelb.edu.au/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
        "title" => "Beyond Growth: adding wellbeing to the balance sheet",
        "path" => "/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
        "campaign_name" => "Pursuit republishing",
        "campaign_medium" => "republish",
        "campaign_content" => "Beyond Growth: adding wellbeing to the balance sheet",
        "referrer" => "http://www.mamamia.com.au/technique-to-make-baby-wee/",
        "campaign_source" => "www.mamamia.com.au"
      }
    }

    context "when params contains 'campaign_source'" do
      it "calls tracker with the correct parameters" do
        subject

        expect(tracker).to have_received(:pageview).with(
          document_location: "https://pursuit.unimelb.edu.au/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
          document_title: "Beyond Growth: adding wellbeing to the balance sheet",
          document_path: "/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
          referrer: "http://www.mamamia.com.au/technique-to-make-baby-wee/",
          campaign_name: "Pursuit republishing",
          campaign_source: "mamamia.com.au",
          campaign_medium: "republish",
          campaign_keyword: nil,
          campaign_content: "Beyond Growth: adding wellbeing to the balance sheet",
          campaign_id: nil
        ).once
      end
    end

    context "when params do not contain 'campaign_source'" do
      before do
        params.delete("campaign_source")
      end

      it "calls tracker with the correct parameters" do
        subject

        expect(tracker).to have_received(:pageview).with(
          document_location: "https://pursuit.unimelb.edu.au/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
          document_title: "Beyond Growth: adding wellbeing to the balance sheet",
          document_path: "/articles/beyond-growth-adding-wellbeing-to-the-balance-sheet",
          referrer: "http://www.mamamia.com.au/technique-to-make-baby-wee/",
          campaign_name: "Pursuit republishing",
          campaign_source: "mamamia.com.au",
          campaign_medium: "republish",
          campaign_keyword: nil,
          campaign_content: "Beyond Growth: adding wellbeing to the balance sheet",
          campaign_id: nil
        ).once
      end
    end
  end
end
