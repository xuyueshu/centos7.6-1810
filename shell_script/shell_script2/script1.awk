BEGIN{
print "the latest list of users and shells"
print "UserID \t Shell"
print "----- \t -----"
}
{
print $1 "\t" $7
}
END{
print "this concludes the listing"
}
