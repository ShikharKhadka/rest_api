enum NewsType {
  home(displayName: "politics"),
  sports(displayName: "sports");

  final String displayName;
  const NewsType({required this.displayName});
}
