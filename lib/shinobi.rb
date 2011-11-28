require "multi_json"
require "shinobi/version"

module Shinobi
  NINJA = File.expand_path("../../etc/ninja.js", __FILE__)
  
  def self.parse
    MultiJson.decode(`phantomjs #{NINJA}`).inject({}) do |memo, obj|
      memo.merge(obj[0] => {:host => obj[1], :driver => obj[2], :location => obj[3], :double_sided => obj[4] == "Yes"})
    end
  end
  
  def self.select_driver(driver_name)
    case driver_name
    when "HP LaserJet 9050 PS", "HP LaserJet 9050 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_9050-ps.ppd"
    when "HP Color LaserJet 4700 PS"
      "-m hplip:0/ppd/hplip/HP/hp-color_laserjet_4700-ps.ppd"
    when "HP Color LaserJet 5500 PS"
      "-m hplip:0/ppd/hplip/HP/hp-color_laserjet_5500-ps.ppd"
    when "HP LaserJet 8150 Series PS", "HP LaserJet 8150 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_8150_mfp-ps.ppd"
    when "HP LaserJet P4015", "HP LaserJet 4015 PS"
      "-m drv:///hpijs.drv/hp-laserjet_p4015-hpijs.ppd"
    when "HP LaserJet 4000 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4000_series-ps.ppd"
    when "HP LaserJet 4350 PS", "HP LaserJet 4350 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4350-ps.ppd"
    when "HP LaserJet 4200 Series PS", "HP LaserJet 4200 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4200-ps.ppd"
    when "HP Color LaserJet 4650 PS"
      "-m hplip:0/ppd/hplip/HP/hp-color_laserjet_4650-ps.ppd"
    when "HP LaserJet 4010 series/4510 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_p4010_series-ps.ppd"
    when "HP LaserJet 4300 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4300-ps.ppd"
    when "HP LaserJet 5100 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_5100_series-ps.ppd"
    when "HP LaserJet 5200 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_5200-ps.ppd"
    when "HP LaserJet 4050 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4050_series-ps.ppd"
    when "HP LaserJet P4515 Series PS"
      "-m drv:///hpijs.drv/hp-laserjet_p4515-hpijs.ppd"
    when "HP LaserJet 8100 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_8100_mfp-ps.ppd"
    when "HP LaserJet 4250 PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_4250-ps.ppd"
    when "HP LaserJet 9000 Series PS"
      "-m hplip:0/ppd/hplip/HP/hp-laserjet_9000_series-ps.ppd"
    else
      raise "Could not find driver for: #{driver_name}"
    end
  end
  
  def self.install(slug, data)
    puts "Adding #{slug}"
    # `lpadmin -p #{slug} -E -v lpd://#{data[:host]}/public #{select_driver(data[:driver])} -L "#{data[:location]}"`
  end
  
  def self.uninstall(slug)
    puts "Deleting #{slug}"
    # `lpadmin -x #{slug}`
  end
end
