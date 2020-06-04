<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" encoding="UTF-8" method="html"/>
    <xsl:template match="/">
        <html>
            <body>
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
                    <ul>
                        <xsl:apply-templates select="Serwis"/>
                    </ul>
                </p>
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
                <tr style="background-color:Aqua">
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
                    <td><span style="color:blue"><xsl:value-of select="Imie"/><xsl:text> </xsl:text><xsl:value-of select="Nazwisko"/></span></td>
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
</xsl:stylesheet>