/*
  Warnings:

  - You are about to drop the `Unit` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Vendor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Parts" DROP CONSTRAINT "Parts_unitId_fkey";

-- DropForeignKey
ALTER TABLE "Parts" DROP CONSTRAINT "Parts_vendorId_fkey";

-- DropTable
DROP TABLE "Unit";

-- DropTable
DROP TABLE "Vendor";

-- CreateTable
CREATE TABLE "Units" (
    "id" SERIAL NOT NULL,
    "unitName" TEXT NOT NULL,

    CONSTRAINT "Units_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vendors" (
    "id" SERIAL NOT NULL,
    "vendorName" TEXT NOT NULL,
    "website" TEXT,
    "busPhone" TEXT,
    "cellPhone" TEXT,

    CONSTRAINT "Vendors_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Units_unitName_key" ON "Units"("unitName");

-- CreateIndex
CREATE UNIQUE INDEX "Vendors_vendorName_key" ON "Vendors"("vendorName");

-- AddForeignKey
ALTER TABLE "Parts" ADD CONSTRAINT "Parts_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Units"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Parts" ADD CONSTRAINT "Parts_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
