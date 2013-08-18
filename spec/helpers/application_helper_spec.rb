require 'spec_helper'

describe ApplicationHelper do
  describe '#flash_message_class' do
    subject { helper.flash_message_class(type) }

    let(:type) { 'foo' }

    it 'returns "info"' do
      expect(subject).to eql('info')
    end

    context 'when the flash is an alert' do
      let(:type) { :alert }

      it 'returns "error"' do
        expect(subject).to eql('error')
      end
    end

    context 'when the flash is a notice' do
      let(:type) { :notice }

      it 'returns "success"' do
        expect(subject).to eql('success')
      end
    end
  end

  describe "#title" do
    it "returns the content for the title" do
      helper.stub(content_for: "Foo")

      title = helper.title

      expect(title).to eql "Foo | Radfords of Somerford"
    end

    context "when there is no content for the title" do
      it "returns the stored title" do
        helper.instance_variable_set(:@title, "Bar")

        title = helper.title

        expect(title).to eql "Bar | Radfords of Somerford"
      end
    end
  end

  describe "#navbar" do
    it "renders the navbar partial" do
      helper.stub(signed_in?: true)

      expect(helper).to receive :render

      helper.navbar
    end

    context "when the user is not signed in" do
      it "returns nil" do
        helper.stub(signed_in?: false)

        navbar = helper.navbar

        expect(navbar).to be_nil
      end
    end
  end

  describe "#nav_class" do
    it "returns 'active'" do
      controller.stub(controller_name: "foo")

      nav_class = helper.nav_class("foo")

      expect(nav_class).to eql "active"
    end

    context "when the name doesn't match the current controller" do
      it "returns nil" do
        controller.stub(controller_name: "foo")

        nav_class = helper.nav_class("bar")

        expect(nav_class).to be_nil
      end
    end
  end
end
