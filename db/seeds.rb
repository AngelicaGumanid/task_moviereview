movies = [
  {
    title: "Harry Potter and the Philosopher's Stone",
    blurb: "A young boy discovers he is a wizard and attends Hogwarts School of Witchcraft and Wizardry.",
    date_released: "2001-11-16",
    country_of_origin: "UK",
    showing_start: "2024-10-15",
    showing_end: "2025-12-31",
    genre_ids: [4, 1],
    user_id: 1
  },
  {
    title: "Harry Potter and the Chamber of Secrets",
    blurb: "Harry returns for his second year at Hogwarts and faces a new danger from an ancient secret.",
    date_released: "2002-11-15",
    country_of_origin: "UK",
    showing_start: "2024-11-01",
    showing_end: "2025-12-31",
    genre_ids: [4, 1],
    user_id: 1
  },
  {
    title: "Twilight",
    blurb: "A teenage girl falls in love with a vampire, leading to a love triangle with a werewolf.",
    date_released: "2008-11-21",
    country_of_origin: "USA",
    showing_start: "2024-10-01",
    showing_end: "2025-12-31",
    genre_ids: [6, 3],
    user_id: 1
  },
  {
    title: "Twilight: New Moon",
    blurb: "Bella faces heartbreak after Edward leaves her, and finds solace in her friendship with Jacob.",
    date_released: "2009-11-20",
    country_of_origin: "USA",
    showing_start: "2024-10-01",
    showing_end: "2025-12-31",
    genre_ids: [6, 3],
    user_id: 1
  },
  {
    title: "Despicable Me",
    blurb: "A supervillain adopts three orphan girls and discovers the joys of fatherhood.",
    date_released: "2010-07-09",
    country_of_origin: "USA",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [2, 4],
    user_id: 1
  },
  {
    title: "Despicable Me 2",
    blurb: "Gru is recruited by the Anti-Villain League to help deal with a powerful new super criminal.",
    date_released: "2013-07-03",
    country_of_origin: "USA",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [2, 4],
    user_id: 1
  },
  {
    title: "My Neighbor Totoro",
    blurb: "Two girls move to the countryside and meet magical creatures, including the giant Totoro.",
    date_released: "1988-04-16",
    country_of_origin: "Japan",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [4, 3],
    user_id: 1
  },
  {
    title: "Spirited Away",
    blurb: "A young girl becomes trapped in a mysterious spirit world and must find a way to rescue her parents.",
    date_released: "2001-07-20",
    country_of_origin: "Japan",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [4, 3],
    user_id: 1
  },
  {
    title: "Your Name",
    blurb: "Two teenagers discover they are mysteriously swapping bodies and must navigate each other's lives.",
    date_released: "2016-08-26",
    country_of_origin: "Japan",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [6, 4],
    user_id: 1
  },
  {
    title: "Weathering With You",
    blurb: "A boy meets a girl who can control the weather, leading to extraordinary events in Tokyo.",
    date_released: "2019-07-19",
    country_of_origin: "Japan",
    showing_start: "2024-10-20",
    showing_end: "2025-12-31",
    genre_ids: [6, 4],
    user_id: 1
  },
  {
    title: "Parasite",
    blurb: "A poor family schemes to become employed by a wealthy family, leading to unexpected consequences.",
    date_released: "2019-05-30",
    country_of_origin: "South Korea",
    showing_start: "2024-11-15",
    showing_end: "2025-12-31",
    genre_ids: [3, 5],
    user_id: 1
  },
  {
    title: "Train to Busan",
    blurb: "A zombie outbreak erupts in South Korea, and passengers on a train must survive.",
    date_released: "2016-07-20",
    country_of_origin: "South Korea",
    showing_start: "2024-10-15",
    showing_end: "2024-12-05",
    genre_ids: [1, 3],
    user_id: 1
  },
  {
    title: "Miracle in Cell No. 7",
    blurb: "A man with intellectual disabilities is wrongfully imprisoned, and his cellmates help him reunite with his daughter.",
    date_released: "2013-01-23",
    country_of_origin: "South Korea",
    showing_start: "2024-10-25",
    showing_end: "2024-12-10",
    genre_ids: [3],
    user_id: 1
  }
]

movies.each do |movie_data|
  Movie.create!(
    title: movie_data[:title],
    blurb: movie_data[:blurb],
    date_released: movie_data[:date_released],
    country_of_origin: movie_data[:country_of_origin],
    showing_start: movie_data[:showing_start],
    showing_end: movie_data[:showing_end],
    genre_ids: movie_data[:genre_ids],
    user_id: movie_data[:user_id]
  )
end