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