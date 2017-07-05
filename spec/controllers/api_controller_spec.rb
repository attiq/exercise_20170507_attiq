require "rails_helper"

RSpec.describe ApiController, :type => :controller do

  describe "POST #create" do

    it "Punlish a new Group Event" do
      params = FactoryGirl.attributes_for(:group_event, is_published: true, is_draft: false)
      expect { GroupEvent.create(params) }.to change { GroupEvent.count }.by(1)
    end

    it "Draft a New Group Event" do
      params = FactoryGirl.attributes_for(:group_event, is_published: false, is_draft: true)
      expect { GroupEvent.create(params) }.to change { GroupEvent.count }.by(1)
    end

  end

  describe "PUT #update/:id" do

    let(:params) do
      {:name => 'Edited Firt Event'}
    end

    it "Modify an Existing Group Event" do
      @event = FactoryGirl.create(:group_event, is_published: true, is_draft: false)
      @event.update_attributes(params)
      @event.reload
      @event.name.should eql params[:name]
    end

  end

  describe "DELETE #destroy/:id" do

    let(:params) do
      {:is_archived => true}
    end

    it "Remove an Existing Group Event" do
      @event = FactoryGirl.create(:group_event, is_published: true, is_draft: false)
      @event.update_attributes(params)
      @event.reload
      @event.is_archived.should eql true
    end

  end

end