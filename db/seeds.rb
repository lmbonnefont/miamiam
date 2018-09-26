require 'open-uri'
require 'nokogiri'


Dose.destroy_all
Recette.destroy_all
Semaine.destroy_all
User.destroy_all

user = User.create!(email: "jeanbon@gmail.com", password: "123456")


###################################################################
for i in (Time.now.strftime('%W').to_i..52)
  Semaine.create!(active: false, user: user, numero: i)
end

semaine = Semaine.where(numero: Time.now.strftime('%W').to_i)

Semaine.all.each do |semaine|
  i = 1
  for i in (1..7)
    Jour.create!(date: Date.commercial( 2018, semaine.numero, i ), semaine: semaine)
  end
end
####################################################################
# url = "http://www.unjourunerecette.fr/que-manger-ce-soir"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)


# ##################################################################
# liens = html_doc.css('a.photoenglob img').take(63)

# i = 0
# images = []
# liens.each do |img|
#   if img["data-src"] == nil
#     image = img["src"]
#   else image = img["data-src"]
#   end
#   image = "http://www.unjourunerecette.fr#{image}"
#   images << image
# end


# ###################################################################

# recettes = html_doc.search('.photoenglob').take(63)

# urls = []
# recettes.each do |element|
#   urls << element["href"]
# end

# #################################################################### Création des recettes avec la photo associée

# urls.each do |lien|

#   puts "ça tourne ..."

#   url = "http://www.unjourunerecette.fr/#{lien}"
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)

#   titre = html_doc.search('.item').first.text
#   titre = titre.strip

#   instructions = html_doc.search('.instructions').first.text
#   instructions = instructions.strip

#   nombre = html_doc.search('#entouringredients .courses').first.text
#   nombre = nombre.strip.match(/\d/)[0].to_i
#   ########################################################################

#   details = html_doc.search('#infos li').text
#   temps = details.scan(/\d+/)
#   preparation = temps[0].to_i
#   cuisson = temps[1].to_i
#   difficulté = details.scan(/(?<=: )(.*)(?=Pr)/).flatten[0]


#  ##############################################################################

#   recette = Recette.new(nom: titre, instruction: instructions, nb_personne: nombre, preparation: preparation, cuisson: cuisson, difficulté: difficulté,)
#   recette.remote_photo_url = images[i]
#   recette.save!
#   p recette
#   i = i + 1

# ############################################################################### Création des doses des recettes


#   instructions = html_doc.search('#ingredients').text.strip.split(",")
#   instructions.each do |ingredient|
#   ingredient.gsub!("\n","")
# end


# #on remplace les ratio par des nombres

# substitution_number = {
#   "1/2": 0.5,
#   "1/4": 0.25,
#   "3/4": 0.75,
# }


# instructions.each do |combinaison|
#   if substitution_number[combinaison[0..2].to_sym] != nil
#     nb = substitution_number[combinaison[0..2].to_sym].to_s
#     combinaison.gsub!(combinaison[0..2], nb)
#   end
# end


# instructions.each do |combinaison|
#   if combinaison.match(/\d.\d/)
#     quantité = combinaison.match(/\d.\d/).to_s
#     ingredient = combinaison[quantité.to_s.length + 1..-1]
#   elsif combinaison.match(/\d/)
#     quantité = combinaison.match(/\d/).to_s
#     ingredient = combinaison[quantité.to_s.length + 1..-1]
#   else quantité = 1
#     ingredient = combinaison
#   end

# # ############################################################################### Récupération du temps et de la difficulté




# ###############################################################################
#   dose = Dose.create!(quantite: quantité, ingredient:ingredient, recette: recette)
# end



# ###############################################################################



#   puts "Et hop une recette dans la besace :)"
# end
