part of gestion_offre; 
 
// lib/gestion/offre/entreprises.dart 
 
class Entreprise extends EntrepriseGen { 
 
  Entreprise(Concept concept) : super(concept); 
 
  Entreprise.withId(Concept concept, String numentreprise) : 
    super.withId(concept, numentreprise); 
 
} 
 
class Entreprises extends EntreprisesGen { 
 
  Entreprises(Concept concept) : super(concept); 
 
} 
 
