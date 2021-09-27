import 'package:fluro/fluro.dart';
import 'package:hc_deeplink/ui/comment_page.dart';
import 'package:hc_deeplink/ui/home_page.dart';
import 'package:hc_deeplink/ui/not_found_page.dart';

class RouteHandler {
  Handler rootPageRouteHandler() =>
      Handler(handlerFunc: (context, parameters) => HomePage());

  Handler commentPageRouteHandler() {
    return Handler(
      handlerFunc: (context, parameters) {
        final title = parameters['title']?.first;
        final url = parameters['url']?.first;
        final type = parameters['type']?.first;

        if (title != null && url != null && type != null) {
          return CommentPage(title: title, url: url, type: type);
        } else {
          return NotFoundPage();
        }
      },
    );
  }

  Handler notFound() =>
      Handler(handlerFunc: (context, parameters) => NotFoundPage());
}
