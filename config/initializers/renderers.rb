class Array
  def to_label
    "Id,Name\n" + self.map(&:to_label).join("\n") + "\n"
  end
end
