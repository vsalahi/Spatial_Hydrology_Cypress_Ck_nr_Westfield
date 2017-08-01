
# Set work directory:
setwd("C:\\Users\\vahid\\Google Drive\\GraduateStudies\\Semester 6\\SurfaceWaterHydrology\\Module2\\Datasets\\Ass2\\Fishnet")

# fishnet attribute table including SHG and LULC attributes is red as "table"
table <- read.csv("Table.csv")

# Curve number table (Table 5 in report)
cn <- read.csv("CNtable.csv")



table$HydrolGrp <- as.character(table$HydrolGrp)
#missing values for Hydrological group in fishnet set as "E"
v <- replace(table$HydrolGrp,table$HydrolGrp==" ","E")
#create new table by using modified missing values of SHG
table$HydrolGrp <- v


# creating a list named as "encode" to encode SHG and LULC as numbers
encode<-list()

encode[["A"]]<-2
encode[["B"]]<-3
encode[["C"]]<-4
encode[["D"]]<-5
encode[["E"]]<-6

# "0" is LULC value for cells with missing values
encode[["0"]]<-5
encode[["1"]]<-1
encode[["2"]]<-2
encode[["3"]]<-3
encode[["4"]]<-4
 

#modifying CN table by adding values of "0" curve number for cels with SHG of "E" or LULC of "0"
E<-rep(0,4)
cn<-cbind(cn,E)

u<-c(5,rep(0,5))
cn<-rbind(cn,u)


# the final CN results will be save in a vector named as "CN"
CN<-vector()
# c1 and c2 are vectors of SHG and LULC respectively. They are coerced as character to encode them to numbers in the next line
c1<-as.character(table$HydrolGrp)
c2<-as.character(table$gridcode)

# for loop to check SHG and LULC for each cell and assign a curve number based on 'cn' table
for(i in 1:nrow(table)){
        temp1<-c1[i]
        temp2<-c2[i]
        a <- cn[encode[[temp2]],encode[[temp1]]]
        CN[i] <- a
}

# add the new attribute of Curve Number (CN) to the origin table
table<-cbind(table,CN)
