#include <stdio.h>
#include <string.h>

int strncmp(const char *str1, const char *str2, size_t n);

int main () {
   char str1[20];
   char str2[20];
   int result;

   //Assigning the value to the string str1
   strcpy(str1, "hello");

   //Assigning the value to the string str2
   strcpy(str2, "heLLO WORLD");

   //This will compare the first 3 characters
   result = strncmp(str1, str2, 3);

   if(result > 0) {
      printf("ASCII value of first unmatched character of str1 is greater than str2\n");
   } else if(result < 0) {
      printf("ASCII value of first unmatched character of str1 is less than str2\n");
   } else {
      printf("Both the strings str1 and str2 are equal\n");
   }

   return 0;
}