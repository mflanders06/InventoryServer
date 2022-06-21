-- CreateTable
CREATE TABLE "Parts" (
    "id" SERIAL NOT NULL,
    "partName" TEXT NOT NULL,
    "description" TEXT,
    "unitId" INTEGER NOT NULL,
    "vendorId" INTEGER NOT NULL,

    CONSTRAINT "Parts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Unit" (
    "id" SERIAL NOT NULL,
    "unitName" TEXT NOT NULL,

    CONSTRAINT "Unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vendor" (
    "id" SERIAL NOT NULL,
    "vendorName" TEXT NOT NULL,
    "website" TEXT,
    "busPhone" TEXT,
    "cellPhone" TEXT,

    CONSTRAINT "Vendor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Parts_partName_key" ON "Parts"("partName");

-- CreateIndex
CREATE UNIQUE INDEX "Unit_unitName_key" ON "Unit"("unitName");

-- CreateIndex
CREATE UNIQUE INDEX "Vendor_vendorName_key" ON "Vendor"("vendorName");

-- AddForeignKey
ALTER TABLE "Parts" ADD CONSTRAINT "Parts_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Parts" ADD CONSTRAINT "Parts_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
