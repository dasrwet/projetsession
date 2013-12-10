part of gestion_offre; 
 
// lib/gen/gestion/offre/entries.dart 
 
class OffreEntries extends ModelEntries { 
 
  OffreEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Activite"); 
    entries["Activite"] = new Activites(concept); 
    concept = model.concepts.singleWhereCode("Critere"); 
    entries["Critere"] = new Criteres(concept); 
    concept = model.concepts.singleWhereCode("Entreprise"); 
    entries["Entreprise"] = new Entreprises(concept); 
    concept = model.concepts.singleWhereCode("Compteur"); 
    entries["Compteur"] = new Compteurs(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Activite") { 
      return new Activites(concept); 
    } 
    if (concept.code == "Contrainte") { 
      return new Contraintes(concept); 
    } 
    if (concept.code == "Critere") { 
      return new Criteres(concept); 
    } 
    if (concept.code == "Entreprise") { 
      return new Entreprises(concept); 
    } 
    if (concept.code == "Evaluation") { 
      return new Evaluations(concept); 
    } 
    if (concept.code == "Compteur") { 
      return new Compteurs(concept); 
    } 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Activite") { 
      return new Activite(concept); 
    } 
    if (concept.code == "Contrainte") { 
      return new Contrainte(concept); 
    } 
    if (concept.code == "Critere") { 
      return new Critere(concept); 
    } 
    if (concept.code == "Entreprise") { 
      return new Entreprise(concept); 
    } 
    if (concept.code == "Evaluation") { 
      return new Evaluation(concept); 
    } 
    if (concept.code == "Compteur") { 
      return new Compteur(concept); 
    } 
  } 
 
  fromJsonToData() { 
    fromJson(gestionOffreDataJson); 
  } 
 
  Activites get activites => getEntry("Activite"); 
  Criteres get criteres => getEntry("Critere"); 
  Entreprises get entreprises => getEntry("Entreprise"); 
  Compteurs get compteurs => getEntry("Compteur"); 
 
} 
 
