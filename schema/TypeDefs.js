const { gql } = require('apollo-server-express');

const typeDefs = gql`

    type Units {
        id: Int!
        unitName: String!
    }

    type Vendors {
        id: Int!
        vendorName: String!
        website: String
        busPhone: String
        cellPhone: String
    }

    type Parts {
        id: Int!
        partName: String!
        description: String
        unitId: Int!
        vendorId: Int
    }

    type fullParts {
        id: Int
        partName: String
        description: String
        unitName: String
        vendorName: String
    }

    # Queries
    type Query {
        units: [Units]
        vendors: [Vendors]
        parts: [Parts]
        fullParts: [fullParts]
    }

    # Mutations
    type Mutation {
        createUnit(unitName: String!): Units
        createVendor(vendorName: String!, website: String, busPhone: String, cellPhone: String): Vendors
        createPart(partName: String!, description: String, unitId: Int!, vendorId: Int): Parts
        editPart(id: Int!, partName: String!, description: String, unitId: Int!, vendorId: Int): Parts
        deletePart(id: Int!)
    }


`

module.exports = {typeDefs}