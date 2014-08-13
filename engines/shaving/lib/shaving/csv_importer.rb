require 'csv'

module Shaving
  class CsvImporter

    class << self
      attr_accessor :user

      def ask prompt
        puts prompt
        STDIN.gets
      end

      def comments a, b
        a = '' if a.nil?
        b = '' if b.nil?

        a + b
      end

      def find_product name, type
        product = Shaving::Product.find_by name: name

        unless product.nil?
          puts "Found product #{ product.name }"
        end

        if product.nil?
          brand = ask "What is the brand for the product #{ name }?"

          product = {
            name: name,
            type: Shaving::Type.find_by(name: type),
            brand: Shaving::Brand.find_or_create_by(name: brand, user: @user),
            user: @user
          }

          product = Shaving::Product.create product
        end

        product
      end

      def make_reviews row, blade, soap
        date = Date.strptime row[0], "%m/%d/%Y"

        blade_review = {
          reviewed_on: date,
          shaving_feel: row[3],
          face_feel: row[4],
          overall_rating: row[5],
          comments: comments(row[6], row[7]),
          product: blade,
          user: @user
        }

        Shaving::Review.create blade_review

        soap_review = {
          reviewed_on: date,
          shaving_feel: row[10],
          face_feel: row[11],
          overall_rating: row[12],
          comments: comments(row[13], row[14]),
          product: soap,
          user: @user
        }

        Shaving::Review.create soap_review
      end

      def process_row row
        blade = find_product row[1], 'Blade'
        soap = find_product row[9], 'Soap'

        make_reviews row, blade, soap
      end

      def read file
        @user = User.find_by email: 'joshuaashby@joshashby.com'

        CSV.foreach file, :headers => true do |row|
          process_row row
        end

      rescue Errno::EISDIR
        puts "Error: Can't read in a directory"

      rescue Errno::ENOENT
        puts "Error: No file exists with name #{ file }"
      end
    end
  end
end
