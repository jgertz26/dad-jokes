require 'rails_helper'

describe Joke do

  it { should validate_presence_of(:setup) }
  it { should validate_presence_of(:punchline) }

  it { should have_valid(:setup).when ("bogus" * 10) }
  it { should_not have_valid(:setup).when ("bogus" * 60) }
end
