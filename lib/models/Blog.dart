class Blog {
  final String date, title, description, image;

  Blog(
      {required this.date,
      required this.title,
      required this.description,
      required this.image});
}

List<Blog> blogPosts = [
  Blog(
    date: "By: Pam Carrol   •   26 August 2015   •   10:40",
    image: "assets/png/Thumbnail.png",
    title: "How Ireland’s biggest bank executed a comp lete security redesign",
    description:
        "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "By: Pam Carrol   •   26 August 2015   •   10:40",
    image: "assets/png/Thumbnail (1).png",
    title: "5 Examples of Web Motion Design That Really Catch Your Eye",
    description:
        "Web animation has become one of the most exciting web design trends in 2020. It breathes more life into a website and makes user interactions even more appealing and intriguing. Animation for websites allows introducing a brand in an exceptionally creative way in modern digital space. It helps create a lasting impression, make a company",
  ),
];
