enum NewsType {
  home(displayName: "home"),
  sports(displayName: "sports");

  final String displayName;
  const NewsType({required this.displayName});
}
