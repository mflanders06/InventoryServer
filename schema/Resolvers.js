const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient();

const resolvers = {

    Query: {

        async units(){
            return await prisma.Units.findMany();
        },

        async vendors(){
            return await prisma.Vendors.findMany();
        },

        async parts(){
            return await prisma.Parts.findMany();
        },

        async fullParts(){
            let returnedParts = await prisma.Parts.findMany();
            let returnedUnits = await prisma.Units.findMany();
            let returnedVendors = await prisma.Vendors.findMany();

            return returnedParts.map((val) => {
                return {
                    id: val.id,
                    partName: val.partName,
                    description: val.description,
                    unitName: returnedUnits.find(fi => fi.id === val.unitId)?.unitName,
                    vendorName: returnedVendors.find(fi => fi.id === val.vendorId)?.vendorName
                }
            })
        }
    },

    Mutation: {

        async createUnit(parent, args){
            return await prisma.units.create({
                data: {
                    unitName: args.unitName
                }
            })
        },

        async createVendor(parent, args){
            return await prisma.vendors.create({
                data: {
                    vendorName: args.vendorName,
                    website: args.website,
                    busPhone: args.busPhone,
                    cellPhone: args.cellPhone
                }
            })
        },

        async createPart(parent, args){
            return await prisma.parts.create({
                data: {
                    partName: args.partName,
                    description: args.description,
                    unitId: args.unitId,
                    vendorId: args.vendorId
                }
            })
        }

    }

}

module.exports = { resolvers }