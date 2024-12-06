class Stock < ApplicationRecord
  belongs_to :widget

  TICKERS = [
    "A", "AAPL", "ABT", "ABBV", "ACN", "ADBE", "ADI", "ADM", "ADP", "AEE", "AEP",
    "AES", "AFL", "AIG", "AIZ", "AJG", "AKAM", "ALB", "ALGN", "ALK", "ALL", "ALLE",
    "AMAT", "AMCR", "AMD", "AME", "AMGN", "AMP", "AMT", "ANET", "ANSS", "AON",
    "AOS", "APA", "APD", "APH", "ARE", "ATO", "ATVI", "AVB", "AVGO", "AVY", "AWK",
    "AXP", "AZO", "BA", "BAC", "BAX", "BBWI", "BBY", "BDX", "BEN", "BIO", "BK",
    "BKNG", "BKR", "BLK", "BLL", "BMY", "BR", "BRO", "BSX", "C", "CAG", "CAH",
    "CARR", "CAT", "CB", "CBOE", "CBRE", "CCI", "CCL", "CDAY", "CDNS", "CDW", "CE",
    "CERN", "CF", "CFG", "CHD", "CHRW", "CHTR", "CI", "CINF", "CL", "CLX", "CMA",
    "CMCSA", "CME", "CMG", "CMS", "CNC", "CNP", "COF", "COG", "COO", "COP", "COST",
    "CPB", "CPRT", "CRL", "CRM", "CSCO", "CSX", "CTAS", "CTLT", "CTRA", "CTS",
    "CTSH", "CTVA", "CVS", "CVX", "D", "DAL", "DD", "DE", "DFS", "DG", "DGX",
    "DHI", "DHR", "DIS", "DISCA", "DISCK", "DISH", "DLR", "DLTR", "DOV", "DOW",
    "DPZ", "DRE", "DRI", "DTE", "DUK", "DVA", "DVN", "DXC", "DXCM", "EA", "EBAY",
    "ECL", "ED", "EFX", "EIX", "EL", "EMN", "EMR", "ENPH", "EOG", "EPAM", "EQIX",
    "EQR", "ES", "ESS", "ETN", "ETR", "EVRG", "EW", "EXC", "EXPD", "EXPE", "EXR",
    "F", "FANG", "FAST", "FBHS", "FCX", "FDX", "FE", "FFIV", "FIS", "FISV", "FITB",
    "FLIR", "FLS", "FLT", "FMC", "FOX", "FOXA", "FRC", "FRT", "FTNT", "FTV", "GD",
    "GE", "GILD", "GIS", "GL", "GLW", "GM", "GNRC", "GOOG", "GOOGL", "GPC", "GPN",
    "GPS", "GRMN", "GS", "GWW", "HAL", "HAS", "HBAN", "HBI", "HCA", "HD", "HES",
    "HIG", "HII", "HLT", "HOLX", "HON", "HPE", "HPQ", "HRL", "HSIC", "HST", "HSY",
    "HUM", "HWM", "IBM", "ICE", "IDXX", "IEX", "IFF", "ILMN", "INCY", "INFO",
    "INTC", "INTU", "IP", "IPG", "IPGP", "IQV", "IR", "IRM", "ISRG", "IT", "ITW",
    "IVZ", "J", "JBHT", "JCI", "JKHY", "JNJ", "JNPR", "JPM", "K", "KEY", "KEYS",
    "KHC", "KIM", "KLAC", "KMB", "KMI", "KMX", "KO", "KR", "KSS", "KSU", "L",
    "LDOS", "LEG", "LEN", "LH", "LHX", "LIN", "LKQ", "LMT", "LNC", "LNT", "LOW",
    "LRCX", "LUMN", "LUV", "LVS", "LW", "LYB", "LYV", "MA", "MAA", "MAR", "MAS",
    "MCD", "MCHP", "MCK", "MCO", "MDLZ", "MDT", "MET", "META", "MGM", "MHK",
    "MKC", "MKTX", "MLM", "MMC", "MMM", "MNST", "MO", "MOS", "MPC", "MPWR", "MRK",
    "MRO", "MS", "MSCI", "MSFT", "MSI", "MTB", "MTD", "MU", "NCLH", "NDAQ", "NDSN",
    "NEE", "NEM", "NFLX", "NI", "NKE", "NLOK", "NOC", "NOV", "NOW", "NRG", "NSC",
    "NTAP", "NTRS", "NUE", "NVDA", "NVR", "NWL", "NWS", "NWSA", "NXPI", "O", "ODFL",
    "OGN", "OKE", "OMC", "ON", "ORCL", "ORLY", "OXY", "PAYC", "PAYX", "PBCT", "PCAR",
    "PEG", "PEP", "PFE", "PFG", "PG", "PGR", "PH", "PHM", "PKG", "PKI", "PLD", "PLTR",
    "PM", "PNC", "PNR", "PNW", "POOL", "PPG", "PPL", "PRGO", "PRU", "PSA", "PSX",
    "PVH", "PWR", "PXD", "PYPL", "QCOM", "QRVO", "RCL", "RE", "REG", "REGN", "RF",
    "RHI", "RJF", "RL", "RMD", "ROK", "ROL", "ROP", "ROST", "RSG", "RTX", "SBAC",
    "SBNY", "SBUX", "SCHW", "SEE", "SHW", "SIVB", "SJM", "SLB", "SNA", "SNPS",
    "SO", "SPG", "SPGI", "SRE", "STE", "STLD", "STT", "STX", "STZ", "SWK", "SWKS",
    "SYF", "SYK", "SYY", "T", "TAP", "TDG", "TDY", "TECH", "TEL", "TER", "TFC",
    "TFX", "TGT", "TJX", "TMO", "TMUS", "TPR", "TRMB", "TROW", "TRV", "TSCO", "TSLA",
    "TSN", "TT", "TTWO", "TXN", "TXT", "TYL", "UAL", "UDR", "UHS", "ULTA", "UNH",
    "UNP", "UPS", "URI", "USB", "V", "VFC", "VIAC", "VLO", "VMC", "VNO", "VRSK",
    "VRSN", "VRTX", "VTR", "VTRS", "VZ", "WAB", "WAT", "WBA", "WDC", "WEC", "WELL",
    "WFC", "WHR", "WLTW", "WM", "WMB", "WMT", "WRB", "WRK", "WST", "WTW", "WY",
    "WYNN", "XEL", "XLNX", "XOM", "XRAY", "XYL", "YUM", "ZBH", "ZBRA", "ZION", "ZM",
    "ZTS", "VOO", "SPY", "IVV", "VTI", "QQQ", "SHOP", "BABA", "TSM", "TCEHY", "BYND", "NIO", "XPEV", "LI", "PLUG", "BLNK",
    "FVRR", "WISH", "PDD", "JD", "ARKK", "ARKG", "ARKF", "ARKQ", "ARKW", "CCIV",
    "PSNY", "RIVN", "LCID", "UBER", "LYFT", "AFRM", "UPST", "SOFI", "COIN", "HOOD",
    "SQ", "MSTR", "GBTC", "ETHE", "NVAX", "MRNA", "BNTX", "CVAC", "DOCN", "CRWD",
    "NET", "DDOG", "SNOW", "MDB", "ASAN", "ZM", "TWLO", "OKTA", "TEAM", "WDAY",
    "PLAN", "FSLY", "ROKU", "PINS", "SNAP", "DIS", "SPCE", "DNUT", "PTON", "CHWY",
    "ETSY", "CROX", "W", "DOCS", "TDOC", "U", "RBLX", "PLTR", "DNA", "ZI", "FUBO",
    "BB", "AMC", "GME", "NKLA", "HYLN", "QS", "CLSK", "RIOT", "MARA", "HUT", "BTBT",
    "SOS", "CANO", "NOVA", "RUN", "SPWR", "ENPH", "SEDG", "FSLR", "ARRY", "CSIQ",
    "DQ", "FLUX", "BE", "BLDP", "FCEL", "BLI", "ILMN", "CRISPR", "EDIT", "NTLA",
    "PACB", "NVTA",
    "SSNLF", "ADYEY", "SE", "RELIANCE", "TME", "MPNGY", "ARM", "BIRK", "CART", "KVYO",
    "SI", "GLXY", "CS", "HUBS", "ZS", "TEAM", "TWOU", "CHPT", "LCI", "STEM",
    "PLUG", "BEEM", "PRGO", "FUTU", "XPEV", "LI", "PDD", "JD", "TSM", "NOK",
    "ERIC", "SHOP", "MELI", "BILI", "RACE", "GDS", "STNE", "CFLT", "BILL", "AFRM",
    "UPST", "SOFI", "NOVA", "RIOT", "MARA", "BTBT", "SPCE", "SPWR", "DQ", "ARLO"
  ]

  def current_price
    StockService.new.fetch_stock_price(self.tickr)
  end

  validates :tickr, presence: true
  validates :amount, presence: true
  validates :purchase_price, presence: true
end
