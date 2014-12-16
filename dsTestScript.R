# Login details
server <- "Single Site Test"
url <- "192.168.56.105:8080"
user <- "administrator"
password <- "password"
table <- "SingleSiteTest.CNSIM"

# Create a dataframe with all these details
logindata <- data.frame(server,url,user,password,table)
opals <- datashield.login(logins=logindata, assign = TRUE)


ds.mean("D$LAB_HDL",type="combine")


datashield.logout(opals)
