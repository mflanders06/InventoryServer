import { ApolloServer, gql } from 'apollo-server';
import { PrismaClient } from '@prisma/client';

import { typeDefs } from './schema/TypeDefs';
import { resolvers } from './schema/Resolvers';

import * as cors from 'cors';



const prisma = new PrismaClient();

const server = new ApolloServer({
     typeDefs,
     resolvers,
     csrfPrevention: true,
     cors: {
        origin: ["http://127.0.0.1:4200", "http://127.0.0.1:3000", "http://127.0.0.1:80", "http://localhost:4200"]
     }
    });

server.listen({port: 3000}).then((serverInfo) => console.log(`Server running at ${serverInfo.url}`))