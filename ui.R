fluidPage(
  shinyjs::useShinyjs(),
  shinyjs::inlineCSS(appCSS),
  title = "Questionnaire de foot",
   
  div(id = "header",
      h1("Questionnaire de foot"),
      h4("Cette application est faite pour les fans de foot"
      ),
      strong( 
        span("Created by "),
        a("David Flouriot"),
        HTML("&bull;"),
        span("Code"),
        a("on GitHub", href = "https://github.com/pazzini10"),
        HTML("&bull;"))
  ),
  
  fluidRow(
    column(8,
           div(
             id = "form",
             
             textInput("name", labelMandatory("Nom"), ""),
             textInput("favourite_team", labelMandatory("Equipe de coeur")),
             # checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
             # sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE),
             # selectInput("os_type", "Operating system used most frequently",
             #             c("",  "Windows", "Mac", "Linux")),
             selectInput("q1", "Trouver l'équipe qui a terminé sa poule avec 0 point pris lors de la coupe du monde 2018 ?",
                         c("",  "Allemagne", "Corée", "Egypte")),
             selectInput("q2", "Quelle équipe a remporté le match le plus prolifique sur le score de 6-1 lors de la coupe du monde 2018 ?",
                         c("",  "Allemagne", "Angleterre", "Belgique","France")),
             selectInput("q3", "Qui finit meilleur buteur lors de la coupe du monde 2018 ?",
                         c("",  "Mbappé", "Griezman", "Kane")),
             selectInput("q4", "Meilleur tireur de coups francs de tous les temps ?",
                         c("",  "Beckham", "Juninho", "Pelé","Messi","Ronaldo C.","Maradona")),
             selectInput("q5", "Parmi les tireurs de penaltys de L1 depuis 10 ans, avec 15 tentatives minimun, qui est le pire tireur avec 61% ? (Si Niang continue de tirer il sera le best. Actuellement 40% en 8 tentatives...) ",
                         c("",  "Ben Yedder", "Gradel", "Cavani","Payet","Delort")),
             selectInput("q6", "De quelle distance un joueur du championnant hollandais (en play-off le con et à la 89ème minute..) a inscrit le but contre son camp le plus loin de l'histoire ?",
                         c("",  "20 mètres", "30 mètres", "40 mètres","50 mètres")),
             selectInput("q7", "Le dernier joueur de champ évoluant stade rennais (au moment de la sélection) à avoir eu une sélection en EDF A ?",
                         c("",  "Camavingua", "Ntep", "Fanni","Briand","MVilla")),
             selectInput("q8", "De quel club vient Hamari Traoré ?",
                         c("",  "Rennes", "Nimes", "Reims","Le Havre","Sochaux","Auxerre","Troyes")),
             selectInput("q9", "Qui a marqué le but le plus rapide contre Nantes à la 1er minute lors d'un derby Rennes-Nantes ?",
                         c("",  "Dembélé", "Niang", "Grosiki","Frei","Mexer")),
             selectInput("q10", "Lors de la LDC 2007-2008 qui écrase Besiktas 8-0 pour établir un record en phase de poules ?",
                         c("",  "Milan", "Barcelone", "Bayern","Liverpool","Réal Madrid","Juventus","Manchester United")),
             selectInput("q11", "Depuis Marseille en 1993, Quelle seule et unique équipe est restée invaincue pour remporter la ligue des champions ?",
                         c("",  "Milan", "Barcelone", "Bayern","Liverpool","Réal Madrid","Juventus","Manchester United")),
             selectInput("q12", "Quel est le seul et unique joueur à avoir réussi un quintuple en phase finale de LDC. C'était contre le Bayer Leverkusen pour une victoire 7-1",
                         c("",  "Ronaldo C.", "Adriano", "Klose","Levandoski","Messi","Neymar")),
             selectInput("q13", "Quel est le joueur de champ ayant le plus de matchs joués en ligue 1 avec 587",
                         c("",  "Alain Giresse", "Sylvain Kastendeuch", "Patrick Battiston","Florent Balmont","Sylvain Armand")),
             selectInput("q14", "A 17 ans et 10 mois, quel est le plus jeune joueur à avoir réalisé le coup du chapeau en Ligue1 ?",
                         c("",  "", "Osmane Dembélé","Franck Ribéry","Jérémy Ménez","Kylian Mbappé","Dimitri Payet")),
             selectInput("q15", "Quelle équipe détient le record d'invicibilité avec 92 matchs consécutifs sans défaite à domicile, ",
                         c("",  "Marseille", "Nantes", "PSG","Saint Etienne","Lyon")),
             selectInput("q16", "Quelle équipe gagne enfin son premier match de la saison lors de la 22 journée de championnat en gagnant à Lille ?",
                         c("",  "Grenoble", "Istres", "Troyes","Lens","Chateauroux","Laval")),
             selectInput("q17", "Lors des 10 dernières saisons, quelle équipe à égaler le triste record de 7 matchs consécutifs sans marquer ?",
                         c("",  "EAG", "Ajaccio", "Guingamp","Toulouse","Brest","Dijon")),
             selectInput("q18", "Quel est le joueur avec le meilleur ratio but par match (0.69) en Premier League (100 matchs min.) ?",
                         c("",  "Aguero", "Henry", "Owen","Shearer","Balotelli")),
             selectInput("q19", "Quel est le joueur avec le meilleur ratio de passes décisives par match (0.32) en Premier League (100 matchs min.) ?",
                         c("",  "Giggs", "Beckham", "Bergkamp","Gerrard","Fabregas")),
             selectInput("q20", "Quel est le joueur avec le meilleur ratio but par match (0.69) en Série A (100 matchs min.) depuis les années 80 ?",
                         c("",  "Crespo", "Batistuta", "Totti","Vieri","Baggio")),
             selectInput("q21", "Quel est le joueur professionnel le plus âgé à avoir marqué lors d'un match pro à l'âge de 50 ans pour une victoire 1-0 de son équipe ?",
                         c("",  "Kazuyoshi Miura", "Rivaldo", "Pelé","Bebeto","Toti")),
             selectInput("q22", "Quel est le plus jeune joueur à avoir marqué en coupe du monde ?",
                         c("",  "Owen", "Mbappé", "Messi","Pelé","Maradona")),
             selectInput("q23", "Quel nouveau record a été établi lors de la coupe du monde 2018? Le précédent record datait de 1998. Coincidence ?",
                         c("",  "Le plus de matchs nulls", "Le plus de buts contre son camp", "Le plus de pénalties","Le plus de cartons rouges")),
             
             actionButton("submit", "Soumettre", class = "btn-primary"),
             
             shinyjs::hidden(
               span(id = "submit_msg", "Submitting..."),
               div(id = "error",
                   div(br(), tags$b("Error: "), span(id = "error_msg"))
               )
             )
           ),
           
           shinyjs::hidden(
             div(
               id = "thankyou_msg",
               h3("Thanks, your response was submitted successfully!") 
             )
           )
    ),
    column(4,
           uiOutput("adminPanelContainer")
    )
  )
)