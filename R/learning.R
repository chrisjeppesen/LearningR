# Loading packages --------------------------------------------------------

library(tidyverse)
library(NHANES)

glimpse(NHANES)
str(NHANES)

# Select specific columns -------------------------------------------------

select(NHANES, Age, BMI, BPSys1)
select(NHANES, -HardDrugs)
select(NHANES, starts_with("bp"))
select(NHANES, ends_with("Day"))
select(NHANES, contains("age"))


# Renaming new columns ----------------------------------------------------

NHANES_small <- rename_with(NHANES, snakecase::to_snake_case)


# Renaming specific columns -----------------------------------------------

NHANES_small <- rename(NHANES, sex = Gender)
view(NHANES_small)


# Chaining the functions with pipe ----------------------------------------

colnames(NHANES_small)

NHANES_small %>%
  colnames()

NHANES_small <- NHANES_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)
NHANES

# Exercise ----------------------------------------------------------------
# 1. Select specific column
NHANES_small %>%
  select(bp_sys_ave, education)

# 2. Rename columns
NHANES_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

# 3. Re-write with pipe
NHANES_small %>%
  select(bmi, contains("age"))

# 4. Re-write with pipe
NHANES_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)
