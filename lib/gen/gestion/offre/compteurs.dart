part of gestion_offre; 
 
// lib/gen/gestion/offre/compteurs.dart 
 
abstract class CompteurGen extends ConceptEntity<Compteur> { 
 
  CompteurGen(Concept concept) : super.of(concept); 
 
  int get nbreactivite => getAttribute("nbreactivite"); 
  set nbreactivite(int a) => setAttribute("nbreactivite", a); 
  
  int get nbrecritere => getAttribute("nbrecritere"); 
  set nbrecritere(int a) => setAttribute("nbrecritere", a); 
  
  int get nbreentreprise => getAttribute("nbreentreprise"); 
  set nbreentreprise(int a) => setAttribute("nbreentreprise", a); 
  
  String get autre => getAttribute("autre"); 
  set autre(String a) => setAttribute("autre", a); 
  
  Compteur newEntity() => new Compteur(concept); 
  Compteurs newEntities() => new Compteurs(concept); 
  
} 
 
abstract class CompteursGen extends Entities<Compteur> { 
 
  CompteursGen(Concept concept) : super.of(concept); 
 
  Compteurs newEntities() => new Compteurs(concept); 
  Compteur newEntity() => new Compteur(concept); 
  
} 
 
