/*
===============
dprint_float stuff

bc i'm tired of ftos cutting off all the important digits
===============
*/
void dprint_digit( float f) =
{
	float d;
	d = floor(f);
	d = mod(d, 10);

	if(d == 0)		dprint("0");
	else if(d == 1)	dprint("1");
	else if(d == 2)	dprint("2");
	else if(d == 3)	dprint("3");
	else if(d == 4)	dprint("4");
	else if(d == 5)	dprint("5");
	else if(d == 6)	dprint("6");
	else if(d == 7)	dprint("7");
	else if(d == 8)	dprint("8");
	else if(d == 9)	dprint("9");	
}

void dprint_int( float f, float numdigits) =
{
	float tmp;
	
	if(f == 0)
	{
		dprint("0");
		return;
	}

	if(f < 0)
	{
		dprint("-");
		f = fabs(f);
	}
	
	if(numdigits <= 0)
	{
		tmp = f;
		numdigits = 1;
		while(tmp >= 1){
			tmp = tmp / 10;
			numdigits = numdigits * 10;
		}
	}
	
	while( numdigits > 1 )
	{
		numdigits = numdigits / 10;
		tmp = f / numdigits;
		dprint_digit( tmp );
	}
}

void dprint_float( float f) =
{
	float intpart, decpart, isNegative;
	
	isNegative = FALSE;
	
	if(f == 0)
	{
		dprint( "0");
		return;
	}
	
	if(f < 0)
	{
		// easier this way
		isNegative = TRUE;
		f = fabs(f);
	}	
	
	// 1: stuff the integer part.
	intpart = floor(f);
	if(isNegative) 
		dprint( "-");
	dprint_int( intpart, 0);
	
	// 2: stuff the decimal point.
	dprint(".");
	
	// 3: stuff the decimal part.
	decpart = mod( f, 1);
	decpart = decpart * 10000;
	dprint_int(decpart, 10000);
}

void dprint_vector(vector v) =
{
	dprint("( ");
	dprint_float(v_x);
	dprint(" ");
	dprint_float(v_y);
	dprint(" ");
	dprint_float(v_z);
	dprint(" )");
}

void(string s, string ss, string sss) dprint3 = 
	{ dprint(s); dprint(ss); dprint(sss); }