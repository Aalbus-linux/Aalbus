/TICODE_[a-z]+,/ {
       names[++numnames] = substr($1, 8, length($1) - 8)
}

/^#define t_[a-z]+(t)/ {
       fnames[++numfnames] = substr($2, 3, length($2) - 5)
}

END {
       print "\nconst char *const strnames[] = {"
       for (i = 1; i <= numnames; ++i)
               print("\t\"" names[i] "\",")
       print "\t(void *)0"
       print "};"

       print "\nconst char *const strfnames[] = {"
       for (i = 1; i <= numfnames; ++i)
               print("\t\"" fnames[i] "\",")
       print "\t(void *)0"
       print "};"
}

