FILENAME = './romeo_and_juliet.txt'.freeze
FILTER_WORDS = ['and', 'the', 'i', 'is', 'of', 'to', 'a', 'me', 'my', 'he', 'his', 'she', 'her', 'not',
                'for', 'this', 'that', 'in', 'you', 'with', 'it', 'what', 'when', 'o', 'as'].freeze

def unique_words(filename)
    File.read(filename).downcase.gsub(/[^a-z]/, ' ').split
rescue
    puts "The file #{filename} does not exit."
    exit
end

def count_words(words)
    word_counts = {}
    words.each do |word|
        word_counts[word] = 0 unless word_counts[word]
        word_counts[word] += 1
    end

    word_counts
end

def clean_word_counts!(word_counts)
    word_counts
        .sort_by { |_, count| count }
        .reverse
        .delete_if { |word, _| FILTER_WORDS.include?(word) }
        .take(10)
end

words = unique_words(FILENAME)
word_counts = count_words(words)

puts clean_word_counts!(word_counts)
