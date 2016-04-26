class User

    def self.find(id)
        `psql -d cat -c "SELECT * FROM users WHERE id = #{id}"`
    end

    def self.where(hash)
        `psql -d cat -c "SELECT * FROM #{hash[:table]} WHERE #{hash[:col_name]} = '#{hash[:col_value]}'"`
    end

    def self.all
    	`psql -d cat -c "SELECT * FROM users"`
    end

    def self.last
    	`psql -d cat -c "SELECT * FROM users WHERE id=(SELECT max(id) FROM users)"`
    end	

      def self.first
    	`psql -d cat -c "SELECT * FROM users WHERE id=(SELECT MIN(id) FROM users)"`
    end	
end
