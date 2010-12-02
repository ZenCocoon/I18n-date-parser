require 'date'
require 'rubygems'
require 'i18n'

class Date
  LOCALIZED_FORMATS = {
    # 'MONTHS' => 'month_names',
    # 'DAYS' => 'day_names',
    # 'ABBR_MONTHS' => 'abbr_month_names',
    # 'ABBR_DAYS' => 'abbr_day_names'
    'MONTHS' => {"avril"=>4, "septembre"=>9, "juin"=>6, "mars"=>3, "février"=>2, "janvier"=>1, "novembre"=>11, "août"=>8, "octobre"=>10, "juillet"=>7, "décembre"=>12, "mai"=>5},
    'DAYS' => {"jeudi"=>3, "samedi"=>5, "dimanche"=>6, "mercredi"=>2, "mardi"=>1, "vendredi"=>4},
    'ABBR_MONTHS' => {"déc."=>12, "sept."=>9, "juil."=>7, "nov."=>11, "juin"=>6, "jan."=>1, "oct."=>10, "août"=>8, "fév."=>2, "mar."=>3, "mai"=>5, "avr."=>4},
    'ABBR_DAYS' => {"jeu"=>3, "mer"=>2, "dim"=>6, "mar"=>1, "sam"=>5, "ven"=>4}
  }
  
  def self.strptime(str='-4712-01-01T00:00:00+00:00', fmt='%FT%T%z', sg=ITALY)
    _localize_formats if I18n.locale.to_s != 'en'
    
    elem = _strptime(str, fmt)
    
    _restore_formats if I18n.locale.to_s != 'en'
    
    new_by_frags(elem, sg)
  end
  
  def self._localize_formats
    LOCALIZED_FORMATS.each do |type, key|
      # if I18n.t("date.formats.#{key}").is_a?(Array)
        # hash = {}
        # I18n.t("date.formats.#{key}").each_with_index do |name, index|
          # hash[name] = index if index > 0
        # end
      
        @orig_const ||= {}
        @orig_const[type] = eval("Format::#{type}")
        # Format.localize_format(type, hash)
        Format.localize_format(type, key)
      
        # puts eval("Format::#{type}").inspect
      # end
    end
  end
  
  def self._restore_formats
    if @orig_const
      LOCALIZED_FORMATS.each do |type, key|
        if @orig_const[type]
          Format.localize_format(type, @orig_const[type])
          @orig_const[type] = nil
        end
      end
    end
  end

    
  module Format
    def self.localize_format(type, value)
      const_set(:"#{type}", value)
    end
  end
end
