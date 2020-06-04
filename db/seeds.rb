# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  { name: 'RS ABC' },
  { name: 'RS DEF' },
  { name: 'RS GHI' },
  { name: 'RS JKL' }
].each do |attributes|
  Hospital.find_or_initialize_by(name: attributes[:name]).update!(attributes)
end

[
  { name: 'Dr Doe' },
  { name: 'Dr John' },
  { name: 'Dr Foo' },
  { name: 'Dr Bar' },
  { name: 'Dr Anon' },
  { name: 'Dr Nobody' },
  { name: 'Dr X' },
  { name: 'Dr Y' }
].each do |attributes|
  Doctor.find_or_initialize_by(name: attributes[:name]).update!(attributes)
end

[
  { doctor: Doctor.find_by(name: 'Dr Doe'), hospital: Hospital.find_by(name: 'RS ABC') },
  { doctor: Doctor.find_by(name: 'Dr John'), hospital: Hospital.find_by(name: 'RS ABC') },
  { doctor: Doctor.find_by(name: 'Dr Foo'), hospital: Hospital.find_by(name: 'RS DEF') },
  { doctor: Doctor.find_by(name: 'Dr Bar'), hospital: Hospital.find_by(name: 'RS DEF') },
  { doctor: Doctor.find_by(name: 'Dr Anon'), hospital: Hospital.find_by(name: 'RS GHI') },
  { doctor: Doctor.find_by(name: 'Dr Nobody'), hospital: Hospital.find_by(name: 'RS GHI') },
  { doctor: Doctor.find_by(name: 'Dr X'), hospital: Hospital.find_by(name: 'RS JKL') },
  { doctor: Doctor.find_by(name: 'Dr Y'), hospital: Hospital.find_by(name: 'RS JKL') },
  { doctor: Doctor.find_by(name: 'Dr John'), hospital: Hospital.find_by(name: 'RS DEF') },
  { doctor: Doctor.find_by(name: 'Dr Anon'), hospital: Hospital.find_by(name: 'RS ABC') }
].each do |attributes|
  HospitalDoctor.find_or_create_by!(attributes)
end