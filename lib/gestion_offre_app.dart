 
// lib/gestion_offre_app.dart 
 
/*
http://opensource.org/licenses/

http://en.wikipedia.org/wiki/BSD_license
3-clause license ("New BSD License" or "Modified BSD License")

Copyright (c) 2012, dartling project authors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the dartling nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
 
 
library gestion_offre_app; 
 
import "dart:convert";
import "dart:html"; 
import 'dart:async';
//import "dart:convert";
import 'dart:math';
 
import "package:dartling/dartling.dart"; 
//import "package:dartling_default_app/dartling_default_app.dart"; 
 
import "package:gestion_offre/gestion_offre.dart"; 

// added by hand
import 'package:dart_web_toolkit/ui.dart' as ui;
//import 'package:dart_web_toolkit/util.dart' as util;
import 'package:dart_web_toolkit/event.dart' as event;
import 'package:dart_web_toolkit/i18n.dart' as i18n;



// Application source code
part 'app/principale.dart';
part 'app/mestests.dart';
part 'app/GestionCritere.dart';
part 'app/GestionActivite.dart';
part 'app/GestionEntreprise.dart';
part 'app/GestionEvaluation.dart';
part 'app/GestionOffres.dart';
//part 'app/GestionContrainte.dart';
part 'app/Analyse.dart';
part 'app/Admin.dart';
part 'app/board.dart';
part 'util/color.dart';
part 'util/random.dart';

 
