import { Request, Response } from "express";
import Parasite from "../models/parasite.model";
import { AppDataSource } from "../datasource";

const repository = AppDataSource.getRepository(Parasite);

async function getParasite(req: Request, res: Response) {
    /* #swagger.tags = ['Parasite']
    #swagger.summary = 'Busca um parasita por ID'
    #swagger.security = [{ "apiKeyAuth": [] }]
    #swagger.responses[200] = {
        schema: { $ref: '#/definitions/ParasiteDataResponse' }
    }
    #swagger.responses[404] = { description: 'Parasita não encontrado.' }
    #swagger.responses[401] = { description: 'API Key inválida.' }
    */
    const id = Number(req.params.id);
    const parasite = await repository.findOneBy({"id": id});

    if (parasite == null) {
        res.sendStatus(404);
        return;
    }

    res.status(200).json(parasite);
}

async function getParasites(req: Request, res: Response) {
    /* #swagger.tags = ['Parasite']
    #swagger.summary = 'Lista todos os parasitas'
    #swagger.security = [{ "apiKeyAuth": [] }]
    #swagger.responses[200] = {
        schema: { type: 'array', items: { $ref: '#/definitions/ParasiteDataResponse' } }
    }
    #swagger.responses[401] = { description: 'API Key inválida.' }
    */
    const Parasites = await repository.find();

    res.status(200).json(Parasites);
}

async function createParasite(req: Request, res: Response) {
    /*
    #swagger.tags = ['Parasite']
    #swagger.summary = 'Cria um novo parasita (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.parameters['body'] = {
        in: 'body',
        required: true,
        description: 'Parasite infos',
        schema: { $ref: '#/definitions/ParasiteData' }
    }
    #swagger.responses[201] = { 
        description: 'Parasite created',
        schema: { $ref: '#/definitions/ParasiteDataResponse' }
    }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    */
    const parasite = req.body as Parasite;
    const savedParasite = await repository.save(parasite);

    res.status(201).json(savedParasite);
}

async function updateParasite(req: Request, res: Response) {
    /* #swagger.tags = ['Parasite'] 
    #swagger.summary = 'Atualiza um parasita por ID (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.parameters['body'] = { schema: { $ref: '#/definitions/ParasiteData' } }
    #swagger.responses[200] = { description: 'Parasita atualizado com sucesso.', schema: { $ref: '#/definitions/ParasiteDataResponse' } }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    #swagger.responses[404] = { description: 'Parasita não encontrado.' }
    */
    const id = Number(req.params.id)
    const parasite = req.body as Parasite;
    
    const existedParasite = await repository.findOneBy({'id': id});

    if (existedParasite !== null) {
        existedParasite.nome_comum = parasite.nome_comum;
        existedParasite.nome_cientifico = parasite.nome_cientifico;
        existedParasite.tipo = parasite.tipo;
        existedParasite.plantas_afetadas = parasite.plantas_afetadas;
        existedParasite.sintomas = parasite.sintomas;
        existedParasite.tratamento = parasite.tratamento;
        existedParasite.imagem_url = parasite.imagem_url;
        existedParasite.descricao = parasite.descricao;

        const savedParasite = await repository.save(existedParasite);

        if (savedParasite === null) {
            res.sendStatus(400);
            return;   
        }

        res.status(200).json(savedParasite);
    }

    if (existedParasite === null) {
        res.sendStatus(404);
        return;   
    }
}

async function deleteParasite(req: Request, res: Response) {
    /* #swagger.tags = ['Parasite'] 
    #swagger.summary = 'Exclui um parasita por ID (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.responses[204] = { description: 'Parasita excluído com sucesso.' }
    #swagger.responses[404] = { description: 'Parasita não encontrado.' }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    */
    const id = Number(req.params.id);
    const result = await repository.delete({"id":id})

    if (result.affected == null || result.affected == undefined) {
        res.sendStatus(404);
        return;
    }

    res.sendStatus(204);
}

export default {
    getParasite,
    getParasites,
    createParasite,
    updateParasite,
    deleteParasite
}