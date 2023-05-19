# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

CSV.foreach(Rails.root.join('volcano.csv'), headers: true) do |row|
    Volcano.create!(
        volcano_id: row['VolcanoID'],
        volcano_name: row['V_Name'],
        country: row['Country'],
        region: row['Region'],
        subregion: row['Subregion'],
        latitude: row['Latitude'],
        longitude: row['Longitude'],
        pei: row['PEI'],
        h_active: row['H_active'],
        vei_holoce: row['VEI_Holoce'],
        hazard: row['hazard'],
        classification: row['class'],
        risk: row['risk']
    )
end