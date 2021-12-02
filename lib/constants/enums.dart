enum ConnectionType {
  Wifi,
  Mobile,
}

// Synced with backend
enum ChallengeType {
  quiz,
  article,
  event,
  custom,
  school_gsa,
  event_org,
  story,
  project,
  reacting,
  support
}

extension ChallengeTypeString on ChallengeType {
  static final names = {
//  ChallengeType.article: AppLocalizations.of(context)!.challenge_type_article,
    ChallengeType.article: "article",
    ChallengeType.custom: "custom",
    ChallengeType.event: "event",
    ChallengeType.event_org: "event_org",
    ChallengeType.project: "project",
    ChallengeType.quiz: "quiz",
    ChallengeType.reacting: "reacting",
    ChallengeType.school_gsa: "school_gsa",
    ChallengeType.story: "story",
    ChallengeType.support: "support",
  };

  String? get name => names[this];
}

enum ChallengeStatus { joined, completed, cancelled, confirmed }

// Would be nice if this worked with localizations. We need context here...
/*
extension ChallengeTypeName on ChallengeType {
  static final names = {
//  ChallengeType.article: AppLocalizations.of(context)!.challenge_type_article,
    ChallengeType.article: "Straipsniai",
    ChallengeType.custom: "Įvairūs",
    ChallengeType.event: "Dalyvavimas renginiuose",
    ChallengeType.event_org: "Renginio organizavimas",
    ChallengeType.project: "Projekto įgyvendinimas",
    ChallengeType.quiz: "Žinių patikrinimas",
    ChallengeType.reacting: "Reagavimas į įvykius",
    ChallengeType.school_gsa: "Visuomenės informavimas",
    ChallengeType.story: "Pasidalink savo istorija",
    ChallengeType.support: "Parama",
    
  };

  String? get name => names[this];
}
*/