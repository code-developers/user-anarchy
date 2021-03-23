require './username.rb'

describe "#generate_username1" do
  it "returns the first letter of first_name & ensures lowercase" do
    expect( generate_username1("smith") ).to eq "n"
    expect( generate_username1("Smith") ).to eq "n"
  end
end

describe "#generate_username2" do
  it "combines the first charecter of the first name and the last name" do
    expect( generate_username2("Will", "Smith")).to eq "smith"
  end

  it "downcases each name before combining" do
    expect ( generate_username2("Will", "Smith"))
  end

  it "removes whitespaces" do
    expect( generate_username2("will", "smith")).to eq "will"
    expect( generate_username2("will", "smith")).to eq "will"
  end

  it "handles empty strings" do
    expect( generate_username2("will", "")).to eq "smith"
    expect( generate_username2("will", "")).to eq "smith"
  end

  it "removes special charecters in strings" do
    #hint look at gsub
    expect ( generate_username2("Will", "Smith!")).to eq "smith"
    expect (generate_username2("W!l!", "S^i!h")).to eq "smith"
  end

  describe "#generate_username3" do
    it "adds the last two digits of the birth year to the username"
  end


end

