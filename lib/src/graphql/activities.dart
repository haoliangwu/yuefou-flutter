import 'dart:async';

import 'package:yuefou_flutter/graphql_client/lib/graphql_dsl.dart';
import 'package:yuefou_flutter/src/graphql/client.dart' as GraphQL;

/*
 query ActivitiesQuery {
   activities {
      id
    	title
   }
 }
*/

class ActivitiesQuery extends Object with Fields implements GQLOperation {
  ActivitiesResolver activities = new ActivitiesResolver();

  @override
  String get type => queryType;

  @override
  String get name => 'ActivitiesQuery';

  @override
  List<GQLField> get fields => [activities];

  @override
  ActivitiesQuery clone() =>
      new ActivitiesQuery()..activities = activities.clone();
}

class ActivitiesResolver extends Object
    with Fields, Collection<ActivityResolver>
    implements GQLField {
  IdResolver id = new IdResolver();
  TitleResolver title = new TitleResolver();

  @override
  String get name => 'activities';

  List<GQLField> get fields => [id, title];

  @override
  ActivitiesResolver clone() => new ActivitiesResolver()
    ..id = id.clone()
    ..title = title.clone();

  @override
  ActivityResolver get collectionResolver => new ActivityResolver();
}

class ActivityResolver extends ActivitiesResolver
    with Fields
    implements GQLField {
  IdResolver id = new IdResolver();
  TitleResolver title = new TitleResolver();

  List<GQLField> get fields => [id, title];

  @override
  ActivityResolver clone() => new ActivityResolver()
    ..id = id.clone()
    ..title = title.clone();
}

class IdResolver extends Object with Scalar<String> implements GQLField {
  @override
  String get name => 'id';

  @override
  IdResolver clone() => new IdResolver();
}

class TitleResolver extends Object with Scalar<String> implements GQLField {
  @override
  String get name => 'title';

  @override
  TitleResolver clone() => new TitleResolver();
}

class ActivitiesService {
  final ActivitiesQuery query = new ActivitiesQuery();

  static ActivitiesService instance = new ActivitiesService._();
  ActivitiesService._();

  Future<ActivitiesQuery> list() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${GraphQL.apiToken}',
    };

    return GraphQL.client.execute<ActivitiesQuery, ActivityResolver>(
      query,
      variables: {},
      headers: headers,
    );
  }
}
