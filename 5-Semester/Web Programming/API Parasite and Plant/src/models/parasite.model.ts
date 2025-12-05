import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn  } from 'typeorm'

@Entity()
class Parasite {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome_comum: string;

    @Column()
    nome_cientifico: string;

    @Column()
    tipo: string;

    @Column()
    plantas_afetadas: string;

    @Column()
    sintomas: string;
    
    @Column()
    tratamento: string;

    @Column()
    imagem_url: string;

    @Column()
    descricao: string;

    @CreateDateColumn({ name: 'criado_em' })
    criado_em: Date;
    
    @UpdateDateColumn({ name: 'atualizado_em' })
    atualizado_em: Date;

    constructor(
        nome_comum: string,
        nome_cientifico: string,
        tipo: string,
        plantas_afetadas: string,
        sintomas: string,
        tratamento: string,
        imagem_url: string,
        descricao: string,
        criado_em: Date,
        atualizado_em: Date
    ) 
    {
        this.nome_comum = nome_comum;
        this.nome_cientifico = nome_cientifico;
        this.tipo = tipo;
        this.plantas_afetadas = plantas_afetadas;
        this.sintomas = sintomas;
        this.tratamento = tratamento;
        this.imagem_url = imagem_url;
        this.descricao = descricao;
        this.criado_em = criado_em;
        this.atualizado_em = atualizado_em;
    }

}

export default Parasite;