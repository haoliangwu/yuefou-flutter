import 'package:http/http.dart';
import 'package:graphql_client/graphql_client.dart';
import 'package:logging/logging.dart';

const endPoint = 'http://yuefou_dev.littlelyon.com/graphql';
// final apiToken = Platform.environment['GITHUBQL_TOKEN'];
const apiToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjamdvb2tlNzMzc2s3MDEyMHFuamlwaHFmIiwiaWF0IjoxNTI1MjQ1MjM2fQ.z6Tuv7W6hr4qmJ_c1RBJoZWNJsO2HoGfO-DKLI74Oc8';

// Logger.root // Optional
//     ..level = Level.ALL
//     ..onRecord.listen((rec) {
//       print('${rec.level.name}: ${rec.time}: ${rec.message}');
//     });
final GQLClient client = new GQLClient(client: Client(),logger: new Logger('GQLClient'), endPoint: endPoint);

