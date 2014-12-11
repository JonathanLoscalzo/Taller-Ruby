require 'minitest/autorun'
require_relative '../agenda.rb'

$data = <<EOS
Fernando, asda@asdd.com, 1980/10/1, 23233, algo
Fernando, asda@asdd.com, 1980/10/1, 43434, algo
EOS
$data_illformed = 'asdasda'

class TestContactList < MiniTest::Unit::TestCase
  def setup
    @contacts = ContactList.new
  end

  def test_load_from_file
    File.stub(:open, StringIO.new($data)) do
      @contacts.load_from_file('file.csv')
    end
    assert_equal 2, @contacts.contacts.size
  end

  def test_load_from_illformed_file
    assert_raises(IOError) do
      File.stub(:open, StringIO.new($data_illformed)) do
        @contacts.load_from_file('file.csv')
      end
    end
  end

  def test_save_empty
    output = StringIO.new
    File.stub(:open, output) do
      @contacts.save('file.csv')
    end
    assert_equal '', output.string
  end

  def test_save
    output = StringIO.new
    @contacts << Contact.new('f', 'f@f.com', {:birth_date => '1980/10/1', :phone => '4654', :address =>'gfg'})
    @contacts << Contact.new('f', 'f@f.com', {:birth_date => '1980/10/1', :phone => '4654', :address =>'gfg'})
    File.stub(:open, output) do
      @contacts.save('file.csv')
    end
    assert_equal 2, output.string.count("\n")
  end

end
