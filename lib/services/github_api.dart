import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github/github.dart';
// import 'package:github/server.dart';

GitHub githubClient;
// GitHub githubClient = GitHub(
//   auth: Authentication.withToken(DotEnv().env["GITHUB_PERSONAL_ACCESS_TOKEN"]),
// );

GitHub gitGithubApiClient({username, password, token}) {
  if (username != null && password != null) {
    return GitHub(auth: Authentication.basic(username, password));
  } else if (token != null) {
    return GitHub(
      auth: Authentication.withToken(
          DotEnv().env["GITHUB_PERSONAL_ACCESS_TOKEN"]),
    );
  } else {
    throw GitHubError(null, "error");
  }
}
