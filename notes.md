This app should have the following major models:

Nomads - who have a secure login[ie: password_digest], name, has_many :residences [features: address, deposit paid, and belongs_to a :landlord]
                                        has_many :roommates, through: :residences [features: name, address]
                                        has_many :nomad_to_roommate_loans [features: amount]
                                        has_many :roommate_to_nomad_loans [features: amount]
                                        has_many :landlords [features: name, has_many: residences, has_many :nomads, through: :residences], through: :residences

Roommates - who have a name and belongs_to a :residence, has_many :nomad_to_roommate_loans, has_many :roommate_to_nomad_loans

Landlords - who have a name and has_many: residences, has_many :nomads, through: :residences

Residences - have an address, deposit amount, belongs_to :landlord, belongs_to :nomad, has_many :roommates

nomad_to_roommate_loan - amount, date, belongs_to: nomad, belongs_to: roommate

roommate_to_nomad_loan - amount, date, belongs_to: nomad, belongs_to: roommate


Major views include a list of residences and their data
                    complete list of debts
                    complete list of money owed (deposits + nomad_to_roommate_loan)
                    and a karma calculator, which is in the red/black based on if you owe more or are owed more

Users should be able to log in and access these views, as well as CRUD a residence
                                                                  CRUD a roommate
                                                                  CRUD a landlord
                                                                  CRUD a loan


Features to add:
                  nomads to nomads as roommates?
                  line items on loans
                  make so people can't view one another's addresses, debts, or loans
                  deposit_refunded? boolean on residences
                  validation on all data on entry
