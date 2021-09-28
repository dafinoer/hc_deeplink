import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hc_deeplink/injector.dart';

class DynamicLinkApp {

  const DynamicLinkApp();

  factory DynamicLinkApp.created() => injector.get();

  DynamicLinkParameters _dynamicLinkParameter() {
    final dynamicLinkParam = DynamicLinkParameters(
      uriPrefix: 'https://dafinrs.page.link',
      link: Uri.parse('https://dafinrs.github.io'),
    );
    return dynamicLinkParam;
  }

  Future<Uri> createdLongDynamicLink() async {
    final dynamicParamResult = _dynamicLinkParameter();
    final dynamicUri = await dynamicParamResult.buildUrl();
    return dynamicUri;
  }

  Future<Uri> createdShortDynamicLink() async {
    final dynamicParamResult = _dynamicLinkParameter();
    final dynamicShortUri = await dynamicParamResult.buildShortLink();
    return dynamicShortUri.shortUrl;
  }

  Future<Uri?> getLinkFirebaseDynamicLink() async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    return deepLink;
  }
}
