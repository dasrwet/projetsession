# gestion_offre 

**Categories**: dartling, class models. 

## Description: 
gestion_offre project uses 
[dartling] (https://github.com/dzenanr/dartling) for the model.

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
	 
	 
	 ## Description des module
	 # la page d'accueil permet de se connecter sur ou la page administrative, ou la page analyse
	 # la page administrative permet d'enregistrer une entrepris, un critere, une activite avec des 
	 contraintes basees sur les criteres, et une evaluation qui permet d'associer une entreprise a une activite selon les 
	 contraintes definit pour cette activite
	 #	La page analyse permet d'evaluer les entreprise ayant optees pour une activite precise. cette analyse s'observe a travers 
	 un graphe en fonction des criteres.Il est a noter que la courbe observer en couleur verte est la moyenne experer pour une entreprise
	 selective, et la courbe en rouge donne la valeur minimal qu'il faux avoir pour etre selectionne.  
	 