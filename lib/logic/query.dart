import 'package:graphql/client.dart';
import 'token.dart';

GraphQLClient getGithubGraphQLClient() {
  final Link _link = HttpLink(
    'https://api.github.com/graphql',
    defaultHeaders: {
      // ignore: undefined_identifier
      'Authorization': 'Bearer $personalAccessToken',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}

/// query example - fetch all your github repositories
Future<List<dynamic>> readRepositories() async {
  final GraphQLClient _client = getGithubGraphQLClient();

  const int nRepositories = 50;

  final QueryOptions options = QueryOptions(
    document: gql(
      r'''
        query ReadRepositories($nRepositories: Int!) {
          viewer {
            repositories(first: $nRepositories) {
                     nodes {
        name
        updatedAt
        
        readme: object(expression: "master:README.md") {
          ... on Blob {
            text
          }
        }
        licenseInfo {
          id
        }
        
        languages(first: 10) {
          nodes {
            name
          }
        }
      }
            }
          }
        }
      ''',
    ),
    variables: {
      'nRepositories': nRepositories,
    },
  );

  final QueryResult result = await _client.query(options);

  final List<dynamic> repositories =
      result.data['viewer']['repositories']['nodes'] as List<dynamic>;

  return repositories;
}
