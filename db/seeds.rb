# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
Category.delete_all
Subcategory.delete_all

Category.create(name: 'Psychology')
Category.create(name: 'Neuroscience')
Category.create(name: 'Physics')
  
Subcategory.create(name: "Behavioral Neuroscience", category_id: Category.find_by(name: "Neuroscience").id)
Subcategory.create(name: "Conciousness", category_id: Category.find_by(name: "Psychology").id)
Subcategory.create(name: "PSI", category_id: Category.find_by(name: "Psychology").id)
Subcategory.create(name: "Spaghetti", category_id: Category.find_by(name: "Neuroscience").id)

Post.create(title: 'Use of MDMA in theraphy',
	description: 'DEA has finally approved the use of MDMA in theraphy, in this journal post we can see why, what are the effects of MDMA.',
	researchlink: 'http://jop.sagepub.com/content/early/2015/02/25/0269881114568039.full',
	researchauth: 'Pål-Ørjan Johansen and Teri Suzanne Krebs',
	researchdate: '2015-03-05',
	subcategory_id: '1',
	user_id: '1')
Post.create(title: 'Phantom Vibrations',
	description: 'Research is about how our phones make us hallucinate a vibration every now and then, why it is this way.',
	researchlink: 'http://www.sciencedirect.com/science/article/pii/S0747563212000799',
	researchauth: 'Michelle Drouin, Daren H. Kaiser, Daniel A. Miller',
	researchdate: '2012-03-13',
	subcategory_id: '1',
	user_id: '1')
