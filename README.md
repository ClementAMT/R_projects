# Penguins EDA

This repository contains an **Exploratory Data Analysis (EDA)** project on the [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/) dataset using **R**.  
It showcases data exploration, visualization, and clustering techniques in R Markdown.

---

## 📂 Project Structure

- `Report.Rmd` – Main R Markdown report with all analyses and plots.  
- `scripts.R` – Optional: R scripts used for calculations and plots.  
- `R_project.Rproj` – RStudio project file.  
- `.gitignore` – Specifies files to ignore (HTML outputs, temporary files, etc.).  

> **Ignored files**: `Report.html`, `Report_files/`, `.RData`, `.Rhistory`, `Rproj.user/`  

---

## 🐧 Dataset

The project uses the **Palmer Penguins** dataset, which includes:

- 344 penguins with **8 features**:
  - **Categorical**: species, island, sex  
  - **Numerical**: bill length, bill depth, flipper length, body mass  

The dataset is included via the R package [`palmerpenguins`](https://github.com/allisonhorst/palmerpenguins).

---

## 📊 Analyses

The report performs the following steps:

1. **Dataset overview** – Checking rows, columns, and missing values.  
2. **Univariate analysis** – Histograms and boxplots for numerical variables; bar plots for categorical variables.  
3. **Bivariate analysis** – Scatterplots and boxplots to explore relationships between features (e.g., body mass vs flipper length, sex differences).  
4. **Multivariate analysis** – Pairwise plots using `GGally::ggpairs` and 3D scatterplots with `plotly`.  
5. **Clustering** – K-means clustering on numeric features, visualized in 3D, with a confusion matrix comparing clusters to species.  

---

## 📖 How to Run

1. Clone the repository:

```bash
git clone https://github.com/yourusername/Penguins_EDA.git
