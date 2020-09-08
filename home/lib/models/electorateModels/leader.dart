//Used to store data to fill leader's profile when selected from electorate view

class LeaderItem {
  LeaderItem(
      {this.picLink,
      this.name,
      this.house,
      this.party,
      this.elected,
      this.bio,
      this.electorate,
      this.power});
  String picLink;
  String name;
  String house;
  String party;
  bool elected;
  String bio;
  String electorate;
  String power;
}
