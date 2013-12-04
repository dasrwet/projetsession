 
// test/gestion/offre/gestion_offre_gen.dart 
 
import "package:dartling/dartling.dart"; 
 
import "package:gestion_offre/gestion_offre.dart"; 
 
genCode() { 
  var repo = new Repo(); 
 
  var gestionDomain = new Domain("Gestion"); 
 
  Model gestionOffreModel = 
      fromJsonToModel(gestionOffreModelJson, gestionDomain, "Offre"); 
 
  repo.domains.add(gestionDomain); 
 
  repo.gen("gestion_offre"); 
} 
 
initGestionData(GestionRepo gestionRepo) { 
   var gestionModels = 
       gestionRepo.getDomainModels(GestionRepo.gestionDomainCode); 
 
   var gestionOffreEntries = 
       gestionModels.getModelEntries(GestionRepo.gestionOffreModelCode); 
   initGestionOffre(gestionOffreEntries); 
   gestionOffreEntries.display(); 
   gestionOffreEntries.displayJson(); 
} 
 
void main() { 
  genCode(); 
 
  var gestionRepo = new GestionRepo(); 
  initGestionData(gestionRepo); 
} 
 
