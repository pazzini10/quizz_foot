dashboardPage(
  dashboardHeader(title = "Questionnaire de foot"),
  dashboardSidebar(collapsed = TRUE,sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard"))),
  dashboardBody( tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
   
    shinyjs::useShinyjs(),
    fluidRow(column(12,
      box(width=12,title = "Règles", status = "primary", solidHeader = TRUE,div(id = "header",
                    
                      h5("En cette période de confinement, un petit questionnaire de foot pour se divertir en ces temps troublés."),
                      h5("La règle est simple : 30 questions. Un seul vainqueur. Un seul cadeau."),
                      h5("Merci de jouer le jeu et de ne pas tricher. Bonne chance à tous"),
                      h5("Fait du jeu le 11 mai à 23h59")
                      ,
                      strong( 
                        span("Created by "),
                        a("David Flouriot"),
                        HTML("&bull;"),
                        span("Code"),
                        a("on GitHub", href = "https://github.com/pazzini10"),
                        HTML("&bull;"))
  )))),

  fluidRow(
    column(7,box(width=12,title = "Questions", status = "primary", solidHeader = TRUE,
           div(
             id = "form",
             textInput("name", labelMandatory("Nom"), ""),
             textInput("favourite_team", labelMandatory("Equipe de coeur")),
             selectInput("q1", "Trouver l'équipe avec le Panama qui a terminé sa poule avec 0 point pris lors de la coupe du monde 2018 ?",
                         c("",  "Allemagne", "Corée", "Egypte","Arabie Saoudite")),
             selectInput("q2", "Quelle équipe a remporté le match le plus prolifique sur le score de 6-1 lors de la coupe du monde 2018 ?",
                         c("",  "Allemagne", "Angleterre", "Belgique","France","Brésil")),
             selectInput("q3", "Qui finit meilleur buteur lors de la coupe du monde 2018 ?",
                         c("",  "Mbappé", "Griezman", "Kane","Modric")),
             selectInput("q4", "Avec 77 buts, quel est le meilleur tireur de coups francs de l'histoire ?",
                         c("",  "Beckham", "Juninho", "Pelé","Messi","Ronaldo C.","Maradona")),
             selectInput("q5", "Parmi les tireurs de penaltys de L1 depuis 10 ans, avec 15 tentatives minimun, qui est le pire tireur avec 61% ? (Si Niang continue de tirer il sera le best. Actuellement 40% en 8 tentatives...) ",
                         c("",  "Ben Yedder", "Gradel", "Cavani","Payet","Delort")),
             selectInput("q6", "De quelle distance un joueur du championnant hollandais (en play-off le c.. et à la 89ème minute..) a inscrit le but contre son camp le plus lointain de l'histoire ?",
                         c("",  "20 mètres", "30 mètres", "40 mètres","50 mètres")),
             selectInput("q7", "Le dernier joueur de champ évoluant au stade rennais (au moment de la sélection) à avoir eu une sélection en EDF A ?",
                         c("",  "Camavingua", "Ntep", "Fanni","Briand","M'Villa")),
             selectInput("q8", "Quel est le seul grand club a donné de l'argent à son sponsor principal ? (2 millions d'euros)",
                         c("",  "Réal Madrid", "Barcelone", "Chelsea","Monaco","Manchester United")),
             selectInput("q9", "Qui a marqué le but le plus rapide contre Nantes à la 1er minute lors d'un derby Rennes-Nantes ?",
                         c("",  "Dembélé", "Niang", "Grosiki","Frei","Mexer")),
             selectInput("q10", "Lors de la LDC 2007-2008 qui écrase Besiktas 8-0 pour établir un record en phase de poules ?",
                         c("",  "Milan", "Barcelone", "Bayern","Liverpool","Réal Madrid","Juventus","Manchester United")),
             selectInput("q11", "Depuis Marseille en 1993, Quelle seule et unique équipe est restée invaincue pour remporter la ligue des champions ?",
                         c("",  "Milan", "Barcelone", "Bayern","Liverpool","Réal Madrid","Juventus","Manchester United")),
             selectInput("q12", "Quel est le seul et unique joueur à avoir réussi un quintuple en phase finale de LDC. C'était contre le Bayer Leverkusen pour une victoire 7-1",
                         c("",  "Ronaldo C.", "Adriano", "Klose","Levandoski","Messi","Neymar")),
             selectInput("q13", "Quel est le joueur de champ ayant le plus de matchs joués en ligue 1 avec 587 apparitions ?",
                         c("",  "Alain Giresse", "Sylvain Kastendeuch", "Patrick Battiston","Florent Balmont","Sylvain Armand")),
             selectInput("q14", "A 17 ans et 10 mois, quel est le plus jeune joueur à avoir réalisé le coup du chapeau en Ligue1 ?",
                         c("",  "", "Osmane Dembélé","Franck Ribéry","Jérémy Ménez","Kylian Mbappé","Dimitri Payet")),
             selectInput("q15", "Quelle équipe détient le record d'invicibilité en ligue 1 avec 92 matchs consécutifs sans défaite à domicile ? ",
                         c("",  "Marseille", "Nantes", "PSG","Saint Etienne","Lyon")),
             selectInput("q16", "Quelle équipe de Ligue 1 gagne enfin son premier match de la saison lors de la 22 journée de championnat en gagnant à Lille ?",
                         c("",  "Grenoble", "Istres", "Troyes","Lens","Chateauroux","Laval")),
             selectInput("q17", "Lors des 10 dernières saisons, quelle équipe à égaler le triste record de 7 matchs consécutifs sans marquer ?",
                         c("",   "Ajaccio", "Guingamp","Toulouse","Brest","Dijon")),
             selectInput("q18", "Quel est le joueur avec le meilleur ratio but par match (0.69) en Premier League (100 matchs min.) ?",
                         c("",  "Aguero", "Henry", "Owen","Shearer","Balotelli")),
             selectInput("q19", "Quel est le joueur avec le meilleur ratio de passes décisives par match (0.32) en Premier League (100 matchs min.) ?",
                         c("",  "Giggs", "Beckham", "Bergkamp","Gerrard","Fabregas")),
             selectInput("q20", "Quel est le deuxième meilleur buteur de l'histoire de la série A derrière Silvio Piola avec 250 buts ?",
                         c("",  "Crespo", "Batistuta", "Totti","Vieri","Baggio")),
             selectInput("q21", "Quel est le joueur professionnel le plus âgé à avoir marqué lors d'un match pro à l'âge de 50 ans pour une victoire 1-0 de son équipe ?",
                         c("",  "Kazuyoshi Miura", "Rivaldo", "Pelé","Bebeto","Totti")),
             selectInput("q22", "Quel est le plus jeune joueur à avoir marqué en coupe du monde ?",
                         c("",  "Owen", "Mbappé", "Messi","Pelé","Maradona")),
             selectInput("q23", "Quel nouveau record a été établi lors de la coupe du monde 2018? Le précédent record datait de 1998. Coincidence ?",
                         c("",  "Le plus de matchs nulls", "Le plus de buts contre son camp", "Le plus de pénalties","Le plus de cartons rouges")),
             selectInput("q24", "Quel joueur a la plus courte carrière en équipe de France avec 5 secondes de temps de jeu ?",
                         c("",  "Morgan Amalfitano", "Clément Chantôme", "Marc Planus","Franck Jurietti")),
             selectInput("q25", "Quel attaquant a réussi l'exploit de rater 3 pénaltys dans le même match ? (Non ce n'est pas Niang :))",
                         c("",  "Carlos Tevez", "Martin Palermo", "Hernan Crespo","Sergio Aguero")),
             selectInput("q26", "Quel joueur âgé de 17 ans a remplacé son père dans un match officiel ? Improbable...",
                         c("",  "Thibault Giresse", "Eidur Gudjohnsen", "Youri Djorkaeff","Paolo Maldini")),
             selectInput("q27", "Quel gardien a le record d'invincibilité avec 1331 minutes lors de la saison 2008-2009 ?",
                         c("",  "Edwin Van der Sar", "Gianluigi Buffon", "Peter Schmeichel","Petr Cech")),
             selectInput("q28", "Quel club de ligue 1 est descendu la même année que sa présence en finale dans les deux coupes nationales ? Grosse saison chargée d'émotion...",
                         c("",  "Strasbourg", "Nice", "Guingamp","Lorient","Nantes")),
             selectInput("q29", "Combien de pénalties a t-il fallu pour départager le match de coupe entre Brockenhurst et Andover Town en coupe d'Angleterre en janvier 2019 lors de la séance de tirs aux buts ? Le record absolu en Europe !",
                         c("",  "19", "24", "29","34")),
             selectInput("q30", "Quel joueur est resté seulement 7 secondes sur le terrain avant d'être expulsé ? Il était pressé de rentrer chez lui.",
                         c("",  "Cyril Rool", "Zé Roberto", "Sergio Ramos","Eric Cantona")),
             
             actionButton("submit", "Soumettre", class = "btn-primary"))
             
             ,

             shinyjs::hidden(
               span(id = "submit_msg", "Submitting..."),
               div(id = "error",
                   div(br(), tags$b("Error: "), span(id = "error_msg"))
               )
             )
           ,

           shinyjs::hidden(
             div(
               id = "thankyou_msg",
               h3("Merci pour tes réponses ! Regarde vite si tu es le boss dans les résultats")
             )
           )
    )),
   
    column(5,div(
      id = "adminPanel",
      box(width=12,title = "Résultats", status = "primary", solidHeader = TRUE,
          #downloadButton("downloadBtn", "Télécharger classement joueurs"), br(), br(),
          DT::dataTableOutput("responsesTable")
          ))
      
    )
    
  ))
  ))
)