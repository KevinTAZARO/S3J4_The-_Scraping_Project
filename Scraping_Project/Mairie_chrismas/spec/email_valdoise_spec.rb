#Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies).
#Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.


#Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout l'annuaire du Val d'Oise.
#La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.


require_relative '../lib/email_valdoise.rb'

describe "source nom de la mairie" do
    it "donne le nom de la ville" do
      expect(source("http://annuaire-des-mairies.com/95/aincourt.html")).to eq("AINCOURT")
      expect(source("http://annuaire-des-mairies.com/95/pontoise.html")).to eq("PONTOISE")
    end
 end

 describe "source email de la mairie" do
    it "donne l'email de la ville" do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/aincourt.html")).to eq("mairie.aincourt@wanadoo.fr")
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/pontoise.html")).to eq("mairie@ville-pontoise.fr")
    end
 end