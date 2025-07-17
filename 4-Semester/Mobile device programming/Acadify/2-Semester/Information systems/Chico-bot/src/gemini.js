import dotenv from "dotenv"
import { GoogleGenerativeAI } from "@google/generative-ai"
import dayjs from "dayjs"

dotenv.config({ path: "../.env" })

// Access your API key as an environment variable (see "Set up your API key" above)
const genAI = new GoogleGenerativeAI(process.env.API_KEY)

export async function greetings(input) {
  // For text-only input, use the gemini-pro model
  const model = genAI.getGenerativeModel({ model: "gemini-pro" })
  const options = `alugar|saudação|reserva`

  // const prePrompt =
  //   "você é um chatbot de investimentos chamado invest-bot, responda esse prompt apenas com uma curta saudação se apresentando de acordo: "
  const prePrompt = `a partir deste texto " ${input} " e baseado nas seguintes intenções ${options}, escolha a opção correta que mais se adeque ao texto do usuario. responda apenas com uma das opções ${options}, caso nenhuma se encaixe responda apenas com desconhecido. Não modifique a opção e remova as aspas e espaço`
  const result = await model.generateContent(prePrompt + " " + input)
  const response = await result.response
  const text = response.text()
  return text
}

export async function getDate(input) {
  const diasSemana = [
    "Segunda-feira",
    "Terça-feira",
    "Quarta-feira",
    "Quinta-feira",
    "Sexta-feira",
    "Sabado",
    "Domingo",
  ]

  const day = dayjs().format("DD/MM/YYYY")
  const diaNumero = dayjs().day() - 1
  const model = genAI.getGenerativeModel({ model: "gemini-pro" })

  const prompt = `sabendo que hoje é ${diasSemana[diaNumero]} dia ${day} responda no formato "DD/MM/YYYY" a proxima data referente a pergunta: ${input}. se não for possivel definir uma data a partir do ${input} responda apenas "inv", por favor refaça o calculo multiplas vezes, você não pode errar`
  const result = await model.generateContent(prompt)
  const response = await result.response
  const text = response.text()

  return text
}

export async function getDayCount(input) {
  const model = genAI.getGenerativeModel({ model: "gemini-pro" })

  const prompt = `A partir do input ${input} determine a quantidade de dias que o usuario escolheu, responda apenas com o numero`
  const result = await model.generateContent(prompt)
  const response = await result.response
  const text = response.text()

  return text
}

export async function getQuarto(input) {
  const model = genAI.getGenerativeModel({ model: "gemini-pro" })

  const prompt = `Sabendo que tem 3 opções de quarto (Quarto 1: Amarelo, Quarto 2: rosa, Quarto 3: Azul) e a partir do input ${input} determine qual quarto o usuario escolheu, responda apenas com o numero do quarto`

  const result = await model.generateContent(prompt)
  const response = await result.response
  const text = response.text()

  return text
}

export async function confirmation(input) {
  const model = genAI.getGenerativeModel({ model: "gemini-pro" })

  const options = "Sim, Nao"
  const prompt = `a partir desse input ${input} determina qual dos contextos abaixo melhor se encaixa ${options} e responda somente com uma das opções Sim|Nao`
  const result = await model.generateContent(prompt)
  const response = await result.response
  const text = response.text()
  // return text
  return text
}
