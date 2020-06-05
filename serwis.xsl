<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" encoding="UTF-8" method="html"/>
    <xsl:template match="/">
        <html>
            <body style="background-color:powderblue;">
                <table border="1" cellpadding="3" cellspacing="0" title="Pracownicy" style="margin-left: auto; margin-right: auto">
                    <caption><h1>Pracownicy:</h1></caption>
                    <tr style="background-color:Yellow"><th>Pracownik</th>
                    <th>Pesel</th>
                    <th>Nr telefonu</th>
                    <th>Adres Email</th></tr>
                    <xsl:apply-templates select="Serwis/Pracownicy/Pracownik/Osoba">
                        <xsl:sort select="Nazwisko" order="descending"/>
                    </xsl:apply-templates>
                </table>
                <table border="2" cellpadding="3" cellspacing="0" title="Klienci" style="margin-left: auto; margin-right: auto; background-color: #AAA">
                    <caption><h1>Klienci:</h1></caption>
                    <tr><th>Klient</th>
                    <th>Nr telefonu</th>
                    <th>Adres Email</th></tr>
                    <xsl:apply-templates select="Serwis/Klienci/Klient/Osoba"/>
                </table>
                <p>
                    <h1 style="text-align: center;">Adresy:</h1>
                    <div>
                        <ul style="display: table; margin: 0 auto;">
                            <xsl:apply-templates select="Serwis"/>
                        </ul>
                    </div>
                </p>
                <table border="2" cellpadding="3" cellspacing="0" title="Naprawy" style="margin-left: auto; margin-right: auto; background-color: #AAA">
                    <caption><h1>Naprawy:</h1></caption>
                    <tr>
                        <th>Rodzaj</th>
                        <th>Opis/Usterka</th>
                        <th>Data Rozpoczęcia</th>
                        <th>Czynności</th>
                        <th>Zakończenie</th>
                    </tr>
                    <xsl:apply-templates select="Serwis/Naprawy/Naprawa"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Pracownik/Osoba">
        <xsl:choose>
            <xsl:when test="position() mod 2 = 0">
                <tr style="background-color:Yellow">
                    <td><b><xsl:value-of select="Imie"/><xsl:text> </xsl:text> <xsl:value-of select="Nazwisko"/></b></td>
                    <td><xsl:value-of select="Pesel"/></td>
                    <td><xsl:value-of select="Nr_telefonu"/></td>
                    <td><b><xsl:value-of select="Adres_email"/></b></td>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <tr style="background-color:#AAA">
                    <td><b><xsl:value-of select="Imie"/><xsl:text> </xsl:text> <xsl:value-of select="Nazwisko"/></b></td>
                    <td><xsl:value-of select="Pesel"/></td>
                    <td><xsl:value-of select="Nr_telefonu"/></td>
                    <td><b><xsl:value-of select="Adres_email"/></b></td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="Osoba">
        <tr>
            <xsl:choose>
                <xsl:when test="@plec='K'">
                    <td><span style="color:#FE38F5"><xsl:value-of select="Imie"/><xsl:text> </xsl:text><xsl:value-of select="Nazwisko"/></span></td>
                </xsl:when>
                <xsl:otherwise>
                    <td><span style="color:Aqua"><xsl:value-of select="Imie"/><xsl:text> </xsl:text><xsl:value-of select="Nazwisko"/></span></td>
                </xsl:otherwise>
            </xsl:choose>
            <td><xsl:value-of select="Nr_telefonu"/></td>
            <td><xsl:value-of select="Adres_email"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="Serwis">
        <h3>Gdańsk:</h3>
        <xsl:for-each select="Pracownicy/Pracownik[Adres/Miasto='Gdansk']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Pracownik </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
        <xsl:for-each select="Klienci/Klient[Adres/Miasto='Gdansk']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Klient </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
        <h3>Gdynia:</h3>
        <xsl:for-each select="Pracownicy/Pracownik[Adres/Miasto='Gdynia']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Pracownik </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
        <xsl:for-each select="Klienci/Klient[Adres/Miasto='Gdynia']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Klient </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
        <h3>Sopot</h3>
        <xsl:for-each select="Pracownicy/Pracownik[Adres/Miasto='Sopot']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Pracownik </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
        <xsl:for-each select="Klienci/Klient[Adres/Miasto='Sopot']">
            <li><xsl:value-of select="Adres/Ulica"/><xsl:text> </xsl:text>
                <xsl:value-of select="Adres/Nr_domu"/><xsl:text>/</xsl:text><xsl:value-of select="Adres/Nr_mieszkania"/>
                <i><xsl:text> Klient </xsl:text><xsl:value-of select="Osoba/Imie"/><xsl:text> </xsl:text><xsl:value-of select="Osoba/Nazwisko"/></i></li>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="Naprawa">
        <tr>
            <td><xsl:value-of select="Sprzet/Rodzaj"/></td>
            <td><xsl:value-of select="substring(Sprzet/Opis, 0, 20)"/><xsl:value-of select="substring(Sprzet/Usterka, 0, 20)"/></td>
            <td><xsl:value-of select="Data_rozpoczecia"/></td>
            <td><ol>
                <xsl:for-each select="Czynnosc">
                    <li><xsl:value-of select="self::node()"/></li>
                </xsl:for-each>
            </ol></td>
            <xsl:if test="count(Zakonczone) = 0">
                <td>Naprawa dalej trwa</td>
            </xsl:if>
            <xsl:if test="count(Zakonczone) > 0">
                <td><xsl:value-of select="Data_zakonczenia"/></td>
            </xsl:if>
        </tr>
    </xsl:template>
</xsl:stylesheet>