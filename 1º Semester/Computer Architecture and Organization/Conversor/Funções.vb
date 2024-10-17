Imports System.Math
Imports System.Numerics
Public Class Funções

    Private Function ConvertAnyToDec(ByVal input, ByVal original_base)

        Dim number As String
        Dim i As BigInteger = 0
        Dim soma As BigInteger


        number = InvertString(input)

        While i < Len(number)

            Dim letter As Char = number.Substring(i, 1)(0)
            Dim digitvalue As BigInteger

            If Char.IsDigit(letter) Then
                digitvalue = Asc(letter) - Asc("0"c)
            ElseIf Char.IsLetter(letter) Then
                digitvalue = Asc(Char.ToUpper(letter)) - Asc("A"c) + 10
            End If

            soma += BigInteger.Pow(original_base, i) * digitvalue
            i += 1
        End While

        Return soma.ToString()

        'MsgBox(soma)

    End Function

    Private Function ConvertDecToAny(ByVal input, ByVal target)

        Dim number As BigInteger
        Dim resto As BigInteger
        Dim result As String

        number = BigInteger.Parse(input)

        While number > 0

            resto = number Mod target

            Dim letter As Char

            If resto >= 0 AndAlso resto <= 9 Then
                letter = Chr(Asc("0"c) + resto)
            ElseIf resto >= 10 AndAlso resto <= 35 Then
                letter = Chr(Asc("A"c) + (resto - 10))
            End If

            result = letter & result

            number /= target

        End While

        Return result

    End Function

    Public Function AnyToAny(ByVal input, ByVal original_base, ByVal target)

        Dim inDecimal As String = ConvertAnyToDec(input, original_base)

        If target = 10 Then
            Return inDecimal
        Else
            Return ConvertDecToAny(inDecimal, target)
        End If

    End Function


    Private Function InvertString(ByVal value As String)

        Dim CharArray() As Char = value.ToCharArray()

        Array.Reverse(CharArray)

        Dim reverseString As String = New String(CharArray)

        Return reverseString

    End Function

End Class
