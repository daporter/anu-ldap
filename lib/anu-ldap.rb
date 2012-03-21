require "net/ldap"

# This module encapsulates queries of the ANU LDAP server.
module AnuLdap

  # Find all ANU LDAP entries with the given _uni_id_.
  #
  # Return entries as a hash with keys +:uni_id+, +:email+, +:given_name+,
  # +:surname+, +:full_name+.
  def self.find_all_by_uni_id(uni_id)
    find_by("uid", uni_id)
  end

  # Find first ANU LDAP entry with the given _uni_id_.
  #
  # Return the entry as a hash with keys +:uni_id+, +:email+, +:given_name+,
  # +:surname+, +:full_name+.
  def self.find_by_uni_id(uni_id)
    find_all_by_uni_id(uni_id).first
  end

  # Find all ANU LDAP entries with the given _email_.
  #
  # Return entries as a hash with keys +:uni_id+, +:email+, +:given_name+,
  # +:surname+, +:full_name+.
  def self.find_all_by_email(email)
    find_by("mail", email)
  end

  # Find first ANU LDAP entry with the given _email_.
  #
  # Return the entry as a hash with keys +:uni_id+, +:email+, +:given_name+,
  # +:surname+, +:full_name+.
  def self.find_by_email(email)
    find_all_by_email(email).first
  end

  # Authenticate credentials against ANU LDAP.
  #
  # Returns _true_ if authentication is successful, and _false_ otherwise.
  def self.authenticate(uni_id, password)
    ldap = get_new_ldap()
    ldap.auth "uid=#{uni_id}, ou=people, o=anu.edu.au", password

    ldap.bind
  end

  private

  # Find all ANU LDAP entries with a given key-value pair.
  def self.find_by(key_name, key_value)
    filter = Net::LDAP::Filter.eq(key_name, key_value)

    entries = get_new_ldap().search(:base       => "ou=people,o=anu.edu.au",
                                    :filter     => filter,
                                    :attributes => ["uid", "mail",
                                                    "givenName", "sn", "cn"])

    entries.map { |e| make_user_hash(e) }
  end

  # Get a new connection to the ANU LDAP server.
  def self.get_new_ldap()
    Net::LDAP.new(:host       => "ldap.anu.edu.au",
                  :port       => 636,
                  :encryption => :simple_tls)
  end

  # Create a hash of user details from an ldap entry.
  def self.make_user_hash(ldap_entry)
    {
      :uni_id     => ldap_entry.uid.first,
      :email      => ldap_entry.mail.first,
      :given_name => ldap_entry.givenName.first,
      :surname    => ldap_entry.sn.first,
      :full_name  => ldap_entry.cn.first
    }
  end
end

