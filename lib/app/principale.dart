part of gestion_offre_app;

/**
 * Todo Application entry point.
 */
class Principale {
  GestionModels domain;
  DomainSession session;
  //Contacts contacts;
  /*ui.CaptionPanel panelP = new ui.CaptionPanel("Gestion de contact");
  ui.CaptionPanel panelL = new ui.CaptionPanel("List");
  ui.CaptionPanel panelF = new ui.CaptionPanel("Formulaire");
  
 

  //Header header;
  //Footer footer;

  **
   * Create new instance of [TodoApp].
   */
 
  Principale(this.domain) {
    session = domain.newSession();
    OffreEntries model = domain.getModelEntries('Offre');
    DataBase.Start(model);
    //DataBase.drop(model);
    var contr =model.activites.first.contraintes.first;
    
    var rootPanel = ui.RootLayoutPanel.get();
    
    var vPanel = new ui.VerticalPanel();
    vPanel.spacing = 10;
    rootPanel.add(vPanel);
    var title = new ui.Label('Test');
    vPanel.add(title);
    //debalejson(model);
    //var todos = new MesTests(model);
    var todos = new GestionOffres(model);
    vPanel.add(todos);

    //header = new Header(this);
    //Todos todos = new Todos(this);
    //footer = new Footer(this, todos);

    //updateDisplay();
  }
  principale() {}

  /**
   * Save list of task to local storage.
   */
 // save() { 
  //  window.localStorage['todos-dartling-dwt'] = JSON.encode(contacts.toJson());
 // }

    saveAs(OffreEntries model) { 
    window.localStorage['compteurdb'] = JSON.encode(model.compteurs.toJson());
    window.localStorage['entreprisedb'] = JSON.encode(model.entreprises.toJson());
    window.localStorage['activitedb'] = JSON.encode(model.activites.toJson());
    window.localStorage['criteredb'] = JSON.encode(model.criteres.toJson());
 }
  /**
   * Update header and footer components on page.
   */
  debalejson(OffreEntries model)
  {
    String jsoncompteur = window.localStorage['compteurdb'];
    String jsonentreprise = window.localStorage['entreprisedb'];
    String jsonactivite = window.localStorage['activitedb'];
    String jsoncritere = window.localStorage['criteredb'];
    if (jsoncompteur != null && jsonentreprise != null && 
        jsonactivite != null && jsoncritere != null) {
      try {
        model.compteurs.fromJson(JSON.decode(jsoncompteur));
        model.entreprises.fromJson(JSON.decode(jsonentreprise));
        model.activites.fromJson(JSON.decode(jsonactivite));
        model.criteres.fromJson(JSON.decode(jsoncritere));
      } on Exception catch(e) {
        print(e);
      }
     }
  }
  
  updateDisplay(OffreEntries model) {
    model.activites.clear();
    model.entreprises.clear();
    model.criteres.clear();
    model.compteurs.clear();
    saveAs(model);
  }
}

