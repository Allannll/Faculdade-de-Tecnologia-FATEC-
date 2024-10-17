import { Scenes } from "telegraf"
import fs from "fs"
import { confirmation } from "../gemini.js"

export const registerScene = new Scenes.WizardScene(
  "menu_wizard",
  async (ctx) => {
    ctx.reply("Bem vindo a Pousada do Chico")
    return ctx.wizard.next()
  },
  async (ctx) => {
    ctx.session.name = ctx.message.text
    ctx.reply(`Obrigado, ${ctx.session.name}! Agora informe o seu e-mail.`)
    return ctx.wizard.next()
  },
  async (ctx) => {
    const usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))

    ctx.session.email = ctx.message.text
    const newUser = {
      id: ctx.from.id,
      nome: ctx.session.name,
      email: ctx.session.email,
      reserva: null,
    }
    const updatedUsers = [...usersData, newUser]
    fs.writeFile("dados.json", JSON.stringify(updatedUsers, null, 2), function (err) {
      if (err) {
        console.log(err)
      }
    })
    ctx.reply(`Certo ${ctx.session.name}, gostaria de alugar um de nossos quartos?`)

    return ctx.wizard.next()
  },
  async (ctx) => {
    console.log("caiu aqui")
    const confirma = await confirmation(ctx.message.text)
    console.log(confirma)

    if (confirma === "Sim") {
      ctx.scene.enter("appointment_wizard")
    } else {
      await ctx.reply("Certo, posso ajuda-lo com mais alguma coisa?")
      return ctx.scene.leave()
    }
  }
)
