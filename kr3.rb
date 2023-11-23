mutex1 = Mutex.new
mutex2 = Mutex.new

# Перший потік
thread1 = Thread.new do
  (1..10).each do |i|
    mutex1.synchronize do
      puts "Потік 1: #{i}"
    end
    mutex2.synchronize { sleep(rand(0.1)) } # Випадкова затримка (ціле число) для додаткового перемішування виводу
  end
end

# Другий потік
thread2 = Thread.new do
  (1..10).each do |i|
    mutex1.synchronize { sleep(rand(0.1)) } # Випадкова затримка (ціле число) для додаткового перемішування виводу
    mutex2.synchronize do
      puts "Потік 2: #{i}"
    end
  end
end

# Завершення обох потоків
thread1.join
thread2.join