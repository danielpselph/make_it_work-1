require 'rails_helper'

RSpec.describe "projects show page" do
  context "as a visitor" do
    before(:each) do
      
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
  
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @boardfit = @recycled_material_challenge.projects.create(name: "@", material: "Cardboard Boxes")
  
      @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 14)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
  
  
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
      ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    end

    it "can see projects name and material and theme of challenge it belongs to" do

      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content(@boardfit.name) 
      expect(page).to have_content(@boardfit.material) 
      expect(page).to have_content(@recycled_material_challenge.theme) 
    end

    it "can see a count of numbner of contestants on the project" do
      
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Number of Contestants: 2") 
    end
    
    it "can show the average years of experiences for the contestants" do
      
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("Contestants Average Years of Experience: 13") 
    end
  end
end
# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project