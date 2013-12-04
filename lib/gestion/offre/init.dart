                                                                                                                                                                                    part of gestion_offre; 
 
// lib/gestion/offre/init.dart 
 
initGestionOffre(var entries) { 
  _initCriteres(entries); 
  _initActivites(entries); 
  _initEntreprises(entries); 
} 
 
_initActivites(var entries) { 
  Activite activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value0"; 
  activite.titre = "value0"; 
  activite.description = "value0"; 
  entries.activites.add(activite); 
  
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value1"; 
  activite.titre = "value1"; 
  activite.description = "value1"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value2"; 
  activite.titre = "value2"; 
  activite.description = "value2"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value3"; 
  activite.titre = "value3"; 
  activite.description = "value3"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value4"; 
  activite.titre = "value4"; 
  activite.description = "value4"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value5"; 
  activite.titre = "value5"; 
  activite.description = "value5"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value6"; 
  activite.titre = "value6"; 
  activite.description = "value6"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value7"; 
  activite.titre = "value7"; 
  activite.description = "value7"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value8"; 
  activite.titre = "value8"; 
  activite.description = "value8"; 
  entries.activites.add(activite); 
 
  activite = new Activite(entries.activites.concept); 
  activite.numactivite = "value9"; 
  activite.titre = "value9"; 
  activite.description = "value9"; 
  
  var contrainte = new Contrainte(activite.contraintes.concept);
  contrainte.critere=entries.criteres.firstWhereAttribute("numcritere", "value0");
  contrainte.type="Entier";
  contrainte.valeurs="5";
  contrainte.seuil="2";
  contrainte.activite=activite;
  activite.contraintes.add(contrainte);
  var contrainte1 = new Contrainte(activite.contraintes.concept);
  contrainte1.critere=entries.criteres.firstWhereAttribute("numcritere", "value1");
  contrainte1.type="Entier";
  contrainte1.valeurs="3";
  contrainte1.seuil="1";
  contrainte1.activite=activite;
  activite.contraintes.add(contrainte1);
  entries.activites.add(activite);
  } 
 
_initCriteres(var entries) { 
  Critere critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value0"; 
  critere.libelle = "value0"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value1"; 
  critere.libelle = "value1"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value2"; 
  critere.libelle = "value2"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value3"; 
  critere.libelle = "value3"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value4"; 
  critere.libelle = "value4"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value5"; 
  critere.libelle = "value5"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value6"; 
  critere.libelle = "value6"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value7"; 
  critere.libelle = "value7"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value8"; 
  critere.libelle = "value8"; 
  entries.criteres.add(critere); 
 
  critere = new Critere(entries.criteres.concept); 
  critere.numcritere = "value9"; 
  critere.libelle = "value9"; 
  entries.criteres.add(critere); 
 
} 
 
_initEntreprises(var entries) { 
  Entreprise entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value0"; 
  entreprise.designation = "value0"; 
  entreprise.raisonsocial = "value0"; 
  entreprise.responsable = "value0"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value1"; 
  entreprise.designation = "value1"; 
  entreprise.raisonsocial = "value1"; 
  entreprise.responsable = "value1"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value2"; 
  entreprise.designation = "value2"; 
  entreprise.raisonsocial = "value2"; 
  entreprise.responsable = "value2"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value3"; 
  entreprise.designation = "value3"; 
  entreprise.raisonsocial = "value3"; 
  entreprise.responsable = "value3"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value4"; 
  entreprise.designation = "value4"; 
  entreprise.raisonsocial = "value4"; 
  entreprise.responsable = "value4"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value5"; 
  entreprise.designation = "value5"; 
  entreprise.raisonsocial = "value5"; 
  entreprise.responsable = "value5"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value6"; 
  entreprise.designation = "value6"; 
  entreprise.raisonsocial = "value6"; 
  entreprise.responsable = "value6"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value7"; 
  entreprise.designation = "value7"; 
  entreprise.raisonsocial = "value7"; 
  entreprise.responsable = "value7"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value8"; 
  entreprise.designation = "value8"; 
  entreprise.raisonsocial = "value8"; 
  entreprise.responsable = "value8"; 
  entries.entreprises.add(entreprise); 
 
  entreprise = new Entreprise(entries.entreprises.concept); 
  entreprise.numentreprise = "value9"; 
  entreprise.designation = "value9"; 
  entreprise.raisonsocial = "value9"; 
  entreprise.responsable = "value9"; 
  entries.entreprises.add(entreprise); 
 
} 
 
