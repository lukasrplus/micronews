# require 'spec_helper'

# describe "Static pages" do

#   subject { page }

#   describe "Home page" do
#     before { visit root_path }

#     it { should have_content('Micronews') }
#     it { should have_title(full_title('')) }
#     it { should_not have_title('| Home') }
#   end

#   describe "Help page" do
#     before { visit help_path }

#     it { should have_content('Help') }
#     it { should have_title(full_title('Help')) }
#   end

#   describe "About page" do
#     before { visit about_path }

#     it { should have_content('About') }
#     it { should have_title(full_title('About Us')) }
#   end

#   describe "Contact page" do
#     before { visit contact_path }

#     it { should have_selector('h1', text: 'Contact') }
#     it { should have_title(full_title('Contact')) }
#   end
# end


# HHHHHHHHHHHHHHHHHHHHHH


require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1') }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Micronews by Nordspitz Labs' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path}
    let(:heading) {'Help'}
    let(:page_title) {'Help'}

    it_should_behave_like "all static pages"
    it { should have_title('| Help') }
  end

  describe "About page" do
    before { visit about_path}
    let(:heading) {'About'}
    let(:page_title) {'About'}

    it_should_behave_like "all static pages"
    it { should have_title('| About') }
  end

  describe "Contact page" do
    before { visit contact_path}
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}

    it_should_behave_like "all static pages"
    it { should have_title('| Contact') }
  end

    it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))

    # New Capaybara Syntax:
    # page.should have_selector('title', :text => full_title('Sign up'))


  end
end
