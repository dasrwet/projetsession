import 'package:gestion_offre/gestion_offre_app.dart';
import 'package:gestion_offre/gestion_offre.dart';

void main() {
  var repo = new GestionRepo();
  var domain = repo.getDomainModels('Gestion');
  new Principale(domain);
}