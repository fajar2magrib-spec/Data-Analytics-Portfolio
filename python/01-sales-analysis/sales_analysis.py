"""
Project 1: Company Sales Analysis
---------------------------------
Steps:
  1. Create (or load) sales data
  2. Clean the data
  3. Analyze: monthly trend, top products, regions, categories, discounts
  4. Make charts
  5. Build a PDF report

Run:  python sales_analysis.py
Needs: pip install pandas numpy matplotlib reportlab
"""

import os
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")  # no window, just save images
import matplotlib.pyplot as plt

from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import cm
from reportlab.lib import colors
from reportlab.platypus import (SimpleDocTemplate, Paragraph, Spacer, Image,
                                Table, TableStyle, PageBreak)

BASE = os.path.dirname(os.path.abspath(__file__))
DATA_FILE = os.path.join(BASE, "sales_data.csv")
CHART_DIR = os.path.join(BASE, "charts")
PDF_FILE = os.path.join(BASE, "Sales_Analysis_Report.pdf")
os.makedirs(CHART_DIR, exist_ok=True)

BLUE = "#2a6fb0"      # main color
GREY = "#8a8f98"      # secondary
ORANGE = "#d9822b"    # highlight


# ---------------------------------------------------------------- 1. DATA
def create_sample_data(path, seed=42):
    """Make a realistic sales dataset for 2024-2025 (about 6000 orders)."""
    rng = np.random.default_rng(seed)
    products = {
        # name: (category, unit price)
        "Laptop": ("Electronics", 950), "Smartphone": ("Electronics", 600),
        "Headphones": ("Electronics", 90), "Smart Watch": ("Electronics", 220),
        "Office Chair": ("Furniture", 180), "Desk": ("Furniture", 260),
        "Bookshelf": ("Furniture", 120),
        "Notebook Pack": ("Stationery", 12), "Pen Set": ("Stationery", 8),
        "Printer Paper": ("Stationery", 25),
    }
    regions = ["North", "South", "East", "West"]
    region_weight = [0.30, 0.22, 0.26, 0.22]

    n = 6000
    dates = pd.to_datetime("2024-01-01") + pd.to_timedelta(
        rng.integers(0, 730, n), unit="D")
    names = rng.choice(list(products), n)
    df = pd.DataFrame({
        "order_id": np.arange(1001, 1001 + n),
        "order_date": dates,
        "region": rng.choice(regions, n, p=region_weight),
        "product": names,
        "category": [products[p][0] for p in names],
        "unit_price": [products[p][1] for p in names],
        "quantity": rng.integers(1, 6, n),
        "discount": rng.choice([0, 0.05, 0.10, 0.20], n, p=[0.55, 0.2, 0.15, 0.1]),
    })
    # seasonality: more sales in Nov/Dec, slow growth over time
    month = df["order_date"].dt.month
    keep_prob = np.where(month.isin([11, 12]), 1.0, 0.75)
    keep_prob = keep_prob * (0.85 + 0.15 * (df["order_date"].dt.year - 2024))
    df = df[rng.random(len(df)) < keep_prob].copy()
    df["cost_ratio"] = df["category"].map(
        {"Electronics": 0.72, "Furniture": 0.60, "Stationery": 0.45})

    # add a few dirty rows so the cleaning step is meaningful
    dirty = df.sample(25, random_state=1).index
    df.loc[dirty[:10], "region"] = df.loc[dirty[:10], "region"].str.lower()
    df.loc[dirty[10:15], "quantity"] = np.nan
    df = pd.concat([df, df.iloc[:8]])  # 8 duplicate rows
    df.to_csv(path, index=False)


def load_and_clean(path):
    df = pd.read_csv(path, parse_dates=["order_date"])
    rows_before = len(df)
    df = df.drop_duplicates()
    df["region"] = df["region"].str.strip().str.title()
    df = df.dropna(subset=["quantity"])
    df["quantity"] = df["quantity"].astype(int)

    # new columns
    df["revenue"] = df["unit_price"] * df["quantity"] * (1 - df["discount"])
    df["profit"] = df["revenue"] - df["unit_price"] * df["quantity"] * df["cost_ratio"]
    df["month"] = df["order_date"].dt.to_period("M").dt.to_timestamp()
    df["year"] = df["order_date"].dt.year
    print(f"Rows: {rows_before} -> {len(df)} after cleaning")
    return df, rows_before


# ------------------------------------------------------------ 2. ANALYSIS
def analyze(df):
    r = {}
    r["total_revenue"] = df["revenue"].sum()
    r["total_profit"] = df["profit"].sum()
    r["margin"] = r["total_profit"] / r["total_revenue"] * 100
    r["orders"] = df["order_id"].nunique()
    r["aov"] = r["total_revenue"] / r["orders"]

    r["by_year"] = df.groupby("year")["revenue"].sum()
    r["growth"] = (r["by_year"].loc[2025] / r["by_year"].loc[2024] - 1) * 100
    r["monthly"] = df.groupby("month")["revenue"].sum()
    r["product"] = df.groupby("product")["revenue"].sum().sort_values(ascending=False)
    r["category"] = df.groupby("category")[["revenue", "profit"]].sum()
    r["category"]["margin %"] = r["category"]["profit"] / r["category"]["revenue"] * 100
    r["region"] = df.groupby("region")["revenue"].sum().sort_values(ascending=False)
    r["discount"] = df.groupby("discount")[["quantity", "profit"]].agg(
        {"quantity": "mean", "profit": "mean"})
    r["best_month"] = r["monthly"].idxmax()
    r["worst_month"] = r["monthly"].idxmin()
    return r


# -------------------------------------------------------------- 3. CHARTS
def style_axes(ax):
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)
    ax.spines["left"].set_color("#cccccc")
    ax.spines["bottom"].set_color("#cccccc")
    ax.tick_params(colors="#555555", labelsize=9)
    ax.grid(axis="y", color="#e8e8e8", linewidth=0.8)
    ax.set_axisbelow(True)


def money(x, _=None):
    return f"${x/1000:,.0f}K" if abs(x) < 1e6 else f"${x/1e6:,.1f}M"


def make_charts(r):
    paths = {}

    # a) monthly revenue line
    fig, ax = plt.subplots(figsize=(8, 3.6))
    m = r["monthly"]
    ax.plot(m.index, m.values, color=BLUE, linewidth=2)
    ax.scatter([r["best_month"]], [m.max()], color=ORANGE, zorder=3, s=40)
    ax.annotate(f"Peak: {r['best_month']:%b %Y}\n{money(m.max())}",
                (r["best_month"], m.max()), xytext=(-95, -5),
                textcoords="offset points", fontsize=9, color="#333333")
    ax.yaxis.set_major_formatter(plt.FuncFormatter(money))
    ax.set_title("Monthly revenue", loc="left", fontsize=12, color="#222222")
    style_axes(ax)
    fig.tight_layout()
    paths["monthly"] = os.path.join(CHART_DIR, "monthly_revenue.png")
    fig.savefig(paths["monthly"], dpi=180); plt.close(fig)

    # b) top products bar
    fig, ax = plt.subplots(figsize=(8, 3.8))
    p = r["product"].sort_values()
    ax.barh(p.index, p.values, color=BLUE, height=0.6)
    for y, v in enumerate(p.values):
        ax.text(v, y, "  " + money(v), va="center", fontsize=8.5, color="#333333")
    ax.xaxis.set_major_formatter(plt.FuncFormatter(money))
    ax.set_xlim(0, p.max() * 1.15)
    ax.set_title("Revenue by product", loc="left", fontsize=12, color="#222222")
    style_axes(ax)
    ax.grid(axis="y", visible=False)
    ax.grid(axis="x", color="#e8e8e8", linewidth=0.8)
    fig.tight_layout()
    paths["product"] = os.path.join(CHART_DIR, "product_revenue.png")
    fig.savefig(paths["product"], dpi=180); plt.close(fig)

    # c) region + category side by side
    fig, (a1, a2) = plt.subplots(1, 2, figsize=(8, 3.4))
    rg = r["region"]
    a1.bar(rg.index, rg.values, color=BLUE, width=0.55)
    for x, v in enumerate(rg.values):
        a1.text(x, v, money(v), ha="center", va="bottom", fontsize=8.5)
    a1.yaxis.set_major_formatter(plt.FuncFormatter(money))
    a1.set_title("Revenue by region", loc="left", fontsize=11)
    a1.set_ylim(0, rg.max() * 1.15)
    style_axes(a1)

    cat = r["category"]["revenue"].sort_values(ascending=False)
    a2.bar(cat.index, cat.values, color=GREY, width=0.55)
    for x, v in enumerate(cat.values):
        a2.text(x, v, money(v), ha="center", va="bottom", fontsize=8.5)
    a2.yaxis.set_major_formatter(plt.FuncFormatter(money))
    a2.set_title("Revenue by category", loc="left", fontsize=11)
    a2.set_ylim(0, cat.max() * 1.15)
    style_axes(a2)
    fig.tight_layout()
    paths["region_cat"] = os.path.join(CHART_DIR, "region_category.png")
    fig.savefig(paths["region_cat"], dpi=180); plt.close(fig)

    # d) discount vs average profit per order line
    fig, ax = plt.subplots(figsize=(8, 3.2))
    d = r["discount"]
    labels = [f"{int(x*100)}%" for x in d.index]
    ax.bar(labels, d["profit"].values, color=BLUE, width=0.5)
    for x, v in enumerate(d["profit"].values):
        ax.text(x, v, f"${v:,.0f}", ha="center", va="bottom", fontsize=9)
    ax.set_xlabel("Discount given", fontsize=9, color="#555555")
    ax.set_title("Average profit per order by discount level",
                 loc="left", fontsize=12, color="#222222")
    ax.set_ylim(0, d["profit"].max() * 1.2)
    style_axes(ax)
    fig.tight_layout()
    paths["discount"] = os.path.join(CHART_DIR, "discount_profit.png")
    fig.savefig(paths["discount"], dpi=180); plt.close(fig)
    return paths


# --------------------------------------------------------------- 4. PDF
def build_pdf(df, r, charts, rows_before):
    ss = getSampleStyleSheet()
    H1 = ParagraphStyle("H1", parent=ss["Heading1"], textColor=colors.HexColor("#1d4f80"))
    H2 = ParagraphStyle("H2", parent=ss["Heading2"], textColor=colors.HexColor("#1d4f80"))
    body = ParagraphStyle("body", parent=ss["Normal"], fontSize=10.5, leading=15)
    doc = SimpleDocTemplate(PDF_FILE, pagesize=A4, leftMargin=2*cm,
                            rightMargin=2*cm, topMargin=2*cm, bottomMargin=2*cm,
                            title="Sales Analysis Report")
    S = []

    def table(data, widths=None):
        t = Table(data, colWidths=widths)
        t.setStyle(TableStyle([
            ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#2a6fb0")),
            ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
            ("FONTSIZE", (0, 0), (-1, -1), 9.5),
            ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, colors.HexColor("#f2f5f9")]),
            ("GRID", (0, 0), (-1, -1), 0.4, colors.HexColor("#cccccc")),
            ("ALIGN", (1, 0), (-1, -1), "RIGHT"),
            ("TOPPADDING", (0, 0), (-1, -1), 5), ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
        ]))
        return t

    # Title
    S += [Spacer(1, 3*cm), Paragraph("Sales Analysis Report", ss["Title"]),
          Paragraph("Retail company | Orders from Jan 2024 to Dec 2025",
                    ParagraphStyle("c", parent=body, alignment=1)),
          Spacer(1, 0.4*cm),
          Paragraph("<b>Student name:</b> Syed Hamza Ali", ParagraphStyle("nm", parent=body, alignment=1, fontSize=12)),
          Spacer(1, 1*cm)]

    # Key numbers
    kpi = [["Metric", "Value"],
           ["Total revenue", f"${r['total_revenue']:,.0f}"],
           ["Total profit", f"${r['total_profit']:,.0f}"],
           ["Profit margin", f"{r['margin']:.1f}%"],
           ["Number of orders", f"{r['orders']:,}"],
           ["Average order value", f"${r['aov']:,.2f}"],
           ["Revenue growth 2025 vs 2024", f"{r['growth']:+.1f}%"]]
    S += [Paragraph("Key numbers", H2), table(kpi, [9*cm, 5*cm]), Spacer(1, 0.6*cm)]

    top = r["product"].index[0]
    top_share = r["product"].iloc[0] / r["total_revenue"] * 100
    S.append(Paragraph(
        f"<b>Summary:</b> The company earned ${r['total_revenue']:,.0f} in revenue "
        f"with a profit margin of {r['margin']:.1f}%. Revenue changed by "
        f"{r['growth']:+.1f}% from 2024 to 2025. <b>{top}</b> is the best-selling "
        f"product ({top_share:.0f}% of revenue). The best month was "
        f"{r['best_month']:%B %Y} and the weakest was {r['worst_month']:%B %Y}.", body))
    S.append(Spacer(1, 0.4*cm))
    S.append(Paragraph(
        f"<b>Data note:</b> The raw file had {rows_before:,} rows. After removing "
        f"duplicates and rows with missing quantity, {len(df):,} rows were used. "
        "Region names were standardised (e.g. 'north' became 'North').", body))
    S.append(PageBreak())

    # Trend
    S += [Paragraph("1. Sales trend", H1), Image(charts["monthly"], 16.5*cm, 7.4*cm),
          Spacer(1, 0.3*cm),
          Paragraph("Sales show a clear seasonal pattern: average monthly revenue "
                    "is clearly highest in November and December (roughly 30% above "
                    "the other months), while the rest of the year is more variable. "
                    "The business should plan stock and marketing before Q4.", body),
          Spacer(1, 0.5*cm)]
    yr = [["Year", "Revenue"]] + [[str(y), f"${v:,.0f}"] for y, v in r["by_year"].items()]
    S += [table(yr, [5*cm, 5*cm])]
    S.append(PageBreak())

    # Products
    S += [Paragraph("2. Products", H1), Image(charts["product"], 16.5*cm, 7.8*cm),
          Spacer(1, 0.3*cm),
          Paragraph("High-priced electronics (laptops and smartphones) generate most "
                    "of the revenue. Stationery sells a lot of units (about 3,800) "
                    "but adds very little revenue because items are cheap, even "
                    "though its profit margin percentage is the highest.", body),
          Spacer(1, 0.4*cm)]
    cat = r["category"].sort_values("revenue", ascending=False)
    ct = [["Category", "Revenue", "Profit", "Margin"]] + [
        [c, f"${row.revenue:,.0f}", f"${row.profit:,.0f}", f"{row['margin %']:.1f}%"]
        for c, row in cat.iterrows()]
    S += [table(ct, [4.5*cm, 4*cm, 4*cm, 3*cm])]
    S.append(PageBreak())

    # Region + category
    S += [Paragraph("3. Regions and categories", H1),
          Image(charts["region_cat"], 16.5*cm, 7*cm), Spacer(1, 0.3*cm),
          Paragraph(f"<b>{r['region'].index[0]}</b> is the strongest region and "
                    f"<b>{r['region'].index[-1]}</b> the weakest. The gap suggests "
                    "extra marketing or a new sales rep could help the lower regions.",
                    body),
          Spacer(1, 0.8*cm),
          Paragraph("4. Discounts", H1), Image(charts["discount"], 16.5*cm, 6.6*cm),
          Spacer(1, 0.3*cm),
          Paragraph("Bigger discounts reduce profit on each order. The analysis "
                    "checks whether customers buy more units to make up for it; "
                    "the average quantity stays almost the same, so deep discounts "
                    "are not paying for themselves.", body)]
    S.append(PageBreak())

    # Recommendations
    S += [Paragraph("5. Recommendations", H1)]
    recs = [
        "Stock up and run campaigns before November; that is the peak season.",
        f"Focus on {r['product'].index[0]} and {r['product'].index[1]}: they drive the most revenue.",
        "Limit discounts above 10%; they cut profit without raising quantity.",
        f"Support the {r['region'].index[-1]} region with local promotions.",
        "Bundle low-margin stationery with electronics to raise basket value.",
    ]
    for t in recs:
        S.append(Paragraph("• " + t, body))
        S.append(Spacer(1, 0.2*cm))
    S.append(Spacer(1, 0.6*cm))
    S.append(Paragraph("<i>Tools: Python, pandas, matplotlib, reportlab. "
                       "Data is sample data created for this project.</i>", body))
    # sales list (first 45 orders)
    cols = ["order_id", "order_date", "region", "product", "unit_price", "quantity", "discount", "revenue"]
    head = df.sort_values("order_date").head(45)
    SALES_ROWS = [["Order", "Date", "Region", "Product", "Price", "Qty", "Disc.", "Revenue"]]
    for _, x in head.iterrows():
        SALES_ROWS.append([str(x.order_id), f"{x.order_date:%Y-%m-%d}", x.region, x["product"],
                           f"${x.unit_price:,.0f}", str(x.quantity), f"{x.discount:.0%}", f"${x.revenue:,.2f}"])
    SALES_WIDTHS = [1.6*cm, 2.3*cm, 1.8*cm, 3.2*cm, 1.9*cm, 1.2*cm, 1.5*cm, 2.6*cm]
    SALES_NOTE = (f"First 45 orders by date, out of {len(df):,} cleaned orders "
                  f"(${df['revenue'].sum():,.0f} total revenue). The full list is created "
                  "by the code as sales_data.csv.")

    # ---------- Appendix A: sales list ----------
    S.append(PageBreak())
    S.append(Paragraph("Appendix A: Sales list", H1))
    S.append(Paragraph(SALES_NOTE, body))
    S.append(Spacer(1, 0.3*cm))
    S.append(table(SALES_ROWS, SALES_WIDTHS))

    # ---------- Appendix B: source code ----------
    S.append(PageBreak())
    S.append(Paragraph("Appendix B: Python source code", H1))
    code_style = ParagraphStyle("code", fontName="Courier", fontSize=6.6, leading=8.2)
    with open(os.path.abspath(__file__), encoding="utf-8") as f:
        code = f.read().replace("\t", "    ").rstrip()
    from reportlab.platypus import Preformatted
    S.append(Preformatted(code, code_style))

    doc.build(S)


# ----------------------------------------------------------------- MAIN
if __name__ == "__main__":
    if not os.path.exists(DATA_FILE):
        create_sample_data(DATA_FILE)
    df, rows_before = load_and_clean(DATA_FILE)
    results = analyze(df)
    charts = make_charts(results)
    build_pdf(df, results, charts, rows_before)
    print("Done ->", PDF_FILE)
