require 'nokogiri'
require 'open-uri'

def source(url_mairie)
    nom_commune = Nokogiri::HTML(URI.open(url_mairie))
    #On recherche le noms des Mairies
    nom = nom_commune.xpath('//div/main/section[1]/div/div/div/h1').text
return nom[0..-9] #à quoi ça sert bruh ?
end

def source_bis
    specific_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]/@href')
    #On recherche des urls des Mairies dans le tableau
    url_mairie = specific_url.map {|x| "https://www.annuaire-des-mairies.com" + x.text[1..-1]}
    return url_mairie
end

def get_townhall_email(townhall_url)
    commune = Nokogiri::HTML(URI.open(townhall_url)) #recherche des mails des Mairies
         get_mail = commune.xpath('//div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
         return get_mail
   end

   Hash.class_eval do
    def split_into(divisions)
      count = 0
      inject([]) do |final, key_value|
        final[count%divisions] ||= {}
        final[count%divisions].merge!({key_value[0] => key_value[1]})
        count += 1
        final
      end
    end
 end

def perform
    mail = []
    name = []

    source_bis.each do |x|
        mail << get_townhall_email(x)
        name << source(x)

    end

    hash_all = Hash[name.zip(mail)]

    new_array = hash_all.split_into(name.size)

    puts new_array
    
end

perform