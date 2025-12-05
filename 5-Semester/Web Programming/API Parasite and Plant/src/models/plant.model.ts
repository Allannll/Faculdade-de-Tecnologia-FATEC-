import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm'
@Entity()
class Plant {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome_comum: string;

    @Column({ nullable: true })
    nome_cientifico: string;

    @Column({ nullable: true })
    familia: string;

    @Column({ nullable: true })
    origem: string;

    @Column()
    tipo: string;

    @Column()
    ambiente: string;

    @Column()
    rega: string;

    @Column()
    toxico: boolean;

    @Column({ nullable: true })
    imagem_url: string;

    @Column({ nullable: true })
    descricao: string;

    @CreateDateColumn({ name: 'criado_em' })
    criado_em: Date;

    @UpdateDateColumn({ name: 'atualizado_em' })
    atualizado_em: Date;

    constructor(
        nome_comum: string,
        nome_cientifico: string,
        familia: string,
        origem: string,
        tipo: string,
        ambiente: string,
        rega: string,
        toxico: boolean,
        imagem_url: string,
        descricao: string,
        criado_em: Date,
        atualizado_em: Date
    ) 
    {
        this.nome_comum = nome_comum;
        this.nome_cientifico = nome_cientifico;
        this.familia = familia;
        this.origem = origem;
        this.tipo = tipo;
        this.ambiente = ambiente;
        this.rega = rega;
        this.toxico = toxico;
        this.imagem_url = imagem_url;
        this.descricao = descricao;
        this.criado_em = criado_em;
        this.atualizado_em = atualizado_em;
    }
}

export default Plant;