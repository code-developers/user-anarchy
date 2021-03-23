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
    it "adds the last two digits of the birth year to the username" do
      expect( generate_username3("andrew", "smith", 1945) ).to eq "asmit45"
      expect( generate_username3("andrew", "smith", 2000) ).to eq "asmit00"
      expect( generate_username3("andrew", "smith", 2001) ).to eq "asmit01"
    end
    it "only allows for a 4 digit year" do
      expect( generate_username3("andrew", "smith", 45) ).to eq nil
      expect( generate_username3("andrew", "smith", 123) ).to eq nil
      expect( generate_username3("andrew", "smith", 20111) ).to eq nil
    end
  end

  describe "#check_privilege" do
    let (:user_types) { ["user", "seller", "manager", "admin"]}

    it "returns the corresponding privilege prefix" do
      i = 0
      user_types.each_with_index do |utype, i|
        expect( check_privilege(i)).to eq utype
      end

      expect( check_privilege).to eq user_types[0]
    end
  end

  describe "#generate_username4" do
    it "prefixes the username with a user type based on privilege level" do
      expect( generate_username4("andrew", "smith", 1945, 1) ).to eq "seller-jdoe45"
      expect( generate_username4("andrew", "smith", 1945, 2) ).to eq "manager-jdoe45"
      expect( generate_username4("andrew", "smith", 1945, 3) ).to eq "admin-jdoe45"
    end
    it "does not prefix a user with a user type" do
      expect( generate_username4("andrew", "smith", 1945, 0) ).to eq "jdoe45"
    end
    it "assumes the type is a user if none is specified" do
      expect( generate_username4("andrew", "smith", 1945) ).to eq "jdoe45"
    end
  end

  describe "#generate_username5" do
    it "acts normally if there is no name conflict" do
      expect( generate_username5("andrew", "smith", 1945) ).to eq "asmith45"
    end
    it "ensures the uniquness of usernames" do
      expect( generate_username5("andrew", "smith", 1945) ).to eq "asmith45_1"
      expect( generate_username5("andrew", "smith", 1945) ).to eq "asmith45_2"
      expect( generate_username5("andrew", "smith", 1945) ).to eq "asmith45_3"
    end
  end

end

