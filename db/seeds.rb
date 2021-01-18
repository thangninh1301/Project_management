User.create!(email: 'admin@admin.com',
             password: 'password',
             code: 'B000000')
User.find_by(email: 'admin@admin.com').confirm

User.create!(email: 'testhr@test.com',
             password: 'password',
             code: 'B000001')
User.last.confirm
User.last.add_role :hr

User.create!(email: 'user@test.com',
             password: 'password',
             code: 'B000002')
User.last.confirm
