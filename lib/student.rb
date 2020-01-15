class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_accessor :grade, :name
  attr_reader :id
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE students(
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    );")
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE students;")
  end

  def save
    @id = 1
    sql = "INSERT INTO students (id, name, grade) VALUES (?,?,?)"
      DB[:conn].execute(sql, self.id, self.name, self.grade)
  end

  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
   
  end

end
