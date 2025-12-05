import { BeforeInsert, Column, Entity, PrimaryGeneratedColumn, CreateDateColumn} from "typeorm";
import { hash } from 'bcrypt';

@Entity()
class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome: string;
    
    @Column()
    email: string;
    
    @Column()
    senha: string;
    
    @CreateDateColumn({ name: 'data_criacao' })
    data_criacao: Date;
    
    @Column()
    nivel_acesso: string;

    constructor(nome: string, 
                email: string,
                senha: string,
                data_criacao: Date,
                nivel_acesso: string
                ) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.data_criacao = data_criacao;
        this.nivel_acesso = nivel_acesso;
    }
// User.nome User.email User.senha User.data_criacao User.nivel_acesso
    @BeforeInsert()
    async hashPassword() {
        this.senha = await hash(this.senha,10);
    }
}

export default User;