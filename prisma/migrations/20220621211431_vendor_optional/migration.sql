-- DropForeignKey
ALTER TABLE "Parts" DROP CONSTRAINT "Parts_vendorId_fkey";

-- AlterTable
ALTER TABLE "Parts" ALTER COLUMN "vendorId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Parts" ADD CONSTRAINT "Parts_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendors"("id") ON DELETE SET NULL ON UPDATE CASCADE;
