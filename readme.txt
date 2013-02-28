GenUsers: Generate username and password, based on a file (i.e. classlist.txt) with the specified formatting.

Usage: genusers.sh [filename]

Output: 
jcc2380 : jbci9445
jac1936 : sbci7993
acc4636 : jbcc0437
spf1696 : jbcc2398
sek8835 : fbcc7149
mck0599 : jbcc0000
gjm1887 : sbci4354
ngm5479 : jbci8268
ztp7190 : fbci1298
axs9097 : sbci0313
rjs6624 : sbcc2021
mws1990 : sbci0581


How it works: 
	Username: pulls the email for the student, and uses that as the username
	Password: cuts first characters from fields - "Class" "School" "Curriculum" and "Major"
		and then pulls the last 4 digits from the students phone number as the "random"
		numbers at the end of the password.