import Plant from "../../models/plant.model";

describe('plant model', () => {
    it('deveria criar uma instancia de planta', () => {

        const plant = new Plant(
        'nome_comum',
        'nome_cientifico',
        'familia',
        'origem',
        'tipo',
        'ambiente',
        'rega',
        true,
        'imagem_url',
        'descricao',
        new Date('2025-12-17'),
        new Date('2025-12-17')
);

    //    expect(plant.code).toBe(code);
      //  expect(plant.name).toBe(name);
        expect(plant.id).toBeUndefined();
        expect(plant.nome_comum).toBe('nome_comum');
        expect(plant.nome_cientifico).toBe('nome_cientifico');
        expect(plant.familia).toBe('familia');
        expect(plant.origem).toBe('origem');
        expect(plant.tipo).toBe('tipo');
        expect(plant.ambiente).toBe('ambiente');
        expect(plant.rega).toBe('rega');
        expect(plant.toxico).toBe(true);
        expect(plant.imagem_url).toBe('imagem_url');
        expect(plant.descricao).toBe('descricao');
        expect(plant.criado_em).toStrictEqual(new Date('2025-12-17'));
        expect(plant.atualizado_em).toStrictEqual(new Date('2025-12-17'));
    });

//    it('deveria alterar a propriedade id apenas', () => {
//        const plant = new plant('123','Eduardo');
  //      plant.id = 999;

    //    expect(plant.id).toBe(999);
      //  expect(plant.code).toBe('123');
       // expect(plant.name).toBe('Eduardo');
        
    //});
});