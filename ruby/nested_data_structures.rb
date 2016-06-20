#My "real world construct" is a song, http://www.peterpaulandmary.com/music/17-07.htm

old_lady = {
  status: 'Alive and well, of course',
  horse: true,
  cow: {
    status: 'I don\'t know how',
    organs: [ 'liver', 'kidney', 'heart', 'stomach', 'cud' ],
    goat: {
      status: 'Opened her throat and down went the goat!',
      organs: [ 'liver', 'kidney', 'heart', 'stomach' ],
      dog: {
        status: 'What a hog',
        organs: [ 'liver', 'kidney', 'heart', 'stomach' ],
        cat: {
          status: 'Imagine that',
          organs: [ 'liver', 'kidney', 'heart', 'stomach', 'hairball' ],
          bird: {
            status: 'How absurd',
            organs: [ 'liver', 'kidney', 'heart', 'stomach', 'pebble' ],
            spider: {
              status: 'Wriggled and jiggled and tickled inside',
              organs: [ 'heart', 'stomach', 'silk_gland', 'book_lung' ],
              fly: {
                status: 'I don\t know why',
                organs: [ 'wings', 'stomach', 'compound_eyes', 'mouthparts' ],
              }
            }
          }
        }
      }
    }
  }
}

p old_lady[:cow][:goat][:dog][:cat][:organs] | old_lady[:cow][:goat][:dog][:cat][:bird][:spider][:organs]

p old_lady[:cow][:goat][:dog][:cat][:bird][:spider][:status]

p old_lady[:cow][:goat][:dog][:cat][:bird][:spider][:fly][:organs][2]