import { Request, Response } from "express";
import jwt from "jsonwebtoken"
import dotenv from "dotenv"
import User from "../models/user.model";
import { compare } from "bcrypt";
import { AppDataSource } from "../datasource";
dotenv.config();

async function login(req: Request, res: Response) {
    /* #swagger.tags = ['Auth']
       #swagger.summary = 'Autentica o usuário e retorna um JWT'
       #swagger.parameters['body'] = { 
           in: 'body',
           required: true,
           schema: { $ref: '#/definitions/LoginBody' }
       }
       #swagger.security = [{ "basicAuth": [] }]
       #swagger.responses[200] = { description: 'Login realizado com sucesso e token JWT retornado.' } 
       #swagger.responses[401] = { description: 'Credencial inválida ou Autenticação necessária.' }
    */
    const { nome, senha } = req.body;

    if (!nome || !senha) {
        res.status(401).json({error: "Usuário e/ou senha não informados."})
        return;
    }

    const repository = AppDataSource.getRepository(User);
    const user = await repository.findOneBy({"nome": nome});

    if (user == null) {
        res.status(401).json({error: "Usuário inválido!"});
        return;
    }

    const isValid = await compare(senha, user.senha);

    if (!isValid) {
        res.status(401).json({error: "Credencial inválida!"});
        return;
    }

    const token = jwt.sign(
        { "nome": nome },
        String(process.env.JWT_SECRET),
        { expiresIn: "1h"}
    );

    res.status(200).json(
        {message: "Login realizado com sucesso!", 
            token: token});
}

export default {
    login
}