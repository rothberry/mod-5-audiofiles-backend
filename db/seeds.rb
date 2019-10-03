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

rothberry = User.new(username: 'rothberry', name: 'phil', password: '123', location: 'Kzoo', bio: 'sup', img_url: '', facebook_url: 'https://www.facebook.com/Rothberry-Music-266464367571291/', twitter_url: 'https://twitter.com/rothberry_', soundcloud_url: 'https://soundcloud.com/rothberry')
graceo = User.new(username: 'graceo', name: 'grace', password: '123', location: 'Chicago', bio: 'sup')
mal = User.new(username: 'mal', name: 'malisa', password: '123', location: 'Chicago', bio: 'sup')
clim = User.new(username: 'c-lim', name: 'christian', password: '123', location: 'Chicago', bio: 'sup')
bruceo = User.new(username: 'bruceo', name: 'bruce', password: '123', location: 'Chicago', bio: 'sup')
rothberry.save
graceo.save
mal.save
clim.save
bruceo.save

Following.create(followed_id: rothberry.id, follower_id: graceo.id)
Following.create(followed_id: rothberry.id, follower_id: mal.id)
Following.create(followed_id: rothberry.id, follower_id: clim.id)
Following.create(followed_id: rothberry.id, follower_id: bruceo.id)
Following.create(followed_id: graceo.id, follower_id: rothberry.id)
Following.create(followed_id: graceo.id, follower_id: mal.id)
Following.create(followed_id: mal.id, follower_id: bruceo.id)

tag_arr = %w(ableton loop one_shot wip reaper fl_studio pro_tools synth sample drum_loop field_sample edit live logic cubase push massive sylenth analog wobble dub)
tag_arr.each do |tag|
  Tag.create(name: tag)  
end
# Tag.create(name: 'ableton')
# Tag.create(name: 'loop')
# Tag.create(name: 'one_shot')
# Tag.create(name: 'wip')

# Banger_1 = Song.new(title: 'Banger 1', user_id: rothberry.id, genre: 'Trap', description: 'it\'s lit')
# Yollow = Song.new(title: 'Yollow Me home', user_id: graceo.id, genre: 'House', description: 'idk, my bff jill')
# Stairway = Song.new(title: 'Stairway to Seven', user_id: mal.id, genre: 'Trap', description: 'wowowowowowowow')
# Banger_2 = Song.new(title: 'Banger 2', user_id: rothberry.id, genre: 'Trap', description: 'fire emoji')
# Banger_1.save
# Yollow.save
# Stairway.save
# Banger_2.save

# SongTag.create(song_id: Banger_1.id, tag_id: ableton.id)
# SongTag.create(song_id: Banger_1.id, tag_id: loop_one.id)
# SongTag.create(song_id: Yollow.id, tag_id: one_shot.id)
# SongTag.create(song_id: Yollow.id, tag_id: one_shot.id)
# SongTag.create(song_id: Stairway.id, tag_id: ableton.id)
# SongTag.create(song_id: Stairway.id, tag_id: one_shot.id)
# SongTag.create(song_id: Banger_2.id, tag_id: one_shot.id)
# SongTag.create(song_id: Banger_2.id, tag_id: wip.id)