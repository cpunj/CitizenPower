//Used for storing the relevant data needed for leader profile lists in electorate view

class LeaderItem {
  LeaderItem({
    this.picLink,
    this.name,
    this.house,
    this.party,
    this.elected,
  });
  String picLink;
  String name;
  String house;
  String party;
  bool elected;
}
