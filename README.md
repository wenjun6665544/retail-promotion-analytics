# Retail Promotion Analytics: Who Benefits from a Price Cut?

A retailer and a manufacturer can look at the same promotion and reach different decisions. In this analysis, a Tide price cut had the largest projected effect on the retailer’s detergent gross profit (+35.7% at full pass-through). Yet when only 70% of the wholesale discount reached shoppers, the manufacturer’s projected gross profit on Tide fell 11.3% below its no-promotion baseline.

**Context:** University of Maryland · Marketing Analytics for Consulting · Team case study, October 2026. Tools: SAS and Excel. All changes below are modeled estimates for a promotion week, not observed business outcomes.

## What we analyzed

The course case used IRI scanner panel data covering 19,157 household-weeks and 781 detergent purchases. The team used binary logit to model whether a household purchased detergent, conditional logit to model brand choice, and brand-level semi-log regressions to model purchase quantity. Excel combined those estimates into weekly sales forecasts for 177 households. Each scenario changed one promotional tool for one brand.

## My focus: how much of the discount must reach shoppers?

Pass-through is the consumer discount divided by the manufacturer’s wholesale discount. Here the **consumer discount stays fixed**: a lower pass-through requires a larger wholesale discount, without changing predicted sales. I calculated the minimum rate at which the manufacturer could fund the promotion and still earn its no-promotion gross profit on the promoted brand.

| Brand on sale | Predicted brand sales lift | Retailer category profit change at 100% pass-through | Manufacturer brand profit change at 70% pass-through | Minimum pass-through |
|---|---:|---:|---:|---:|
| Wisk | +80.0% | +20.8% | +10.3% | 60.9% |
| All | +134.0% | +24.3% | −31.9% | 86.7% |
| Tide | +88.0% | +35.7% | −11.3% | 79.0% |
| Cheer | +70.9% | +19.6% | +3.5% | 66.5% |

**Decision:** Of the two rates tested, 70% preserved manufacturer brand profit for Wisk and Cheer; only 100% did so for All and Tide. The thresholds suggest where negotiations could start between those two rates. They exclude effects on the manufacturer’s other brand.

## Reproduce the threshold calculation

[Open the SAS script](break_even.sas) in SAS Studio and run it. It uses four embedded rows of aggregate case inputs and prints the thresholds; no household records, file paths, or additional downloads are needed. The [results CSV](promotion_summary.csv) also includes both parties’ modeled profit changes at both rates.

If regular retail price is R, consumer discount is d, and expected brand sales lift is g (80% = 0.80), regular manufacturer unit margin is m = 0.45 × 0.80 × R. At pass-through t, manufacturer unit margin falls to m − d/t. Equating promotion profit to baseline profit gives:

**Minimum pass-through = d × (1 + g) / (m × g).**

## Scope and source

Aggregate inputs and outputs: final team memo, *Evaluating Sales Promotion Effects Using Scanner Panel Data*, Appendices B, D, E and F. The script reproduces the threshold calculation from rounded sales lifts, not the upstream model estimation. The case covers one market; promotion tools were tested separately, and display and advertising costs were unavailable. The original household data and course materials are not distributed here.
