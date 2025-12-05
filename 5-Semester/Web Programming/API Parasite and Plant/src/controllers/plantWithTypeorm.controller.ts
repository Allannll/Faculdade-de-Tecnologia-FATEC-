import { Request, Response } from "express";
import Plant from "../models/plant.model";
import { AppDataSource } from "../datasource";

const repository = AppDataSource.getRepository(Plant);

async function getPlant(req: Request, res: Response) {
    /* #swagger.tags = ['Plant']
    #swagger.summary = 'Busca uma planta por ID'
    #swagger.security = [{ "apiKeyAuth": [] }]
    #swagger.responses[200] = {
        schema: { $ref: '#/definitions/PlantDataResponse' }
    }
    #swagger.responses[404] = { description: 'Planta não encontrada.' }
    */
    const id = Number(req.params.id);
    const plant = await repository.findOneBy({"id": id});

    if (plant == null) {
        res.sendStatus(404);
        return;
    }

    res.status(200).json(plant);
}

async function getPlants(req: Request, res: Response) {
    /* #swagger.tags = ['Plant']
    #swagger.summary = 'Lista todas as plantas'
    #swagger.security = [{ "apiKeyAuth": [] }]
    #swagger.responses[200] = {
        schema: { type: 'array', items: { $ref: '#/definitions/PlantDataResponse' } }
    }
    #swagger.responses[401] = { description: 'API Key inválida.' }
    */
    const plants = await repository.find();

    res.status(200).json(plants);
}

async function createPlant(req: Request, res: Response) {
    /*
    #swagger.tags = ['Plant']
    #swagger.summary = 'Cria uma nova planta (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.parameters['body'] = {
        in: 'body',
        required: true,
        description: 'Plant infos',
        schema: { $ref: '#/definitions/PlantData' }
    }
    #swagger.responses[201] = { 
        description: 'Plant created',
        schema: { $ref: '#/definitions/PlantDataResponse' }
    }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    */
    const plant = req.body as Plant;
    const savedPlant = await repository.save(plant);

    res.status(201).json(savedPlant);
}

async function updatePlant(req: Request, res: Response) {
    /* #swagger.tags = ['Plant'] 
    #swagger.summary = 'Atualiza uma planta por ID (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.parameters['body'] = { schema: { $ref: '#/definitions/PlantData' } }
    #swagger.responses[200] = { description: 'Planta atualizada com sucesso.', schema: { $ref: '#/definitions/PlantDataResponse' } }
    #swagger.responses[401] = { description: 'Token inválido ou não fornecido.' }
    #swagger.responses[404] = { description: 'Planta não encontrada.' }
    */
    const id = Number(req.params.id)
    const plant = req.body as Plant;
    
    const existedPlant = await repository.findOneBy({'id': id});

    if (existedPlant !== null) {
        existedPlant.nome_comum = plant.nome_comum;
        existedPlant.nome_cientifico = plant.nome_cientifico;
        existedPlant.familia = plant.familia;
        existedPlant.origem = plant.origem;
        existedPlant.tipo = plant.tipo;
        existedPlant.ambiente = plant.ambiente;
        existedPlant.rega = plant.rega;
        existedPlant.toxico = plant.toxico;
        existedPlant.imagem_url = plant.imagem_url;
        existedPlant.descricao = plant.descricao;

        const savedPlant = await repository.save(existedPlant);

        if (savedPlant === null) {
            res.sendStatus(400);
            return;   
        }

        res.status(200).json(savedPlant);
    }

    if (existedPlant === null) {
        res.sendStatus(404);
        return;   
    }
}

async function deletePlant(req: Request, res: Response) {
    /* #swagger.tags = ['Plant'] 
    #swagger.summary = 'Exclui uma planta por ID (Requer JWT)'
    #swagger.security = [{ "bearerAuth": [] }]
    #swagger.responses[204] = { description: 'Planta excluída com sucesso.' }
    #swagger.responses[404] = { description: 'Planta não encontrada.' }
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
    getPlant,
    getPlants,
    createPlant,
    updatePlant,
    deletePlant
}