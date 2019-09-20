# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Following.destroy_all
Tag.destroy_all
Song.destroy_all
SongTag.destroy_all

User.create(username: 'rothberry', name: 'phil', password: '123', location: 'Kzoo', bio: 'sup')
User.create(username: 'graceo', name: 'grace', password: '123', location: 'Chicago', bio: 'sup')
User.create(username: 'mal', name: 'malisa', password: '123', location: 'Chicago', bio: 'sup')
User.create(username: 'c-lim', name: 'christian', password: '123', location: 'Chicago', bio: 'sup')
User.create(username: 'bruceo', name: 'bruce', password: '123', location: 'Chicago', bio: 'sup')

Following.create(followed_id: 1, follower_id: 2)
Following.create(followed_id: 1, follower_id: 3)
Following.create(followed_id: 1, follower_id: 4)
Following.create(followed_id: 1, follower_id: 5)
Following.create(followed_id: 2, follower_id: 1)
Following.create(followed_id: 2, follower_id: 3)
Following.create(followed_id: 3, follower_id: 5)

Tag.create(name: 'ableton')
Tag.create(name: 'loop')
Tag.create(name: 'one_shot')
Tag.create(name: 'wip')

Song.create(title: 'Banger 1', user_id: 1, genre: 'Trap', description: 'it\'s lit')
Song.create(title: 'Yollow Me home', user_id: 2, genre: 'House', description: 'idk, my bff jill')
Song.create(title: 'Stairway to Seven', user_id: 3, genre: 'Trap', description: 'wowowowowowowow')
Song.create(title: 'Banger 2', user_id: 1, genre: 'Trap', description: 'fire emoji')

SongTag.create(song_id: 1, tag_id: 1)
SongTag.create(song_id: 1, tag_id: 2)
SongTag.create(song_id: 2, tag_id: 3)
SongTag.create(song_id: 2, tag_id: 3)
SongTag.create(song_id: 3, tag_id: 1)
SongTag.create(song_id: 3, tag_id: 3)
SongTag.create(song_id: 4, tag_id: 3)
SongTag.create(song_id: 4, tag_id: 4)