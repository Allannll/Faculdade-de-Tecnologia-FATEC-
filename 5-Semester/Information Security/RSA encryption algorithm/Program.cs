using System;
using System.Numerics;
using System.Text;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Console.WriteLine("===== ALGORITMO RSA =====\n");

        // Entrada dos valores P e Q
        Console.Write("Digite um número primo P: ");
        BigInteger p = BigInteger.Parse(Console.ReadLine());

        Console.Write("Digite um número primo Q: ");
        BigInteger q = BigInteger.Parse(Console.ReadLine());

        // Calcula Z = φ(n)
        BigInteger z = (p - 1) * (q - 1);
        Console.WriteLine($"\nZ (φ(n)) = {z}");

        // Sugere 10 números possíveis para D (coprimos com Z)
        Console.WriteLine("\nAlguns valores possíveis para D (coprimos de Z):");

        int numberCount = 0;
        BigInteger tgtNumber = 2;

        while (numberCount < 10)
        {
            if (BigInteger.GreatestCommonDivisor(tgtNumber, z) == 1)
            {
                Console.WriteLine($"Número válido: {tgtNumber}");
                numberCount++;
            }
            tgtNumber++;
        }

        // Entrada do valor de D após sugestões
        Console.Write("\nDigite o valor de D (deve ser coprimo de Z): ");
        BigInteger d = BigInteger.Parse(Console.ReadLine());

        var rsa = new SimpleRsa(p, q, d);

        Console.WriteLine("\n=== Parâmetros Calculados ===");
        Console.WriteLine($"P = {rsa.P}");
        Console.WriteLine($"Q = {rsa.Q}");
        Console.WriteLine($"N = P * Q = {rsa.N}");
        Console.WriteLine($"Z = (P - 1) * (Q - 1) = {rsa.Z}");
        Console.WriteLine($"D (privado) = {rsa.D}");
        Console.WriteLine($"E (público) = {rsa.E}");
        Console.WriteLine("\nChave pública: (E = {0}, N = {1})", rsa.E, rsa.N);
        Console.WriteLine("Chave privada: (D = {0}, N = {1})", rsa.D, rsa.N);

        Console.WriteLine("\nDigite o texto que deseja criptografar (use apenas letras simples A-Z): ");
        string textoOriginal = Console.ReadLine().ToUpper();

        // Exibir criptografia e descriptografia caractere por caractere
        Console.WriteLine("\n=== Processo de Criptografia ===");
        List<BigInteger> criptografados = new List<BigInteger>();
        foreach (char ch in textoOriginal)
        {
            int codigo = (int)ch;
            BigInteger cifrado = rsa.EncryptInteger(codigo);
            criptografados.Add(cifrado);
            Console.WriteLine($"Caractere '{ch}' -> Código {codigo} -> Criptografado = {cifrado}");
        }

        Console.WriteLine("\n=== Processo de Descriptografia ===");
        StringBuilder textoDecriptado = new StringBuilder();
        foreach (BigInteger cifra in criptografados)
        {
            BigInteger decifrado = rsa.DecryptInteger(cifra);
            char caractere = (char)(int)decifrado;
            textoDecriptado.Append(caractere);
            Console.WriteLine($"Criptografado {cifra} -> Decifrado = {decifrado} -> Caractere '{caractere}'");
        }

        Console.WriteLine("\n=== Resultados Finais ===");
        Console.WriteLine($"Texto original: {textoOriginal}");
        Console.WriteLine($"Texto criptografado (números): {string.Join(" ", criptografados)}");
        Console.WriteLine($"Texto descriptografado: {textoDecriptado}");

        Console.WriteLine("\nPressione qualquer tecla para sair...");
        Console.ReadKey();
    }
}

// Classe RSA simples
public class SimpleRsa
{
    public BigInteger P { get; }
    public BigInteger Q { get; }
    public BigInteger N { get; }
    public BigInteger Z { get; }
    public BigInteger D { get; }
    public BigInteger E { get; }

    public SimpleRsa(BigInteger p, BigInteger q, BigInteger d)
    {
        if (p <= 1 || q <= 1)
            throw new ArgumentException("P e Q devem ser maiores que 1 e primos.");

        P = p;
        Q = q;
        N = P * Q;
        Z = (P - 1) * (Q - 1);

        if (BigInteger.GreatestCommonDivisor(d, Z) != 1)
            throw new ArgumentException("D deve ser coprimo com Z ((D, Z) = 1).");

        D = d;
        E = ModInverse(D, Z);
    }

    public BigInteger EncryptInteger(BigInteger m)
    {
        if (m >= N)
            throw new ArgumentException($"Mensagem ({m}) deve ser menor que N ({N}).");
        return BigInteger.ModPow(m, E, N);
    }

    public BigInteger DecryptInteger(BigInteger c)
    {
        return BigInteger.ModPow(c, D, N);
    }

    private static BigInteger ModInverse(BigInteger a, BigInteger m)
    {
        var (g, x, _) = ExtendedGcd(a, m);
        if (g != 1 && g != -1)
            throw new ArgumentException("Inverso modular não existe — D e Z não são coprimos.");
        BigInteger inv = x % m;
        if (inv < 0) inv += m;
        return inv;
    }

    private static (BigInteger g, BigInteger x, BigInteger y) ExtendedGcd(BigInteger a, BigInteger b)
    {
        if (b == 0) return (a, 1, 0);
        var (g, x1, y1) = ExtendedGcd(b, a % b);
        return (g, y1, x1 - (a / b) * y1);
    }
}