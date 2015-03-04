require 'vigilem/assembly'

describe Vigilem::Assembly do
  
  Stat = Vigilem::Core::Stat
  
  let(:avail_stat) { double('avail_stat', :available? => true, :install => 'avail-stat installed') }
  
  let(:unavail_stat) { double('unavail_stat', :available? => false, :install => 'unavail-stat installed') }
  
  before(:all) do
    # ensure clean env
    Stat.all.replace([])
  end
  
  after(:each) do
    Stat.all.replace([])
  end
  
  describe '::find_stat' do
    it %q<find's an #available? Stat> do
      Stat.all << avail_stat
      Stat.all << unavail_stat
      expect(described_class.find_stat).to eql(avail_stat)
    end
    
    it %q<return's nil when none #available?> do
      Stat.all << unavail_stat
      expect(described_class.find_stat).to be_nil
    end
  end
  
  describe '::install_handler' do
    it %q<find's and calls install on a Stat> do
      Stat.all << avail_stat
      Stat.all << unavail_stat
      expect(described_class.install_handler).to eql(avail_stat.install)
    end
  end
  
  describe '::install_handler!' do
    it %q<find's and calls install on a Stat> do
      Stat.all << unavail_stat
      expect { described_class.install_handler! }.to raise_error(Vigilem::Assembly::NoAvailableHandler)
    end
  end
  
  
  
end