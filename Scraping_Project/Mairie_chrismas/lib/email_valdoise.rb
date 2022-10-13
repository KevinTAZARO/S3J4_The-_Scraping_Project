require 'nokogiri'
require 'open-uri'

def source(array_url)
    all_name = []

    array_url.each do |url|
    nom_commune = Nokogiri::HTML(URI.open("#{url}"))
    #On recherche le noms des Mairies
    nom = nom_commune.xpath('//div/main/section[1]/div/div/div/h1').text
    good_name = nom[0..-9] #selectionne le nom des communes et enlève les derniers caractères de la ligne (code postal)
    all_name << good_name   
    end
    return all_name
end

def source_bis
    url_mairie = []
    specific_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]/@href')
    #On recherche des urls des Mairies dans le tableau
    url_mairie = specific_url.map {|x| "https://www.annuaire-des-mairies.com" + x.text[1..-1]}
return url_mairie
end

def get_townhall_email(townhall_url)
    all_mails = []

    townhall_url.each do |url| #pour chque case de mon tableau, il analyse le tableau et |url| change à tour
        commune = Nokogiri::HTML(URI.open("#{url}")) #recherche des mails des Mairies
        get_mail = commune.xpath('//div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
        all_mails << get_mail #les données sont envoyées dans le tableau all_mails
    end

    return all_mails

end


def perform
    final = []
    url = source_bis
    name = source(url)
    email = get_townhall_email(url)

    name.length.times do |i|
        h = {name [i] => email [i]}
        final.push(h)
    end

    return final

end