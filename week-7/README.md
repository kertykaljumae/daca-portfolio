# Week 7: Python & Pandas – RFM Analysis (Data Loading)

## What I Did

- Connected Python to Supabase using environment variables stored in a `.env` file.
- Created a reusable function to retrieve complete tables in batches of 1,000 rows.
- Loaded the `sales` and `customers` tables into Pandas DataFrames.
- Checked data structure, data types, missing values, and sample records.
- Merged sales and customer information using `customer_id` and a left join.
- Validated the merged dataset before handing it over for data cleaning and RFM analysis.

## Key Findings

- **Sales:** 10,118 rows and 12 columns.
- **Customers:** 3,150 rows and 9 columns.
- **Missing values:** 988 `customer_id` and 3,462 `store_location` values in sales; 380 `email` and 1,260 `loyalty_tier` values in customers.
- **Data types:** `sale_date` and `registration_date` were loaded as text.
- **Merged dataset:** 10,118 rows and 14 columns. All sales rows were preserved, and every non-null sales `customer_id` matched a customer record.

## Technical Decisions

- **Pagination:** Retrieved data in batches to avoid the Supabase API's per-request row limit.
- **Left merge:** Preserved every sales record, including those without a customer ID.
- **Merge validation:** Used `validate='many_to_one'` to check customer-key uniqueness.
- **Read-only workflow:** Performed loading and checks in Pandas without modifying the original Supabase tables.

## Key Learnings

- Practiced connecting Python to a database and loading data into Pandas.
- Learned to inspect DataFrames using `.shape`, `.dtypes`, `.head()`, and `.isna().sum()`.
- Improved my understanding of joins, missing values, and validating merged datasets.
- Prepared a reliable starting dataset for the next team's cleaning and RFM analysis steps.

## AI Usage

I used ChatGPT for guidance on Python and Pandas syntax, Supabase connections, troubleshooting, and documenting the workflow. I checked the resulting code and outputs in Jupyter Notebook.

## Running the Notebook

Install the required Python packages and create a local `.env` file with `SUPABASE_URL` and `SUPABASE_KEY` for the authorized Supabase project. Run the notebook cells in order. Do not commit the `.env` file or sensitive notebook outputs to GitHub.


## Teamwork

- [Python and Pandas -- team analysis and weekly presentation](https://docs.google.com/presentation/d/12uFSfnfwM7g_wpSsCB80iVCUt2_qIWbxNVRI2Ty02pg/edit?slide=id.h48b72d7676d1c47c_0_0#slide=id.h48b72d7676d1c47c_0_0)
