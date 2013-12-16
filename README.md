# gestion_offre 

**Categories**: dartling, class models. 

## Description: 
gestion_offre project uses 
[dartling] (https://github.com/dzenanr/dartling) for the model.

AUTORS
	1- DJIMADJA COMLAN STANISLAS GILDAS 111 082 891
	2- Aurelien BETBEUI KWANDJEU 111 056 506
	3- EVESSEHOU MOISE DOVONOU 111 027 257
	4- THYERRY BAYI 		   111 016 826

Quelques description sur l'utilisation des methodes:
	- pour sauvegarder les donnees dans la memoire local, utiliser
	DataBase.save(NomDuModel);
	- par convention, utiliser une regle de numerotation automatique pour les cles primaire 
	des donnees stocke.
	 Exemple: pour enregistrer activite deja declarer:
	 compteur.nbreactivite++;
	 activite.numactivite='Act_'+compteur.nbreactivite.tostring;
	 
	 .....(affecter les autres variable)......
	 
	 NomDuModel.activites.add(activite);
	 DataBase.save(NomDuModel);
	 
	 - pour critere on aura critere.numcrite='Cri_'+compteur.nbrecritere.tostring;
	 - pour entreprise on aura entreprise.numcrite='Ent_'+compteur.nbreentreprise.tostring;
	 
	 
	 ## Description des modules
	 
	 # la page d'accueil donne le choix soit de se connecter à la page administrative dénomée «Gestion des données», soit à la page analyse.
	 # la page administrative permet d'enregistrer les entreprises, les critères, les activités avec les contraintes basées sur les criteres, 
	   et une evaluation qui permet d'associer une entreprise à une activite selon les contraintes definit pour cette activite.
	 # La page analyse permet d'evaluer les entreprise ayant optées pour une activite donnée. Cette analyse s'observe à travers 
	   un graphe qui a en abscisse les critères d'évaluation et en ordonnée les valeurs ou scores réalisés par les diverses entreprises selon chaque criteres.
	   Il est à noter que la courbe observer en couleur verte représente la moyenne expérée pour qu'une entreprise soit considérée comme ayant un score approprié.
	   selective, et la courbe en rouge donne la valeur minimal qu'il faux avoir pour être selectionné.  
	 
	 # Gestion des données
	 
	   Quatre menus sont disponibles: Critère, Entreprise, Activité et Évaluation.
	   
	   		# Critère
	   		
	   		Un formulaire permet d'ajouter les critères qui vont servir de base à la définition des activités.
	   		Une fois saisie et ajouté, le critère est sauvegardé dans un tableau intitulé «liste des critères» avec les possibilités de modification et de suppression.
	   		
	   		# Entreprise
	   		
	   		Un formulaire permet aussi d'ajouter les entreprises qui vont être évaluées selon les activités retenues pour les évaluations.
	   		Une fois saisie et ajoutée, les données de l'entreprise sont sauvegardés dans un tableau intitulé «liste des entreprises» avec les possibilités de modification et de suppression.
	   		
	   		# Activité
	   		
	   		Une activié est définie par un ensemble de critères choisis dans la liste des critères existants. A chaque critère retenu pour définir l'activité, deux valeurs sont spécifiées:
	   			* une valeur moyenne que les entreprises en bonne posture devrait tout au moins atteindre,
	   			* une valeur seuil qui représente la valeur minimale du score à réaliser par les entreprises pour rester éilgibles pour dans le cadre de l'évaluation.
	   		Un tableau des critères choisis ainsi qu'un tableau des activités en évidence permettent de sauvegarder les données. Les possibilités de modification et de su^ppression 
	   		sont également disponibles.
	   		
	   		# Évaluation
	   		
	   		Ce menu permet de faire le récapitulatif sur les données compilées et les résultats des évaluations des entreprises en compétition.
	   		Après avoir choisi l'activité à évaluer, on clique sur le bouton «Lancer» pour afficher les critères, leurs valeurs et l'évaluation de l'entreprise choisie.
	   		Dans le cas où l'entreprise choisie dans le menu déroulant prévu à ce effet ne serait encore associée à l'activité courante, on pourrait à ce niveau ajouter les valeurs des critères et les enregistrer. 
	   		Ces données seront concervée et pourront être modifiées au besoin. 
	   	
	   	Les boutons «retour au dédut» pour se repositionner sur la page d'accueil et « Quitter» pour sortir de l'application sont disponibles dans chacun des quatre menus sus-décrits.
	   	
	  # Analyse 
	  
	  Il s'agit d'une grille d'analyse qui permet de sélectionner les différentes activités en liste pour l'évauation des entreprises au travers d'un menu déroulant.
	  Des spécifications pour la construction des graphes de comparaisons y sont disponibles et un bouton «Lancer» permet d'afficher la représentation graphique dont l'interprétation 
	  conduit à l'identification des entreprises les mieux adaptées aux conditions d'évaluations définies. 
	  NB: Une deuxième voir une troisième étape de sélection pourraient être de mise pour départager les entreprises qui se seraient positionnées de façon à rendre moins évidentes 
	  les premières sélections
	   
	   	
	   	
	   	
	   		
	   		