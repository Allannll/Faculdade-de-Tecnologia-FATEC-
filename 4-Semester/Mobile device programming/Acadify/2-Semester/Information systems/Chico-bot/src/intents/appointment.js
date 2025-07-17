import { Scenes, Input } from "telegraf"
import fs from "fs"
import { getDate, confirmation, getQuarto, getDayCount } from "../gemini.js"

export const appointmentScene = new Scenes.WizardScene(
  "appointment_wizard",
  async (ctx) => {
    const usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))
    const user = usersData.find((e) => e.id === ctx.from.id)

    if (user.reserva !== null) {
      ctx.reply(
        `Verificamos que você já possui uma reserva para o dia ${user.reserva.dataInicial} gostaria de cancelar? `
      )
      return ctx.wizard.selectStep(4)
    }

    await ctx.reply("Certo, qual quarto você gostaria?")

    ctx.reply(`Quarto 1: Diaria de R$ 90,00`)
    await ctx.replyWithPhoto(Input.fromLocalFile("../assets/Amarelo.jpg"))

    ctx.reply("\nQuarto 2: Diaria de R$ 120,00.\n")
    await ctx.replyWithPhoto(Input.fromLocalFile("../assets/Rosa.jpg"))

    ctx.reply("\nQuarto 3: Diaria de R$ 160,00.\n")
    await ctx.replyWithPhoto(Input.fromLocalFile("../assets/Azul.jpeg"))

    return ctx.wizard.next()
  },

  //Passo 1 - Trata a data do usuario e salva no banco//

  async (ctx) => {
    const quartoEscolhido = await getQuarto(ctx.message.text)
    ctx.session.quarto = quartoEscolhido

    await ctx.reply("Certo, para qual dia você gostaria?")

    return ctx.wizard.next()
  },

  //Passo 2

  async (ctx) => {
    const usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))

    const dataAgendamento = await getDate(ctx.message.text)
    ctx.session.dataAgendamento = ctx.message.text

    if (dataAgendamento.toLocaleLowerCase() === "inv") {
      ctx.reply("Não compreendi a data, poderia informar novamente?")
      return ctx.wizard.selectStep(2)
    }

    const updatedUsers = usersData.map((person) => {
      if (person.id === ctx.from.id) {
        return {
          ...person,
          reserva: {
            ...person.reserva,
            dataInicial: dataAgendamento,
          },
        }
      }
    })

    fs.writeFile("dados.json", JSON.stringify(updatedUsers, null, 2), function (err) {
      if (err) {
        console.log(err)
      }
    })

    ctx.reply(`E quantos dias gostaria de ficar?`)
    return ctx.wizard.next()
  },
  //Passo 3
  async (ctx) => {
    const usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))

    const quantidadeDias = await getDayCount(ctx.message.text)
    ctx.session.quantidadeDias = quantidadeDias

    const updatedUsers = usersData.map((person) => {
      if (person.id === ctx.from.id) {
        return {
          ...person,
          reserva: {
            ...person.reserva,
            qntDias: quantidadeDias,
          },
        }
      }
    })

    fs.writeFile("dados.json", JSON.stringify(updatedUsers, null, 2), function (err) {
      if (err) {
        console.log(err)
      }
    })

    const precos = [90, 120, 160]
    const precoCalculado = precos[ctx.session.quarto - 1] * parseInt(ctx.session.quantidadeDias)

    await ctx.reply(
      `Pedido número ${Math.floor(Math.random() * 90000) + 10000}\n Quarto ${ctx.session.quarto}\n Valor diaria - ${
        precos[ctx.session.quarto - 1]
      }\n Total - RS$ ${precoCalculado},00\n Você tem 24 horas para concluir o pagamento da sua reserva \n o pedido pode ser pago via pix pelo qrcode`
    )

    await ctx.replyWithPhoto(Input.fromLocalFile("../assets/qrcode.png"))

    await ctx.reply(
      `Ou se preferir outros métodos de pagamento visite https://linkmagicopagamento.com/${Math.random()
        .toString(36)
        .slice(2)}`
    )

    await ctx.reply(
      "Após a confirmação do pagamento você receberá um email com todas as informações da sua compra, Obrigado!"
    )

    return ctx.scene.leave()
  },

  //Passo 4

  async (ctx) => {
    const usersData = JSON.parse(fs.readFileSync("dados.json", "utf-8"))

    const confirma = await confirmation(ctx.message.text)

    if (confirma === "Sim") {
      const updatedUsers = usersData.map((person) => {
        if (person.id === ctx.from.id) {
          return { ...person, reserva: null }
        }
      })

      fs.writeFile("dados.json", JSON.stringify(updatedUsers, null, 2), function (err) {
        if (err) console.log(err)
      })

      ctx.reply("Certo, a sua reserva foi cancelada")
      return ctx.scene.leave()
    } else {
      ctx.reply("Certo")
      return ctx.scene.leave()
    }
  }
)
