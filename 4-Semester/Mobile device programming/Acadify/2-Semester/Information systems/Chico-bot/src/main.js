import dotenv from "dotenv"
dotenv.config({ path: "../.env" })
import { Telegraf, Scenes, session, Input } from "telegraf"

import fs from "fs"

import { greetings } from "./gemini.js"
import { appointmentScene } from "./intents/appointment.js"
import { registerScene } from "./intents/register.js"

const bot = new Telegraf(process.env.TELEGRAM_TOKEN)

const stage = new Scenes.Stage([registerScene, appointmentScene])

bot.use(session())

bot.use(stage.middleware())

bot.command("delete", async (ctx) => {
  let usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))
  const userId = ctx.from.id

  const filteredUsers = usersData.filter((e) => e.id !== userId)

  fs.writeFile("dados.json", JSON.stringify(filteredUsers, null, 2), function (err) {
    if (err) {
      console.log(err)
    }
  })

  ctx.reply("Usuario deletado")
})

bot.on("text", async (ctx) => {
  let usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))

  const userId = ctx.from.id
  const userResponse = ctx.message.text
  const response = await greetings(userResponse)
  const currentUser = usersData.find((e) => e.id === userId)

  if (response == "saudação") {
    if (!currentUser) ctx.scene.enter("register_wizard")
    else if (currentUser.reserva !== null) {
      await ctx.reply(`Bem vindo ${currentUser.nome}`)
      ctx.scene.enter("appointment_wizard")
    } else {
      await ctx.reply(`Bem vindo ${currentUser.nome}, como posso ajuda-lo?`)
    }
  }

  if (response == "alugar" || response == "reserva") {
    ctx.scene.enter("appointment_wizard")
  }

  if (response == "desconhecido") {
    ctx.reply("Não compreendi, Gostaria de marcar uma reserva??")
  }
})

// Start the bot
bot.launch()
