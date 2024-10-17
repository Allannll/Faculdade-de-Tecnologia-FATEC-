Imports System.Runtime.InteropServices
Imports System.Numerics
Public Class Form1

    Dim builder As New Funções()
    Dim resultEntrada As BigInteger = 0
    Dim resultSaida As BigInteger = 0

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        MsgBox("O resultado é: " & builder.AnyToAny(TextBox1.Text, resultEntrada, resultSaida))

    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged

        If ComboBox1.SelectedItem = "Binário" Then
            resultSaida = 2
        ElseIf ComboBox1.SelectedItem = "Decimal" Then
            resultSaida = 10
        ElseIf ComboBox1.SelectedItem = "Hexadecimal" Then
            resultSaida = 16
        Else
            resultSaida = 0
        End If

    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles Label1.Click

    End Sub

    Private Sub ComboBox2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox2.SelectedIndexChanged

        If ComboBox2.SelectedItem = "Binário" Then
            resultEntrada = 2
        ElseIf ComboBox2.SelectedItem = "Decimal" Then
            resultEntrada = 10
        ElseIf ComboBox2.SelectedItem = "Hexadecimal" Then
            resultEntrada = 16
        Else
            resultEntrada = 0
        End If

    End Sub
End Class
