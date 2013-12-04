part of gestion_offre; 
 
// lib/gen/gestion/models.dart 
 
class GestionModels extends DomainModels { 
 
  GestionModels(Domain domain) : super(domain) { 
    add(fromJsonToOffreEntries()); 
  } 
 
  OffreEntries fromJsonToOffreEntries() { 
    return new OffreEntries(fromJsonToModel( 
      gestionOffreModelJson, 
      domain, 
      GestionRepo.gestionOffreModelCode)); 
  } 
 
} 
 
