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
        
        return "Book Title \(title), author: \(author), ISBN: \(isbn)"
        
    }
    
}

// Create a book
var book = Book(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(book)

let propertyListEncoder = PropertyListEncoder()
if let encodedBook = try? propertyListEncoder.encode(book) {
    print(encodedBook)
    let propertyListDecoder = PropertyListDecoder()
    
    if let decodedBook = try? propertyListDecoder.decode(Book.self, from: encodedBook) {
        
        print(decodedBook)
    }
        
}


