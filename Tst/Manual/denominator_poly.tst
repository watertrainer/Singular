LIB "tst.lib"; tst_init();

// Test denominator on polynomials with transcendental extension coefficients

// Example from issue: ring r = (0,x),y,dp;
// poly p = x*y+2x;
// poly q = 2x-xx+xxx;
// poly h = p/q;
// We want to recover q if we're only given h

ring r = (0,x),y,dp;
poly p = x*y+2*x;
poly q = 2*x-x^2+x^3;
poly h = p/q;

// h should be a polynomial in y with coefficients in Q(x)
h;

// The denominator of h should give us back the common denominator
// which is related to q
number d = denominator(h);
d;

// Test with a single term polynomial
poly h2 = x/(1+x);
number d2 = denominator(h2);
d2;

// Test with multiple different denominators
poly h3 = x*y/(1+x) + (1-x)*y^2/(1-x^2);
number d3 = denominator(h3);
d3;

// Test with zero polynomial
poly h4 = 0;
number d4 = denominator(h4);
d4;

// Test denominator on numbers (existing functionality should still work)
number n = x/(1+x);
denominator(n);

tst_status(1);$
