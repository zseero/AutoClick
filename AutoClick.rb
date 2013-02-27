#dropbox download:
#https://www.dropbox.com/s/pb3gp0ogu14xsih/AutoClick.exe

require 'auto_click'

def getPos
	pos = nil
	begin
		pos = cursor_position
		sleep 1
	end while cursor_position != pos
	pos
end

def ctrl(key)
	key_down 'ctrl'
	key_stroke key
	key_up 'ctrl'
end

printf "Name: "
name = gets.chomp
badEmails = ["stuart_hunt@caryacademy.org", "jonathan_rokett@caryacademy.org", "jack_pullen@caryacademy.org", "revolution886@gmail.com", "onno.owl@gmail.com"]
for badEmail in badEmails
	if (name.downcase)[0...(name.length)] == badEmail[0...(name.length)]
		badName = badEmail.split('@')[0]
		puts "Don't spam #{badName} :P"
		sleep 1
		exit
	end
end
printf "Subject: "
subject = gets.chomp
printf "Message: "
msg = gets.chomp
printf "How many times: "
loopAmt = gets.chomp.to_i
puts "Now switch to your email"

pos = getPos

loopAmt.times do |i|
	ctrl 'n'

	type name
	key_stroke 'enter'
	2.times do
		key_stroke 'tab'
	end
	type subject
	key_stroke 'tab'
	type msg
	
	ctrl 'enter'
end