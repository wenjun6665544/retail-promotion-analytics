/* Standalone portfolio example: manufacturer break-even pass-through.
   Inputs: final team case memo, Appendices B and D. Units: cents/oz.
   lift is a fractional change; e.g., 1.34 means sales increase by 134%. */
data break_even;
  input brand $ regular_price consumer_discount lift;
  regular_unit_margin = 0.45 * 0.80 * regular_price;
  minimum_rate = consumer_discount * (1 + lift) / (regular_unit_margin * lift);
  format lift minimum_rate percent8.1;
  label lift = 'Predicted sales lift'
        minimum_rate = 'Break-even pass-through';
  datalines;
Wisk  7.18 0.70 0.800
All   4.59 0.82 1.340
Tide  7.29 0.97 0.880
Cheer 6.54 0.65 0.709
;
run;
title 'Minimum pass-through to maintain manufacturer gross profit on the promoted brand';
proc print data=break_even noobs label;
  var brand regular_price consumer_discount lift minimum_rate;
run;
title;
