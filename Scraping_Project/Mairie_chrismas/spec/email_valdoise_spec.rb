#Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies).
#Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.


#Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout l'annuaire du Val d'Oise.
#La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.


require_relative '../lib/email_valdoise.rb'

describe "source nom de la mairie" do
    
  it "return hash" do
    expect(perform).to be_an(Array)
  end

  it "donne le nom de la ville" do
      expect(perform).to include{"AINCOURT"}
      expect(perform).to include{"PONTOISE"}
    end

    it "donne l'email de la ville" do
      expect(perform).to include{"mairie.aincourt@wanadoo.fr"}
      expect(perform).to include{"mairie@ville-pontoise.fr"}
    end
 end