import { Request, Response } from "express";
import User from "../models/user.model";

import { AppDataSource } from "../datasource";

const repository = AppDataSource.getRepository(User);

async function getUserByUsername(req: Request, res: Response) {
    /*
    #swagger.tags = ['User']
    #swagger.summary = 'Busca um usuário por nome (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.responses[200] = {
        schema: { $ref: '#/definitions/UserDataResponse' }
    }
    #swagger.responses[404] = { description: 'Usuário não encontrado.' }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    */
    const username = String(req.params.username);
    const user = await repository.findOneBy({"nome": username});

    if (user == null){
        res.sendStatus(404);
        return;
    }

    res.status(200).json(user);
}

async function getUsers(req: Request, res: Response) {
    /*
    #swagger.tags = ['User']
    #swagger.summary = 'Lista todos os usuários (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.responses[200] = { 
        schema: { type: 'array', items: { $ref: '#/definitions/UserDataResponse' } }
    }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    */
    const users = await repository.find();

    res.status(200).json(users);
}

async function createUser(req: Request, res: Response) {
    /*
    #swagger.tags = ['User']
    #swagger.summary = 'Cria um novo usuário (Cadastro Público)'
    // Nenhuma #swagger.security para permitir o cadastro (Sign-up)
    #swagger.parameters['body'] = {
        in: 'body',
        required: true,
        description: 'User infos',
        schema: { $ref: '#/definitions/UserData' }
    }
    #swagger.responses[201] = { 
        description: 'User created',
        schema: { $ref: '#/definitions/UserDataResponse' }
    }
    */
    const data = req.body;
    const user = repository.create(data);
    const savedUser = await repository.save(user);

    res.status(201).json(savedUser);
}

export default {
    getUserByUsername,
    getUsers,
    createUser
}