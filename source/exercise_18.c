/*
 * NAME			: exercise_18.c
 * DESCRIPTION	: Read a integer (in days) and convert into years, months, and days. Year has 365 days. Month has 30 days.
 * AUTHOR		: iars
 * CREATED		: W18 Sun 2025-May-04 17:26:45+0530
 *
 */

// How do you read unsigned integer? %u

#include<stdio.h>
int main(void)
{
	unsigned int given_days = 0;
	unsigned int years = 0;
	unsigned int months = 0;
	unsigned int days = 0;

	printf("Enter days: ");
	scanf("%u",&given_days);

	years = given_days/365;
	given_days = given_days - (years * 365);
	months = given_days/30;
	days = given_days - (months * 30);
	given_days = given_days - days;

	printf("Year(s): %u\n",years);
	printf("Month(s): %u\n",months);
	printf("Day(s): %u\n",days);

	return 0;
}
