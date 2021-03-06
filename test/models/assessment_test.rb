require 'test_helper'

class AssessmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  before do
    @test = Skill.create(name: "Testing")
    @user = User.create(name: "Ryan")
    @assessment = Assessment.create(name: "Practicing")
    @user.skills << @test
    @test.assessments << @assessment
  end
  it "It belongs to a User" do
    expect(@user.assessments) to.include(@assessment)
  end

  describe "It belongs to a Skill" do
    expect(@test.assessments) to.include(@assessment)
  end


end
