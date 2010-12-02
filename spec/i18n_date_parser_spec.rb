require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "I18n Date Parser" do
  before do
    I18n.backend.store_translations(:'fr', :date => { :formats => {
      :day_names => ['lundi', 'mardi', 'mercredi', 'jeudi',
                     'vendredi', 'samedi', 'dimanche'],
      :abbr_day_names => ['lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'],
      :month_names => ['', 'janvier', 'février', 'mars', 'avril',
                       'mai', 'juin', 'juillet', 'août', 'septembre',
                       'octobre', 'novembre', 'décembre'],
      :abbr_month_names => ['', 'jan.', 'fév.', 'mar.', 'avr.', 'mai',
                            'juin', 'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'] } })
    # I18n.backend.store_translations(:'fr', :date => { :formats => {
    #   :day_names => ['lundi', 'mardi', 'mercredi', 'jeudi',
    #                  'vendredi', 'samedi', 'dimanche'],
    #   :abbr_day_names => ['lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'],
    #   :month_names => ['', 'janvier', 'février', 'mars', 'avril',
    #                    'mai', 'juin', 'juillet', 'août', 'septembre',
    #                    'octobre', 'novembre', 'décembre'],
    #   :abbr_month_names => ['', 'jan.', 'fev.', 'mar.', 'avr.', 'mai',
    #                         'juin', 'juil.', 'aout', 'sept.', 'oct.', 'nov.', 'dec.'] } })
  end
  
  it "should parse English date" do
    Date.strptime("Mon 18 Apr 2011, 10:00 am", "%a %d %b %Y, %I:%M %p").should == Date.parse('2011-04-18')
  end
  
  it "asdf" do
puts    Date.strptime("9 Feb 2011", "%d %b %Y")
  end

  it "should parse French localized date" do
    I18n.locale = :fr
puts    Date.strptime("18 Avr. 2011", "%d %b %Y")
  end

  it "should test" do
puts    Date.strptime("9 Avril 2011", "%d %b %Y")
    
    # puts Date.strptime("Lun 18 Avr. 2011, 10h00", "%a %d %b %Y, %Hh%M")
  end
  # 
  # it "should be equal when French or English" do
  #   date_en = Date.strptime("Lun 18 Avr. 2011, 10h00", "%a %d %b %Y, %Hh%M")
  #   I18n.locale = :fr
  #   Date.strptime("Mon 18 Apr 2011, 10:00 am", "%a %d %b %Y, %I:%M %p").should == date_en
  # end
  # 
  # it "should parse English output"
  # 
  # it "should parse French output"
end