setwd("C:\\Users\\vahid\\Google Drive\\GraduateStudies\\Semester 6\\SurfaceWaterHydrology\\Module2\\Datasets\\Ass2\\Fishnet")
table <- read.csv("Att.csv")
cn <- read.csv("CNtable.csv")

HydGrp <- as.character(table$HydrolGrp)
LULC <- as.character(table$gridcode_1)
g <- vector()

for (i in 1:nrow(table)){
        if (HydGrp[i]=="A" && LULC[i]=="1"){
                g[i] <- cn[1,2]
        }
                else if (HydGrp[i]=="A" && LULC[i]=="2"){
                        g[i] <- cn[2,2]
                }
                else if (HydGrp[i]=="A" && LULC[i]=="3"){
                        g[i] <- cn[3,2]
                }
                else if (HydGrp[i]=="A" && LULC[i]=="4"){
                        g[i] <- cn[4,2]
                }
                else if (HydGrp[i]=="B" && LULC[i]=="1"){
                        g[i] <- cn[1,3]
                }
                else if (HydGrp[i]=="B" && LULC[i]=="2"){
                        g[i] <- cn[2,3]
                }
                else if (HydGrp[i]=="B" && LULC[i]=="3"){
                        g[i] <- cn[3,3]
                }
                else if (HydGrp[i]=="B" && LULC[i]=="4"){
                        g[i] <- cn[4,3]
                }
                else if (HydGrp[i]=="C" && LULC[i]=="1"){
                        g[i] <- cn[1,4]
                }
                else if (HydGrp[i]=="C" && LULC[i]=="2"){
                        g[i] <- cn[2,4]
                }
                else if (HydGrp[i]=="C" && LULC[i]=="3"){
                        g[i] <- cn[3,4]
                }
                else if (HydGrp[i]=="C" && LULC[i]=="4"){
                        g[i] <- cn[4,4]
                }
                else if (HydGrp[i]=="D" && LULC[i]=="1"){
                        g[i] <- cn[1,5]
                }
                else if (HydGrp[i]=="D" && LULC[i]=="2"){
                        g[i] <- cn[2,5]
                }
                else if (HydGrp[i]=="D" && LULC[i]=="3"){
                        g[i] <- cn[3,5]
                }
                else if (HydGrp[i]=="D" && LULC[i]=="4"){
                        g[i] <- cn[4,5]
                }
                else {
                        g[i] <- 0
                }
        print(i)
}
g[g==0] <- "NA"
FID <- table$FID
curveNumber <- cbind(FID,g)
write.csv(curveNumber,"CNrep.csv")



