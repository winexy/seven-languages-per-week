":: while ::" println

i := 1

while(i <= 11, i println; i = i + 1)
"This one goes up to 11" println

":: for ::" println

for(i, 1, 11, i println)
"This one goes up to 11" println

":: for 2 ::" println

for(i, 1, 11, 2, i println)
"This one goes up to 11" println

":: if ::" println

if(true, "It is true", "It is false") println

":: OperatorTable ::" println

OperatorTable addOperator("xor", 11)

true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

true xor true println

":: reflection ::" println

postOffice := Object clone
postOffice getSender := method(call sender)
postOffice getTarget := method(call target)
postOffice getArgs := method(call message arguments)
postOffice getName := method(call message name)

mailer := Object clone
mailer deliver := method(postOffice getSender)

mailer deliver println
postOffice getTarget println
postOffice getArgs(1, 2, 3) println
postOffice getName println

":: unless ::" println

unless := method(
  (call sender doMessage(call message argAt(0))) ifFalse(
  call sender doMessage(call message argAt(1))) ifTrue(
  call sender doMessage(call message argAt(2)))
)

unless(1 == 2, write("One is not two\n"), write("one is two\n"))
