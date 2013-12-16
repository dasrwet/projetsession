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
	 
	 # la page d'accueil donne le choix soit de se connecter � la page administrative d�nom�e �Gestion des donn�es�, soit � la page analyse.
	 # la page administrative permet d'enregistrer les entreprises, les crit�res, les activit�s avec les contraintes bas�es sur les criteres, 
	   et une evaluation qui permet d'associer une entreprise � une activite selon les contraintes definit pour cette activite.
	 # La page analyse permet d'evaluer les entreprise ayant opt�es pour une activite donn�e. Cette analyse s'observe � travers 
	   un graphe qui a en abscisse les crit�res d'�valuation et en ordonn�e les valeurs ou scores r�alis�s par les diverses entreprises selon chaque criteres.
	   Il est � noter que la courbe observer en couleur verte repr�sente la moyenne exp�r�e pour qu'une entreprise soit consid�r�e comme ayant un score appropri�.
	   selective, et la courbe en rouge donne la valeur minimal qu'il faux avoir pour �tre selectionn�.  
	 
	 # Gestion des donn�es
	 
	   Quatre menus sont disponibles: Crit�re, Entreprise, Activit� et �valuation.
	   
	   		# Crit�re
	   		
	   		Un formulaire permet d'ajouter les crit�res qui vont servir de base � la d�finition des activit�s.
	   		Une fois saisie et ajout�, le crit�re est sauvegard� dans un tableau intitul� �liste des crit�res� avec les possibilit�s de modification et de suppression.
	   		
	   		# Entreprise
	   		
	   		Un formulaire permet aussi d'ajouter les entreprises qui vont �tre �valu�es selon les activit�s retenues pour les �valuations.
	   		Une fois saisie et ajout�e, les donn�es de l'entreprise sont sauvegard�s dans un tableau intitul� �liste des entreprises� avec les possibilit�s de modification et de suppression.
	   		
	   		# Activit�
	   		
	   		Une activi� est d�finie par un ensemble de crit�res choisis dans la liste des crit�res existants. A chaque crit�re retenu pour d�finir l'activit�, deux valeurs sont sp�cifi�es:
	   			* une valeur moyenne que les entreprises en bonne posture devrait tout au moins atteindre,
	   			* une valeur seuil qui repr�sente la valeur minimale du score � r�aliser par les entreprises pour rester �ilgibles pour dans le cadre de l'�valuation.
	   		Un tableau des crit�res choisis ainsi qu'un tableau des activit�s en �vidence permettent de sauvegarder les donn�es. Les possibilit�s de modification et de su^ppression 
	   		sont �galement disponibles.
	   		
	   		# �valuation
	   		
	   		Ce menu permet de faire le r�capitulatif sur les donn�es compil�es et les r�sultats des �valuations des entreprises en comp�tition.
	   		Apr�s avoir choisi l'activit� � �valuer, on clique sur le bouton �Lancer� pour afficher les crit�res, leurs valeurs et l'�valuation de l'entreprise choisie.
	   		Dans le cas o� l'entreprise choisie dans le menu d�roulant pr�vu � ce effet ne serait encore associ�e � l'activit� courante, on pourrait � ce niveau ajouter les valeurs des crit�res et les enregistrer. 
	   		Ces donn�es seront concerv�e et pourront �tre modifi�es au besoin. 
	   	
	   	Les boutons �retour au d�dut� pour se repositionner sur la page d'accueil et � Quitter� pour sortir de l'application sont disponibles dans chacun des quatre menus sus-d�crits.
	   	
	  # Analyse 
	  
	  Il s'agit d'une grille d'analyse qui permet de s�lectionner les diff�rentes activit�s en liste pour l'�vauation des entreprises au travers d'un menu d�roulant.
	  Des sp�cifications pour la construction des graphes de comparaisons y sont disponibles et un bouton �Lancer� permet d'afficher la repr�sentation graphique dont l'interpr�tation 
	  conduit � l'identification des entreprises les mieux adapt�es aux conditions d'�valuations d�finies. 
	  NB: Une deuxi�me voir une troisi�me �tape de s�lection pourraient �tre de mise pour d�partager les entreprises qui se seraient positionn�es de fa�on � rendre moins �videntes 
	  les premi�res s�lections
	   
	   	
	   	
	   	
	   		
	   		