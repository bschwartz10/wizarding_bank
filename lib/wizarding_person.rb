class Person
attr_reader :name, :bank_accounts
attr_accessor :galleon
  def initialize(name, galleon)
    @name = name
    @galleon = galleon.to_i
    @bank_accounts = []
    "#{name} has been created with #{galleon} galleons in cash."
  end

end
