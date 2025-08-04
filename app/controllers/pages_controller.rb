class PagesController < ApplicationController
  allow_unauthenticated_access

  def index
  end

  def show
    if valid_page?
      set_wanda if params[:page].include?('wanda')
      if params[:page].include?('laura')
        render template: "pages/#{params[:page]}", layout:'laura'
      else
        render template: "pages/#{params[:page]}", layout:'wanda'
      end
    else
      # render file: "public/404.html", status: :not_found
      render :show
    end
  end

  def wanda
    redirect_to "/pages/wanda/home"
    # render template: "pages/wanda/home", layout:'wanda'
  end

  def tom
    redirect_to "/pages/tom/index"
  end
  def laura
    redirect_to "/pages/laura/home"
  end


  private
  def valid_page?
    template_exists?("pages/#{params[:page]}")
  end



  def set_wanda
    @pages = 
    {"1"=>{:attendees=>["View"]},                      
     "10"=>{:attendees=>["Beverley", "Paul", "Leslie", "Sue", "John"]},
     "100"=>{:attendees=>["View"]},                    
     "101"=>{:attendees=>["View"]},                    
     "102"=>{:attendees=>["View"]},                    
     "103"=>{:attendees=>["View"]},                    
     "104"=>{:attendees=>["Wanda", "around", "19"]},   
     "105"=>{:attendees=>["View"]},                    
     "106"=>{:attendees=>["View"]},                    
     "107"=>{:attendees=>["View"]},                    
     "108"=>{:attendees=>["View"]},                    
     "109"=>{:attendees=>["Charlie", "HelenH", "H"]},  
     "11"=>{:attendees=>["Mary", "Charlie", "HelenH", "H"]},
     "12"=>{:attendees=>["Sonia", "Percy", "Marie"]},  
     "13"=>{:attendees=>["Adrienne", "Mary", "Charlie", "HelenH", "H"]},
     "14"=>{:attendees=>["Brendon", "Chris", "Wanda", "Cyndee", "Steven"]},
     "15"=>{:attendees=>["View"]},
     "16"=>{:attendees=>["View"]},
     "17"=>{:attendees=>["Adrienne", "Mary", "Charlie", "Helen"]},
     "18"=>{:attendees=>["MaryJo", "Sonia"]},
     "19"=>{:attendees=>["Wanda", "Dolly"]},
     "2"=>{:attendees=>["View"]},
     "20"=>{:attendees=>["Bernadette", "Vicki", "Cyndee"]},
     "21"=>{:attendees=>["Wanda", "Dolly"]},
     "22"=>{:attendees=>["Cyndee", "Marie"]},
     "23"=>{:attendees=>["Steven", "Wanda", "Cyndee", "Adrienne", "Charlie"]},
     "24"=>{:attendees=>["Bernadette", "Vicki", "Paul", "Steven"]},
     "25"=>{:attendees=>["Chris", "Dolly", "Steven", "Wanda"]},
     "26"=>{:attendees=>["Cyndee", "Dolly", "Paul", "Steven", "Wanda"]},
     "27"=>{:attendees=>["View"]},
     "28"=>{:attendees=>["Mary", "Charlie"]},
     "29"=>{:attendees=>["Paul", "Cyndee"]},
     "3"=>{:attendees=>["The", "View"]},
     "30"=>{:attendees=>["View"]},
     "31"=>{:attendees=>["Paul", "Cyndee"]},
     "32"=>{:attendees=>["Toni", "Betty", "Wanda"]},
     "33"=>{:attendees=>["Joe", "Janet", "Dee", "Wanda"]},
     "34"=>{:attendees=>["View"]},
     "35"=>{:attendees=>["Wanda", "Bernadette"]},
     "36"=>{:attendees=>["Wanda", "Bernadette"]},
     "37"=>{:attendees=>["View"]},
     "38"=>{:attendees=>["View"]},
     "39"=>{:attendees=>["View"]},
     "4"=>{:attendees=>["View"]},
     "40"=>{:attendees=>["Sonia", "Marie", "Brendon", "Chris"]},
     "41"=>{:attendees=>["Wanda", "Percy"]},
     "42"=>{:attendees=>["Wanda", "Mary", "Charlie"]},
     "43"=>{:attendees=>["Wanda", "Helen"]},
     "44"=>{:attendees=>["Steven", "Mary"]},
     "45"=>{:attendees=>["Brendon", "Steven", "Cyndee", "Chris", "Wanda"]},
     "46"=>{:attendees=>["Percy", "MaryJo"]},
     "47"=>{:attendees=>["Getting", "ready", "for", "guests"]},
     "48"=>{:attendees=>["Marie", "MaryJo", "Sonia", "Percy"]},
     "49"=>{:attendees=>["View"]},
     "5"=>{:attendees=>["View"]},
     "50"=>{:attendees=>["View"]},
     "51"=>{:attendees=>["John", "Beverly"]},
     "52"=>{:attendees=>["View"]},
     "53"=>{:attendees=>["Steven", "Wanda", "Cyndee"]},
     "54"=>{:attendees=>["View"]},
     "55"=>{:attendees=>["Candles", "out"]},
     "56"=>{:attendees=>["Birthday", "Toast"]},
     "57"=>{:attendees=>["Chris", "Dolly", "Steven", "Wanda"]},
     "58"=>{:attendees=>["View"]},
     "59"=>{:attendees=>["View"]},
     "6"=>{:attendees=>["View"]},
     "60"=>{:attendees=>["Cyndee", "Dolly", "Paul", "Steven", "Wanda"]},
     "61"=>{:attendees=>["Wanda", "Adrienne"]},
     "62"=>{:attendees=>["View"]},
     "63"=>{:attendees=>["Vicki", "Wanda"]},
     "64"=>{:attendees=>["View"]},
     "65"=>{:attendees=>["View"]},
     "66"=>{:attendees=>["View"]},
     "67"=>{:attendees=>["View"]},
     "68"=>{:attendees=>["View"]},
     "69"=>{:attendees=>["View"]},
     "7"=>{:attendees=>["View"]},
     "70"=>{:attendees=>["View"]},
     "71"=>{:attendees=>["View"]},
     "72"=>{:attendees=>["View"]},
     "73"=>{:attendees=>["View"]},
     "74"=>{:attendees=>["View"]},
     "75"=>{:attendees=>["View"]},
     "76"=>{:attendees=>["View"]},
     "77"=>{:attendees=>["View"]},
     "78"=>{:attendees=>["View"]},
     "79"=>{:attendees=>["View"]},
     "8"=>{:attendees=>["Betty", "Toni", "Joe", "HelenT", "T", "Dee"]},
     "80"=>{:attendees=>["View"]},
     "81"=>{:attendees=>["View"]},
     "82"=>{:attendees=>["View"]},
     "83"=>{:attendees=>["View"]},
     "84"=>{:attendees=>["View"]},
     "85"=>{:attendees=>["View"]},
     "86"=>{:attendees=>["View"]},
     "87"=>{:attendees=>["View"]},
     "88"=>{:attendees=>["View"]},
     "89"=>{:attendees=>["Joe", "Cindy", "Wanda"]},
     "9"=>{:attendees=>["Liz", "Judy", "Lilian", "JanetN", "N", "HelenK", "K"]},
     "90"=>{:attendees=>["View"]},
     "91"=>{:attendees=>["View"]},
     "92"=>{:attendees=>["View"]},
     "93"=>{:attendees=>["Brendon", "Paul", "Steve", "Chris"]},
     "94"=>{:attendees=>["Dolly", "Leslie"]},
     "95"=>{:attendees=>["Dolly"]},
     "96"=>{:attendees=>["MaryJo"]},
     "97"=>{:attendees=>["Brendon", "Chris"]},
     "98"=>{:attendees=>["Paul", "Cyndee"]},
     "99"=>{:attendees=>["View"]}}
  @attendees = 
    {"Adrienne"=>{:name=>"Adrienne (Hrobak) Fritz - Niece", :pics=>["13", "17", "23", "61"]},
     "Bernadette"=>{:name=>"Bernadette (Zahn) Landon", :pics=>["20", "24", "35", "36"]},
     "Betty"=>{:name=>"Betty Simonetti - Friend", :pics=>["32", "8"]},
     "Beverly"=>{:name=>"Beverly Galore - Friend, Care Helper", :pics=>["51"]},
     "Brendon"=>{:name=>"Brendon Kulikowski - Grandson", :pics=>["14", "40", "45", "93", "97"]},
     "Charlie"=>{:name=>"Charlie Hrobak - Brother-in-law", :pics=>["109", "11", "13", "17", "23", "28", "42"]},
     "Chris"=>{:name=>"Chris Hrobak - Grandson", :pics=>["14", "25", "40", "45", "57", "93", "97"]},
     "Cyndee"=>                                        
      {:name=>"Cyndee (Hrobak) Kulikowski - Daughter", 
       :pics=>["14", "20", "22", "23", "26", "29", "31", "45", "53", "60", "98"]},
     "Dee"=>{:name=>"Dee (Trusiak)", :pics=>["33", "8"]},
     "Dolly"=>{:name=>"Dolly (Lane) Zahn - Cousin", :pics=>["19", "21", "25", "26", "57", "60", "94", "95"]},
     "HelenH"=>{:name=>"HelenH (Karestain) Hrobak - Sister-in-law", :pics=>["109", "11", "13"]},
     "HelenK"=>{:name=>"HelenK Koziol - Neighbor", :pics=>["9"]},
     "JanetN"=>{:name=>"JanetN Newcomer - Neighbor", :pics=>["9"]},
     "JanetT"=>{:name=>"JanetT Trusiak - Neighbor", :pics=>[]},
     "Joe"=>{:name=>"Joe Trusiak - Neighbor", :pics=>["33", "8", "89"]},
     "John"=>{:name=>"John - Neighbor", :pics=>["10", "51"]},
     "Judy"=>{:name=>"Judy (Hudek) Durkac - Neighbor", :pics=>["9"]},
     "Leslie"=>{:name=>"Leslie Wilton - Pauls Wife", :pics=>["10", "94"]},
     "Lilian"=>{:name=>"Lilian Hudek - Former Neighbor", :pics=>["9"]},
     "Liz"=>{:name=>"Liz Razdik - Neighbor", :pics=>["9"]},
     "Marie"=>{:name=>"Marie (Siekierski) Gutonski - Friend", :pics=>["12", "22", "40", "48"]},
     "Mary"=>{:name=>"Mary (Gorda) Hrobak - Sister-in-law", :pics=>["11", "13", "17", "28", "42", "44"]},
     "MaryJo"=>{:name=>"MaryJo (Kosdemba) Dee (Dlugopolski) - Niece", :pics=>["18", "46", "48", "96"]},
     "Paul"=>{:name=>"Paul Wilton - Nephew", :pics=>["10", "24", "26", "29", "31", "60", "93", "98"]},
     "Percy"=>{:name=>"Percy Grden - Friend", :pics=>["12", "41", "46", "48"]},
     "Sonia"=>{:name=>"Sonia (Stock) Fisher - Niece", :pics=>["12", "18", "40", "48"]},
     "Steven"=>{:name=>"Steven Alex - Son", :pics=>["14", "23", "24", "25", "26", "44", "45", "53", "57", "60"]},
     "Sue"=>{:name=>"Sue - Neighbor", :pics=>["10"]},
     "Toni"=>{:name=>"Toni (Simonetti)", :pics=>["32", "8"]},
     "Vickie"=>{:name=>"Vickie (Zahn)", :pics=>[]},
     "Wanda"=>
      {:name=>"Wanda Hrobak Mom",
       :pics=>
        ["104",
         "14","19","21","23","25","26","32","33","35","36","41","42","43","45","53","57","60","61","63","89"]},
     "View"=>
      {:name=>"View/Site",
       :pics=>
        ["1","100","101","102","103","105","106","107","108","15","16","2","27","3","30","34","37","38","39","4","49","5","50","52","54","58","59","6","62","64","65","66","67","68","69","7","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","90","91","92","99"]}}
  end

end
