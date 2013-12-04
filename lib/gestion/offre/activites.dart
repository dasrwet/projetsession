part of gestion_offre; 
 
// lib/gestion/offre/activites.dart 
 
class Activite extends ActiviteGen { 
 
  Activite(Concept concept) : super(concept); 
 
  Activite.withId(Concept concept, String numactivite) : 
    super.withId(concept, numactivite); 
 
} 
 
class Activites extends ActivitesGen { 
 
  Activites(Concept concept) : super(concept); 
 
} 
 
