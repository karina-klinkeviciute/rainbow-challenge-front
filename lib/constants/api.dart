import 'package:rainbow_challenge/constants/app.dart';

class Api {
  static const String baseUrl = 'https://rainbowchallenge.lt';

// Messages
  static const String messagesEndpoint = "/api/message/";

// Regions
  static const String regionsEndpoint = "/api/results/region/";

// Files
  static const String fileUploadEndpoint =
      "/api/concrete_joined_challenge_file_upload/";
  static const String fileListEndpoint =
      "/api/concrete_joined_challenge_file_list/";

  // News
  static const String newsEndpoint = '/api/news/';
  // Prizes
  static const String prizesEndpoint = '/api/results/available_prize/';
  static const String claimPrizesEndpoint = '/api/results/claimed_prize/';
  // Challenges
  static const String challengeEndpoint = '/api/challenge/challenge/';
  static const String challengeArticleEndpoint =
      '​/api​/challenge/article_challenge​/';
  static const String challengeCustomEndpoint =
      '​/api​/challenge/custom_challenge​/';
  static const String challengeEventOrganizerEndpoint =
      '​/api​/challenge/event_organizer_challenge​/';
  static const String challengeEventParticipantEndpoint =
      '/api/challenge/event_participant_challenge/';
  static const String challengeProjectEndpoint =
      '​/api​/challenge/project_challenge​/';
  static const String challengeQuizEndpoint = '/api/challenge/quiz_challenge/';
  static const String challengeReactingEndpoint =
      '/api/challenge/reacting_challenge/';
  static const String challengeSchoolGsaEndpoint =
      '​/api​/challenge/school_gsa_challenge​/';
  static const String challengeSupportEndpoint =
      '/api/challenge/support_challenge/';
  static const String challengeStoryEndpoint =
      '​/api​/challenge/story_challenge​/';
  static const String challengeGetRightAnswer =
      "https://rainbowchallenge.lt/api/joined_challenge/user_answer/";

// Joined Challenges
  static const String joinedChallengeArticleEndpoint =
      '/api/joined_challenge/article_joined_challenge/';
  static const String joinedChallengeCustomEndpoint =
      '/api/joined_challenge/custom_joined_challenge/';
  static const String joinedChallengeEventOrganizerEndpoint =
      '​/api​/joined_challenge​/event_organizer_joined_challenge​/';
  static const String joinedChallengeEventParticipantEndpoint =
      '​api​/joined_challenge​/event_participant_joined_challenge​/';
  static const String joinedChallengeProjectEndpoint =
      '/api/joined_challenge/project_joined_challenge/';
  static const String joinedChallengeQuizEndpoint =
      '​/api​/joined_challenge​/quiz_joined_challenge​/';
  static const String joinedChallengeReactingEndpoint =
      '/api/joined_challenge/reacting_joined_challenge/';
  static const String joinedChallengeSchoolGsaEndpoint =
      '/api/joined_challenge/school_gsa_joined_challenge/';
  static const String joinedChallengeStoryEndpoint =
      '​/api​/joined_challenge​/story_joined_challenge​/';
  static const String joinedChallengeSupportEndpoint =
      '​/api​/joined_challenge​/support_joined_challenge​/';

  // Challenge types from backend
  static const challengeTypeArticle = "article";
  static const challengeTypeCustom = "custom";
  static const challengeTypeEvent = "event";
  static const challengeTypeEventOrg = "event_org";
  static const challengeTypeProject = "project";
  static const challengeTypeQuiz = "quiz";
  static const challengeTypeReacting = "reacting";
  static const challengeTypeSchoolGsa = "school_gsa";
  static const challengeTypeStory = "story";
  static const challengeTypeSupport = "support";

  // Challenge type subPaths from backend
  static const challengeTypeArticleSubPath = "article";
  static const challengeTypeCustomSubPath = "custom";
  static const challengeTypeEventParticipantSubPath = "event_participant";
  static const challengeTypeEventOrganizerSubPath = "event_organizer";
  static const challengeTypeProjectSubPath = "project";
  static const challengeTypeQuizSubPath = "quiz";
  static const challengeTypeReactingSubPath = "reacting";
  static const challengeTypeSchoolGsaSubPath = "school_gsa";
  static const challengeTypeStorySubPath = "story";
  static const challengeTypeSupportSubPath = "support";

  // Get endpoints for Challenge types. Used when we know challenge type from
  // the backend and need to use a suitable API endpoint for it.
  String getChallengeTypeEndpoint(challengeType) {
    switch (challengeType) {
      case Api.challengeTypeArticle:
        return Api.challengeArticleEndpoint;

      case Api.challengeTypeCustom:
        return Api.challengeCustomEndpoint;

      case Api.challengeTypeEvent:
        return Api.challengeEventParticipantEndpoint;

      case Api.challengeTypeEventOrg:
        return Api.challengeEventOrganizerEndpoint;

      case Api.challengeTypeProject:
        return Api.challengeProjectEndpoint;

      case Api.challengeTypeQuiz:
        return Api.challengeQuizEndpoint;

      case Api.challengeTypeReacting:
        return Api.challengeReactingEndpoint;

      case Api.challengeTypeSchoolGsa:
        return Api.challengeSchoolGsaEndpoint;

      case Api.challengeTypeStory:
        return Api.challengeStoryEndpoint;

      case Api.challengeTypeSupport:
        return Api.challengeSupportEndpoint;

      default:
        return Api.challengeEndpoint;
    }
  }

  // Get endpoints for joined Challenge types. Used when we know challenge type from
  // the backend and need to use a suitable API endpoint for it.
  String getJoinedChallengeTypeEndpoint(challengeType) {
    switch (challengeType) {
      case Api.challengeTypeArticle:
        return Api.joinedChallengeArticleEndpoint;

      case Api.challengeTypeCustom:
        return Api.joinedChallengeCustomEndpoint;

      case Api.challengeTypeEvent:
        return Api.joinedChallengeEventParticipantEndpoint;

      case Api.challengeTypeEventOrg:
        return Api.joinedChallengeEventOrganizerEndpoint;

      case Api.challengeTypeProject:
        return Api.joinedChallengeProjectEndpoint;

      case Api.challengeTypeQuiz:
        return Api.joinedChallengeQuizEndpoint;

      case Api.challengeTypeReacting:
        return Api.joinedChallengeReactingEndpoint;

      case Api.challengeTypeSchoolGsa:
        return Api.joinedChallengeSchoolGsaEndpoint;

      case Api.challengeTypeStory:
        return Api.joinedChallengeStoryEndpoint;

      case Api.challengeTypeSupport:
        return Api.joinedChallengeSupportEndpoint;

      default:
        return Api.challengeEndpoint;
    }
  }

  // Get subpath for Challenge type endpoints. Used when we know challenge type from
  // the backend and need to use a suitable API endpoint for it.
  String getChallengeTypeSubPath(challengeType) {
    switch (challengeType) {
      case Api.challengeTypeArticle:
        return Api.challengeTypeArticleSubPath;

      case Api.challengeTypeCustom:
        return Api.challengeTypeCustomSubPath;

      case Api.challengeTypeEvent:
        return Api.challengeTypeEventParticipantSubPath;

      case Api.challengeTypeEventOrg:
        return Api.challengeTypeEventOrganizerSubPath;

      case Api.challengeTypeProject:
        return Api.challengeTypeProjectSubPath;

      case Api.challengeTypeQuiz:
        return Api.challengeTypeQuizSubPath;

      case Api.challengeTypeReacting:
        return Api.challengeTypeReactingSubPath;

      case Api.challengeTypeSchoolGsa:
        return Api.challengeTypeSchoolGsaSubPath;

      case Api.challengeTypeStory:
        return Api.challengeTypeStorySubPath;

      case Api.challengeTypeSupport:
        return Api.challengeTypeSupportSubPath;

      default:
        return Api.challengeEndpoint;
    }
  }

  // Get named route of the Challenge type
  String getChallengeTypeRoute(challengeType) {
    switch (challengeType) {
      case Api.challengeTypeArticle:
        return AppRoute.challengeArticle;

      case Api.challengeTypeCustom:
        return AppRoute.challengeCustom;

      case Api.challengeTypeEvent:
        return AppRoute.challengeEventParticipant;

      case Api.challengeTypeEventOrg:
        return AppRoute.challengeEventOrganizer;

      case Api.challengeTypeProject:
        return AppRoute.challengeProject;

      case Api.challengeTypeQuiz:
        return AppRoute.challengeQuiz;

      case Api.challengeTypeReacting:
        return AppRoute.challengeReacting;

      case Api.challengeTypeSchoolGsa:
        return AppRoute.challengeSchoolGsa;

      case Api.challengeTypeStory:
        return AppRoute.challengeStory;

      case Api.challengeTypeSupport:
        return AppRoute.challengeSupport;

      default:
        return AppRoute.home;
    }
  }
}
