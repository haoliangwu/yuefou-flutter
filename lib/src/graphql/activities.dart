import 'dart:async';

import 'package:yuefou_flutter/src/graphql/client.dart' as GraphQL;
import 'package:graphql_client/graphql_dsl.dart';

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

class ActivitiesResolver extends Object with Fields implements GQLField {
  IdResolver id = new IdResolver();

  @override
  String get name => 'activities';

  // @override
  List<GQLField> get fields => [id];

  @override
  ActivitiesResolver clone() => new ActivitiesResolver()..id = id.clone();
}

class IdResolver extends Object with Scalar<String> implements GQLField {
  @override
  String get name => 'id';

  @override
  IdResolver clone() => new IdResolver();
}

class ActivitiesService {
  final ActivitiesQuery query = new ActivitiesQuery();

  static ActivitiesService instance = new ActivitiesService._();
  ActivitiesService._();

  Future<ActivitiesQuery> list() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GraphQL.apiToken}',
    };

    return GraphQL.client.execute(
      query,
      variables: {},
      headers: headers,
    );
  }
}
