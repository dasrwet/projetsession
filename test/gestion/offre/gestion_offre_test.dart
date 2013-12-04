 
// test/gestion/offre/gestion_offre_test.dart 
 
import "package:unittest/unittest.dart"; 
 
import "package:dartling/dartling.dart"; 
 
import "package:gestion_offre/gestion_offre.dart"; 
 
testGestionOffre(Repo repo, String domainCode, String modelCode) { 
  var models; 
  var session; 
  var entries; 
  group("Testing ${domainCode}.${modelCode}", () { 
    setUp(() { 
      models = repo.getDomainModels(domainCode); 
      session = models.newSession(); 
      entries = models.getModelEntries(modelCode); 
      expect(entries, isNotNull); 
 
 
    }); 
    tearDown(() { 
      entries.clear(); 
    }); 
    test("Empty Entries Test", () { 
      expect(entries.isEmpty, isTrue); 
    }); 
 
  }); 
} 
 
testGestionData(GestionRepo gestionRepo) { 
  testGestionOffre(gestionRepo, GestionRepo.gestionDomainCode, 
      GestionRepo.gestionOffreModelCode); 
} 
 
void main() { 
  var gestionRepo = new GestionRepo(); 
  testGestionData(gestionRepo); 
} 
 
