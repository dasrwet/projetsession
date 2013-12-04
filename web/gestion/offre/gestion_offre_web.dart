 
// web/gestion/offre/gestion_offre_web.dart 
 
import "dart:html"; 
 
import "package:dartling/dartling.dart"; 
import "package:dartling_default_app/dartling_default_app.dart"; 
 
import "package:gestion_offre/gestion_offre.dart"; 
 
initGestionData(GestionRepo gestionRepo) { 
   var gestionModels = 
       gestionRepo.getDomainModels(GestionRepo.gestionDomainCode); 
 
   var gestionOffreEntries = 
       gestionModels.getModelEntries(GestionRepo.gestionOffreModelCode); 
   initGestionOffre(gestionOffreEntries); 
   gestionOffreEntries.display(); 
   gestionOffreEntries.displayJson(); 
} 
 
showGestionData(GestionRepo gestionRepo) { 
   var mainView = new View(document, "main"); 
   mainView.repo = gestionRepo; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var gestionRepo = new GestionRepo(); 
  initGestionData(gestionRepo); 
  showGestionData(gestionRepo); 
} 
 
