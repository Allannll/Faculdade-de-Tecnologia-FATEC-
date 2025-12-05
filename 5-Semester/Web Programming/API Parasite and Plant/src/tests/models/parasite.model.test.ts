import Parasite from "../../models/parasite.model";

describe('parasite model', () => {
    it('deveria criar uma instancia de parasita', () => {

        const parasite = new Parasite(
        'nome_comum',
        'nome_cientifico',
        'tipo',
        'plantas_afetadas',
        'sintomas',
        'tratamento',
        'imagem_url',
        'descricao',
        new Date('2025-12-17'),
        new Date('2025-12-17')
 );

    //    expect(parasite.code).toBe(code);
      //  expect(parasite.name).toBe(name);
        expect(parasite.id).toBeUndefined();
        expect(parasite.nome_comum).toBe('nome_comum');
        expect(parasite.nome_cientifico).toBe('nome_cientifico');
        expect(parasite.tipo).toBe('tipo');
        expect(parasite.plantas_afetadas).toBe('plantas_afetadas');
        expect(parasite.sintomas).toBe('sintomas');
        expect(parasite.tratamento).toBe('tratamento');
        expect(parasite.imagem_url).toBe('imagem_url');
        expect(parasite.descricao).toBe('descricao');
        expect(parasite.criado_em).toStrictEqual(new Date('2025-12-17'));
        expect(parasite.atualizado_em).toStrictEqual(new Date('2025-12-17'));
    });

//    it('deveria alterar a propriedade id apenas', () => {
//        const parasite = new parasite('123','Eduardo');
  //      parasite.id = 999;

    //    expect(parasite.id).toBe(999);
      //  expect(parasite.code).toBe('123');
       // expect(parasite.name).toBe('Eduardo');
        
    //});
});