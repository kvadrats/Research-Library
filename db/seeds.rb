# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all

Post.create(title: 'Something but actually nothing',
	description: 'There is actually nothing here, tis but a simple test',
	articlelink: 'http://america.aljazeera.com/articles/2015/3/17/clinical-trial-approved-for-mdma-psychotherapy.html',
	researchlink: 'http://america.aljazeera.com/articles/2015/3/17/clinical-trial-approved-for-mdma-psychotherapy.html',
	articleauth: 'Litte Timmy',
	researchauth: 'Big Jimmy',
	researchdate: '2016-05-02')

Category.create(name: 'Psychology')
