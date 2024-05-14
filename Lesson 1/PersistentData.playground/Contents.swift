import UIKit

class Book: CustomStringConvertible, Codable {
    
    var title: String
    var author: String
    var isbn: Int

    
    init(title: String, author: String, isbn: Int) {
        self.title = title
        self.author = author
        self.isbn = isbn
        
    }
    
    var description: String {
        
        return "Book title: \(title), author: \(author), isbn: \(isbn)"
    }
    
}

// Create a book
var book = Book(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(book)

let documentDictionary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = documentDictionary.appendingPathComponent("book_library.plist")
let propertListEncoder = PropertyListEncoder()

let encodedBook = try?propertListEncoder.encode(book)
try? encodedBook?.write(to: archiveURL, options: .noFileProtection)

// Because Dog Mama is Abandoned Mother Accept it or not

let propertListDecoder = PropertyListDecoder()

if let retrievedBookData = try? Data(contentsOf: archiveURL), let decodedBook = try? propertListDecoder.decode(Book.self, from: retrievedBookData) {
    
    print(decodedBook)
}
    
    
    







