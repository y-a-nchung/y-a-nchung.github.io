---
title: "Scrape Data from StatsCan - April 2025"
excerpt_separator: "<!--more-->"
categories:
  - Blog
tags:
  - Economics
  - Python
  - Programming
---

Following up on my last post on building a Dashboard based on the famous 1410028701 table, [Labour Force Characteristics](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028701) of Labour Force Survey from Statistics Canada, StatsCan.

Now I am onto the journey of automating the data process by starting scraping data from the StatsCan website.

First, I found a Python library, [stats_can](https://stats-can.readthedocs.io/en/latest/#), through this well-written page on [accessing StatsCan data tables](https://people.math.carleton.ca/~davecampbell/datasets/code_sets/Cansim_python_r.html) from Carleton University.

Unfortunately, after almost a one-hour battle with the SSL certificate issue, it proves to be impossible to pull data using this library.

Instead, the following code to the rescue by just downloading the data in zip file and have panda to read it! As you see, however, there still could be SSL certificate problems if we don’t put in the extra line 1!!

<pre> 
# 1) Turn off the “InsecureRequestWarning”
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# 2) URL of the full-table ZIP
zip_url = "https://www150.statcan.gc.ca/n1/tbl/csv/14100287-eng.zip"

# 3) Download with SSL verification disabled
r = requests.get(zip_url, verify=False)
r.raise_for_status()

# 4) Unzip in memory and read the CSV
with zipfile.ZipFile(io.BytesIO(r.content)) as z:
    csv_filename = next(name for name in z.namelist() if name.endswith(".csv"))
    df = pd.read_csv(z.open(csv_filename))

# 5) Inspect
print(df.info())
print(df.head())
</pre>

So I ended up with a dataset with 5313681 rows and it’s 770.3+ MB. Yay! As a note, the above method worked as of end of April 2025.

Enjoy :) 
