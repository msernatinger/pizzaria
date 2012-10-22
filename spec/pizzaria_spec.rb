require File.expand_path('lib/pizzaria')

describe Pizzaria do

  it { should be_a Pizzaria }
  its(:orders) { should be_a Array }

  

end
