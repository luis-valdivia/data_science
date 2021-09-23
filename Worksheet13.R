# Luis Valdivia
################################################################################
# 1
# a
# using repeat()
paper.thickness <- 0.1 / 1000
num.of.times <- 0
repeat{
  paper.thickness <- paper.thickness * 2
  num.of.times <- num.of.times + 1
  if(paper.thickness > 384400 * 1000){
    break
  }
}
print(num.of.times)
# so 42 times

# b
# using while()
paper.thickness <- 0.1 / 1000
num.of.times <- 0
while(paper.thickness < 384400 * 1000){
  paper.thickness <- paper.thickness * 2
  num.of.times <- num.of.times + 1
}
print(num.of.times)
# so 42 times


# 2
M <- matrix(c(1:24), 3, 8)
for(i in 1:3){
  for(j in 1:8){
    print(paste("Row ", i, ", Column ", j, ": ", M[i,j], sep =""))
  }
}


# 3
# super keys: {Emp_SSN, Emp_Number, Emp_Name}
#             {Emp_SSN, Emp_Number}
#             {Emp_SSN, Emp_Name}
#             {Emp_Number, Emp_Name}
#             {Emp_SSN}
#             {Emp_Number}

# candidate keys:
#             {Emp_SSN}
#             {Emp_Number}

# primary key:
#             {Emp_SSN}
# I feel that employee number is potentially less unique than SSN because 
# an old employee number from someone that no longer works there can be assigned 
# to a new employee 


