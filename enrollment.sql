-- MySQL dump 10.13  Distrib 5.6.30, for Win32 (AMD64)
--
-- Host: localhost    Database: enrollment
-- ------------------------------------------------------
-- Server version	5.6.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `charge_amount` decimal(10,2) NOT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `charge_username` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `charge_username` (`charge_username`),
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`charge_username`) REFERENCES `users` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charges`
--

LOCK TABLES `charges` WRITE;
/*!40000 ALTER TABLE `charges` DISABLE KEYS */;
INSERT INTO `charges` VALUES (6,102.11,'2016-10-05 20:20:07','bpomp@yahoo.com'),(7,12.65,'2016-10-05 20:20:07','jsvens@gmail.com'),(8,949.22,'2016-10-05 20:20:07','mjordan@gmail.com'),(9,1.44,'2016-10-05 20:20:07','jjaso@gmail.com'),(10,1444.00,'2016-10-05 20:20:07','up@yahoo.com');
/*!40000 ALTER TABLE `charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_id` int(11) unsigned NOT NULL,
  `city_name` varchar(60) NOT NULL,
  `state_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name` (`city_name`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (0,'none',0),(1670,'Mazar-e-Sharif',241),(1671,'Herat',242),(1672,'Kabul',243),(1673,'Qandahar',244),(1674,'Lobito',245),(1675,'Benguela',245),(1676,'Huambo',246),(1677,'Luanda',247),(1678,'Namibe',248),(1697,'Tirana',250),(1698,'Andorra la Vella',251),(1699,'Willemstad',252),(1700,'Abu Dhabi',253),(1701,'al-Ayn',253),(1702,'Ajman',254),(1703,'Dubai',255),(1704,'Sharja',256),(1705,'La Matanza',257),(1706,'Lomas de Zamora',257),(1707,'Quilmes',257),(1708,'Almirante Brown',257),(1709,'La Plata',257),(1710,'Mar del Plata',257),(1711,'LanÃƒÂºs',257),(1712,'Merlo',257),(1713,'General San MartÃƒÂ­n',257),(1714,'Moreno',257),(1715,'Avellaneda',257),(1716,'Tres de Febrero',257),(1717,'MorÃƒÂ³n',257),(1718,'Florencio Varela',257),(1719,'San Isidro',257),(1720,'Tigre',257),(1721,'Malvinas Argentinas',257),(1722,'Vicente LÃƒÂ³pez',257),(1723,'Berazategui',257),(1725,'BahÃƒÂ­a Blanca',257),(1726,'Esteban EcheverrÃƒÂ­a',257),(1727,'JosÃƒÂ© C. Paz',257),(1728,'Hurlingham',257),(1729,'ItuzaingÃƒÂ³',257),(1731,'San NicolÃƒÂ¡s de los Arroyos',257),(1732,'Escobar',257),(1733,'Pilar',257),(1734,'Ezeiza',257),(1735,'Tandil',257),(1736,'San Fernando del Valle de Cata',258),(1740,'Resistencia',260),(1741,'Comodoro Rivadavia',261),(1742,'Corrientes',262),(1748,'ParanÃƒÂ¡',264),(1749,'Concordia',264),(1750,'Formosa',265),(1751,'San Salvador de Jujuy',266),(1754,'Godoy Cruz',268),(1755,'GuaymallÃƒÂ©n',268),(1756,'Las Heras',268),(1757,'Mendoza',268),(1758,'San Rafael',268),(1759,'Posadas',269),(1760,'NeuquÃƒÂ©n',270),(1761,'Salta',271),(1764,'San Luis',273),(1765,'Rosario',274),(1766,'Santa FÃƒÂ©',274),(1767,'Santiago del Estero',275),(1768,'San Miguel de TucumÃƒÂ¡n',276),(1769,'Vanadzor',277),(1770,'Yerevan',278),(1771,'Gjumri',279),(1772,'Tafuna',280),(1773,'Fagatogo',280),(1775,'Canberra',282),(1776,'Sydney',283),(1778,'Central Coast',283),(1779,'Wollongong',283),(1780,'Brisbane',284),(1781,'Gold Coast',284),(1782,'Townsville',284),(1783,'Cairns',284),(1784,'Adelaide',285),(1785,'Hobart',286),(1786,'Melbourne',287),(1787,'Geelong',287),(1788,'Perth',288),(1789,'Klagenfurt',289),(1790,'Linz',290),(1791,'Salzburg',291),(1792,'Graz',292),(1793,'Innsbruck',293),(1794,'Wien',294),(1795,'Baku',295),(1796,'GÃƒÂ¤ncÃƒÂ¤',296),(1797,'MingÃƒÂ¤ÃƒÂ§evir',297),(1798,'Sumqayit',298),(1799,'Bujumbura',299),(1800,'Antwerpen',300),(1801,'Bruxelles [Brussel]',301),(1802,'Schaerbeek',301),(1803,'Gent',302),(1804,'Charleroi',303),(1805,'Mons',303),(1806,'LiÃƒÂ¨ge',304),(1807,'Namur',305),(1808,'Brugge',306),(1809,'Djougou',307),(1810,'Cotonou',308),(1811,'Parakou',309),(1812,'Porto-Novo',310),(1813,'Koudougou',311),(1814,'Bobo-Dioulasso',312),(1815,'Ouagadougou',313),(1816,'Barisal',314),(1817,'Chittagong',315),(1818,'Comilla',315),(1819,'Brahmanbaria',315),(1820,'Dhaka',316),(1821,'Narayanganj',316),(1822,'Mymensingh',316),(1823,'Tungi',316),(1824,'Tangail',316),(1825,'Jamalpur',316),(1826,'Narsinghdi',316),(1827,'Gazipur',316),(1828,'Khulna',317),(1829,'Jessore',317),(1830,'Rajshahi',318),(1831,'Rangpur',318),(1832,'Nawabganj',318),(1833,'Dinajpur',318),(1834,'Bogra',318),(1835,'Pabna',318),(1836,'Naogaon',318),(1837,'Sirajganj',318),(1838,'Saidpur',318),(1839,'Sylhet',319),(1840,'Burgas',320),(1841,'Sliven',320),(1842,'Sofija',321),(1843,'Stara Zagora',322),(1844,'Pleven',323),(1845,'Plovdiv',324),(1846,'Ruse',325),(1847,'Varna',326),(1848,'Dobric',326),(1849,'Ã?Â umen',326),(1850,'al-Manama',327),(1851,'Nassau',328),(1852,'Sarajevo',329),(1853,'Zenica',329),(1854,'Banja Luka',330),(1856,'BaranovitÃ?Â¡i',331),(1857,'Pinsk',331),(1858,'Gomel',332),(1859,'Mozyr',332),(1860,'Grodno',333),(1861,'Lida',333),(1862,'Minsk',334),(1863,'Borisov',335),(1864,'Soligorsk',335),(1865,'MolodetÃ?Â¡no',335),(1866,'Mogiljov',336),(1867,'Bobruisk',336),(1868,'Vitebsk',337),(1869,'OrÃ?Â¡a',337),(1870,'Novopolotsk',337),(1871,'Belize City',338),(1872,'Belmopan',339),(1875,'Saint George',341),(1877,'Cochabamba',343),(1879,'El Alto',344),(1880,'Oruro',345),(1881,'PotosÃƒÂ­',346),(1882,'Santa Cruz de la Sierra',347),(1883,'Tarija',348),(1884,'Rio Branco',349),(1885,'MaceiÃƒÂ³',350),(1886,'Arapiraca',350),(1887,'MacapÃƒÂ¡',351),(1888,'Manaus',352),(1889,'Salvador',353),(1890,'Feira de Santana',353),(1891,'IlhÃƒÂ©us',353),(1892,'VitÃƒÂ³ria da Conquista',353),(1893,'Juazeiro',353),(1894,'Itabuna',353),(1895,'JequiÃƒÂ©',353),(1896,'CamaÃƒÂ§ari',353),(1897,'Barreiras',353),(1898,'Alagoinhas',353),(1899,'Lauro de Freitas',353),(1900,'Teixeira de Freitas',353),(1901,'Paulo Afonso',353),(1902,'EunÃƒÂ¡polis',353),(1903,'Jacobina',353),(1904,'Fortaleza',354),(1905,'Caucaia',354),(1906,'Juazeiro do Norte',354),(1907,'MaracanaÃƒÂº',354),(1908,'Sobral',354),(1909,'Crato',354),(1915,'Cariacica',356),(1916,'Vila Velha',356),(1917,'Serra',356),(1918,'VitÃƒÂ³ria',356),(1919,'Cachoeiro de Itapemirim',356),(1920,'Colatina',356),(1921,'Linhares',356),(1922,'GoiÃƒÂ¢nia',357),(1923,'Aparecida de GoiÃƒÂ¢nia',357),(1924,'AnÃƒÂ¡polis',357),(1925,'LuziÃƒÂ¢nia',357),(1926,'Rio Verde',357),(1928,'SÃƒÂ£o LuÃƒÂ­s',358),(1929,'Imperatriz',358),(1930,'Caxias',358),(1931,'Timon',358),(1932,'CodÃƒÂ³',358),(1933,'SÃƒÂ£o JosÃƒÂ© de Ribamar',358),(1934,'Bacabal',358),(1935,'CuiabÃƒÂ¡',359),(1936,'VÃƒÂ¡rzea Grande',359),(1937,'RondonÃƒÂ³polis',359),(1938,'Campo Grande',360),(1939,'Dourados',360),(1940,'CorumbÃƒÂ¡',360),(1941,'Belo Horizonte',361),(1942,'Contagem',361),(1943,'UberlÃƒÂ¢ndia',361),(1944,'Juiz de Fora',361),(1945,'Betim',361),(1946,'Montes Claros',361),(1947,'Uberaba',361),(1948,'RibeirÃƒÂ£o das Neves',361),(1949,'Governador Valadares',361),(1950,'Ipatinga',361),(1951,'DivinÃƒÂ³polis',361),(1952,'Sete Lagoas',361),(1953,'Santa Luzia',361),(1954,'PoÃƒÂ§os de Caldas',361),(1955,'IbiritÃƒÂ©',361),(1956,'TeÃƒÂ³filo Otoni',361),(1957,'Patos de Minas',361),(1958,'Barbacena',361),(1959,'Varginha',361),(1960,'SabarÃƒÂ¡',361),(1961,'Itabira',361),(1962,'Pouso Alegre',361),(1963,'Passos',361),(1964,'Araguari',361),(1965,'Conselheiro Lafaiete',361),(1966,'Coronel Fabriciano',361),(1967,'Ituiutaba',361),(1968,'JoÃƒÂ£o Pessoa',362),(1969,'Campina Grande',362),(1970,'Santa Rita',362),(1971,'Patos',362),(1972,'Curitiba',363),(1973,'Londrina',363),(1974,'MaringÃƒÂ¡',363),(1975,'Ponta Grossa',363),(1976,'Foz do IguaÃƒÂ§u',363),(1977,'Cascavel',363),(1978,'SÃƒÂ£o JosÃƒÂ© dos Pinhais',363),(1980,'Guarapuava',363),(1981,'ParanaguÃƒÂ¡',363),(1982,'Apucarana',363),(1984,'Pinhais',363),(1985,'Campo Largo',363),(1986,'BelÃƒÂ©m',364),(1987,'Ananindeua',364),(1988,'SantarÃƒÂ©m',364),(1989,'MarabÃƒÂ¡',364),(1990,'Castanhal',364),(1991,'Abaetetuba',364),(1992,'Itaituba',364),(1993,'CametÃƒÂ¡',364),(1994,'Recife',365),(1995,'JaboatÃƒÂ£o dos Guararapes',365),(1996,'Olinda',365),(1997,'Paulista',365),(1998,'Caruaru',365),(1999,'Petrolina',365),(2000,'Cabo de Santo Agostinho',365),(2001,'Camaragibe',365),(2002,'Garanhuns',365),(2003,'VitÃƒÂ³ria de Santo AntÃƒÂ£o',365),(2004,'SÃƒÂ£o LourenÃƒÂ§o da Mata',365),(2005,'Teresina',366),(2006,'ParnaÃƒÂ­ba',366),(2007,'Rio de Janeiro',367),(2008,'SÃƒÂ£o GonÃƒÂ§alo',367),(2009,'Nova IguaÃƒÂ§u',367),(2010,'Duque de Caxias',367),(2011,'NiterÃƒÂ³i',367),(2012,'SÃƒÂ£o JoÃƒÂ£o de Meriti',367),(2013,'Belford Roxo',367),(2014,'Campos dos Goytacazes',367),(2015,'PetrÃƒÂ³polis',367),(2016,'Volta Redonda',367),(2017,'MagÃƒÂ©',367),(2018,'ItaboraÃƒÂ­',367),(2019,'Nova Friburgo',367),(2020,'Barra Mansa',367),(2021,'NilÃƒÂ³polis',367),(2022,'TeresÃƒÂ³polis',367),(2023,'MacaÃƒÂ©',367),(2024,'Cabo Frio',367),(2025,'Queimados',367),(2026,'Resende',367),(2027,'Angra dos Reis',367),(2028,'Barra do PiraÃƒÂ­',367),(2029,'Natal',368),(2030,'MossorÃƒÂ³',368),(2031,'Parnamirim',368),(2032,'Porto Alegre',369),(2033,'Caxias do Sul',369),(2034,'Pelotas',369),(2035,'Canoas',369),(2036,'Novo Hamburgo',369),(2038,'GravataÃƒÂ­',369),(2039,'ViamÃƒÂ£o',369),(2040,'SÃƒÂ£o Leopoldo',369),(2041,'Rio Grande',369),(2042,'Alvorada',369),(2043,'Passo Fundo',369),(2044,'Uruguaiana',369),(2045,'BagÃƒÂ©',369),(2046,'Sapucaia do Sul',369),(2047,'Santa Cruz do Sul',369),(2048,'Cachoeirinha',369),(2049,'GuaÃƒÂ­ba',369),(2050,'Santana do Livramento',369),(2051,'Bento GonÃƒÂ§alves',369),(2052,'Porto Velho',370),(2053,'Ji-ParanÃƒÂ¡',370),(2054,'Boa Vista',371),(2055,'Joinville',372),(2056,'FlorianÃƒÂ³polis',372),(2057,'Blumenau',372),(2058,'CriciÃƒÂºma',372),(2059,'SÃƒÂ£o JosÃƒÂ©',372),(2060,'ItajaÃƒÂ­',372),(2061,'ChapecÃƒÂ³',372),(2062,'Lages',372),(2063,'JaraguÃƒÂ¡ do Sul',372),(2064,'PalhoÃƒÂ§a',372),(2065,'SÃƒÂ£o Paulo',373),(2066,'Guarulhos',373),(2067,'Campinas',373),(2068,'SÃƒÂ£o Bernardo do Campo',373),(2069,'Osasco',373),(2070,'Santo AndrÃƒÂ©',373),(2071,'SÃƒÂ£o JosÃƒÂ© dos Campos',373),(2072,'RibeirÃƒÂ£o Preto',373),(2073,'Sorocaba',373),(2074,'Santos',373),(2075,'MauÃƒÂ¡',373),(2076,'CarapicuÃƒÂ­ba',373),(2077,'SÃƒÂ£o JosÃƒÂ© do Rio Preto',373),(2078,'Moji das Cruzes',373),(2079,'Diadema',373),(2080,'Piracicaba',373),(2081,'Bauru',373),(2082,'JundÃƒÂ­aÃƒÂ­',373),(2083,'Franca',373),(2084,'SÃƒÂ£o Vicente',373),(2085,'Itaquaquecetuba',373),(2086,'Limeira',373),(2087,'GuarujÃƒÂ¡',373),(2088,'TaubatÃƒÂ©',373),(2089,'Embu',373),(2090,'Barueri',373),(2091,'TaboÃƒÂ£o da Serra',373),(2092,'Suzano',373),(2093,'MarÃƒÂ­lia',373),(2094,'SÃƒÂ£o Carlos',373),(2095,'SumarÃƒÂ©',373),(2096,'Presidente Prudente',373),(2097,'Americana',373),(2098,'Araraquara',373),(2099,'Santa BÃƒÂ¡rbara dÃ?Â´Oeste',373),(2100,'JacareÃƒÂ­',373),(2101,'AraÃƒÂ§atuba',373),(2102,'Praia Grande',373),(2103,'Rio Claro',373),(2104,'Itapevi',373),(2105,'Cotia',373),(2106,'Ferraz de Vasconcelos',373),(2107,'Indaiatuba',373),(2108,'HortolÃƒÂ¢ndia',373),(2109,'SÃƒÂ£o Caetano do Sul',373),(2110,'Itu',373),(2111,'Itapecerica da Serra',373),(2112,'Moji-GuaÃƒÂ§u',373),(2113,'Pindamonhangaba',373),(2114,'Francisco Morato',373),(2115,'Itapetininga',373),(2116,'BraganÃƒÂ§a Paulista',373),(2117,'JaÃƒÂº',373),(2118,'Franco da Rocha',373),(2119,'RibeirÃƒÂ£o Pires',373),(2120,'Catanduva',373),(2121,'Botucatu',373),(2122,'Barretos',373),(2123,'GuaratinguetÃƒÂ¡',373),(2124,'CubatÃƒÂ£o',373),(2125,'Araras',373),(2126,'Atibaia',373),(2127,'SertÃƒÂ£ozinho',373),(2128,'Salto',373),(2129,'Ourinhos',373),(2130,'Birigui',373),(2131,'TatuÃƒÂ­',373),(2132,'Votorantim',373),(2133,'PoÃƒÂ¡',373),(2134,'Aracaju',374),(2135,'Nossa Senhora do Socorro',374),(2136,'Palmas',375),(2137,'AraguaÃƒÂ­na',375),(2138,'Bridgetown',376),(2139,'Bandar Seri Begawan',377),(2140,'Thimphu',378),(2141,'Francistown',379),(2142,'Gaborone',380),(2143,'Bangui',381),(2144,'Calgary',382),(2145,'Edmonton',382),(2146,'Vancouver',383),(2147,'Surrey',383),(2148,'Burnaby',383),(2150,'Abbotsford',383),(2151,'Coquitlam',383),(2152,'Saanich',383),(2153,'Delta',383),(2154,'Kelowna',383),(2155,'Winnipeg',384),(2156,'Saint JohnÃ?Â´s',385),(2157,'Cape Breton',386),(2159,'Toronto',387),(2160,'North York',387),(2161,'Mississauga',387),(2162,'Scarborough',387),(2163,'Etobicoke',387),(2166,'Ottawa',387),(2167,'Brampton',387),(2168,'Windsor',387),(2169,'Kitchener',387),(2170,'Markham',387),(2172,'Vaughan',387),(2173,'Burlington',387),(2174,'Oshawa',387),(2175,'Oakville',387),(2176,'Saint Catharines',387),(2177,'Richmond Hill',387),(2178,'Thunder Bay',387),(2179,'Nepean',387),(2180,'East York',387),(2182,'Gloucester',387),(2183,'Guelph',387),(2184,'Sudbury',387),(2185,'Barrie',387),(2186,'MontrÃƒÂ©al',388),(2187,'Laval',388),(2188,'QuÃƒÂ©bec',388),(2189,'Longueuil',388),(2190,'Gatineau',388),(2191,'Saskatoon',389),(2192,'Regina',389),(2193,'Bantam',390),(2194,'West Island',391),(2195,'Basel',392),(2196,'Bern',393),(2197,'Geneve',394),(2198,'Lausanne',395),(2199,'ZÃƒÂ¼rich',396),(2200,'Antofagasta',397),(2201,'Calama',397),(2202,'CopiapÃƒÂ³',398),(2203,'Talcahuano',399),(2204,'ConcepciÃƒÂ³n',399),(2205,'ChillÃƒÂ¡n',399),(2207,'Coronel',399),(2208,'San Pedro de la Paz',399),(2209,'Coquimbo',400),(2210,'La Serena',400),(2211,'Ovalle',400),(2212,'Temuco',401),(2213,'Puerto Montt',402),(2214,'Osorno',402),(2215,'Valdivia',402),(2216,'Punta Arenas',403),(2217,'Talca',404),(2218,'CuricÃƒÂ³',404),(2219,'Rancagua',405),(2225,'Arica',407),(2226,'Iquique',407),(2227,'ViÃƒÂ±a del Mar',408),(2228,'ValparaÃƒÂ­so',408),(2229,'QuilpuÃƒÂ©',408),(2230,'Hefei',409),(2231,'Huainan',409),(2232,'Bengbu',409),(2233,'Wuhu',409),(2234,'Huaibei',409),(2235,'MaÃ?Â´anshan',409),(2236,'Anqing',409),(2237,'Tongling',409),(2238,'Fuyang',409),(2240,'LiuÃ?Â´an',409),(2241,'Chuzhou',409),(2242,'Chaohu',409),(2243,'Xuangzhou',409),(2244,'Bozhou',409),(2245,'Huangshan',409),(2246,'Chongqing',410),(2247,'Fuzhou',411),(2248,'Amoy [Xiamen]',411),(2249,'Nanping',411),(2250,'Quanzhou',411),(2251,'Zhangzhou',411),(2252,'Sanming',411),(2253,'Longyan',411),(2254,'YongÃ?Â´an',411),(2255,'FuÃ?Â´an',411),(2256,'Fuqing',411),(2257,'Putian',411),(2258,'Shaowu',411),(2259,'Lanzhou',412),(2260,'Tianshui',412),(2261,'Baiyin',412),(2262,'Wuwei',412),(2263,'Yumen',412),(2264,'Jinchang',412),(2265,'Pingliang',412),(2266,'Kanton [Guangzhou]',413),(2267,'Shenzhen',413),(2268,'Shantou',413),(2269,'Zhangjiang',413),(2270,'Shaoguan',413),(2271,'Chaozhou',413),(2272,'Dongwan',413),(2273,'Foshan',413),(2274,'Zhongshan',413),(2275,'Jiangmen',413),(2276,'Yangjiang',413),(2277,'Zhaoqing',413),(2278,'Maoming',413),(2279,'Zhuhai',413),(2280,'Qingyuan',413),(2281,'Huizhou',413),(2282,'Meixian',413),(2283,'Heyuan',413),(2284,'Shanwei',413),(2285,'Jieyang',413),(2286,'Nanning',414),(2287,'Liuzhou',414),(2288,'Guilin',414),(2289,'Wuzhou',414),(2290,'Yulin',414),(2291,'Qinzhou',414),(2292,'Guigang',414),(2293,'Beihai',414),(2294,'Bose',414),(2295,'Guiyang',415),(2296,'Liupanshui',415),(2297,'Zunyi',415),(2298,'Anshun',415),(2299,'Duyun',415),(2300,'Kaili',415),(2301,'Haikou',416),(2302,'Sanya',416),(2303,'Shijiazhuang',417),(2304,'Tangshan',417),(2305,'Handan',417),(2306,'Zhangjiakou',417),(2307,'Baoding',417),(2308,'Qinhuangdao',417),(2309,'Xingtai',417),(2310,'Chengde',417),(2311,'Cangzhou',417),(2312,'Langfang',417),(2313,'Renqiu',417),(2314,'Hengshui',417),(2315,'Harbin',418),(2316,'Qiqihar',418),(2318,'Jixi',418),(2319,'Daqing',418),(2320,'Mudanjiang',418),(2321,'Hegang',418),(2322,'Jiamusi',418),(2323,'Shuangyashan',418),(2324,'Tieli',418),(2325,'Suihua',418),(2326,'Shangzi',418),(2327,'Qitaihe',418),(2328,'BeiÃ?Â´an',418),(2329,'Acheng',418),(2330,'Zhaodong',418),(2331,'Shuangcheng',418),(2332,'Anda',418),(2333,'Hailun',418),(2334,'Mishan',418),(2335,'Fujin',418),(2336,'Zhengzhou',419),(2337,'Luoyang',419),(2338,'Kaifeng',419),(2339,'Xinxiang',419),(2340,'Anyang',419),(2341,'Pingdingshan',419),(2342,'Jiaozuo',419),(2343,'Nanyang',419),(2344,'Hebi',419),(2345,'Xuchang',419),(2346,'Xinyang',419),(2347,'Puyang',419),(2348,'Shangqiu',419),(2349,'Zhoukou',419),(2350,'Luohe',419),(2351,'Zhumadian',419),(2352,'Sanmenxia',419),(2353,'Yuzhou',419),(2354,'Wuhan',420),(2355,'Huangshi',420),(2356,'Xiangfan',420),(2357,'Yichang',420),(2358,'Shashi',420),(2359,'Shiyan',420),(2360,'Xiantao',420),(2361,'Qianjiang',420),(2362,'Honghu',420),(2363,'Ezhou',420),(2364,'Tianmen',420),(2365,'Xiaogan',420),(2366,'Zaoyang',420),(2367,'Jinmen',420),(2368,'Suizhou',420),(2369,'Xianning',420),(2370,'Laohekou',420),(2371,'Puqi',420),(2372,'Shishou',420),(2373,'Danjiangkou',420),(2374,'Guangshui',420),(2375,'Enshi',420),(2376,'Changsha',421),(2377,'Hengyang',421),(2378,'Xiangtan',421),(2379,'Zhuzhou',421),(2380,'Yueyang',421),(2381,'Changde',421),(2382,'Shaoyang',421),(2383,'Yiyang',421),(2384,'Chenzhou',421),(2385,'Lengshuijiang',421),(2386,'Leiyang',421),(2387,'Loudi',421),(2388,'Huaihua',421),(2389,'Lianyuan',421),(2390,'Hongjiang',421),(2391,'Zixing',421),(2392,'Liling',421),(2393,'Yuanjiang',421),(2394,'Baotou',422),(2395,'Hohhot',422),(2396,'Yakeshi',422),(2397,'Chifeng',422),(2398,'Wuhai',422),(2399,'Tongliao',422),(2400,'Hailar',422),(2402,'Ulanhot',422),(2403,'Linhe',422),(2404,'Zalantun',422),(2405,'Manzhouli',422),(2406,'Xilin Hot',422),(2407,'Nanking [Nanjing]',423),(2408,'Wuxi',423),(2409,'Xuzhou',423),(2410,'Suzhou',423),(2411,'Changzhou',423),(2412,'Zhenjiang',423),(2413,'Lianyungang',423),(2414,'Nantong',423),(2415,'Yangzhou',423),(2416,'Yancheng',423),(2417,'Huaiyin',423),(2418,'Jiangyin',423),(2419,'Yixing',423),(2420,'Dongtai',423),(2421,'Changshu',423),(2422,'Danyang',423),(2423,'Xinghua',423),(2424,'Taizhou',423),(2425,'HuaiÃ?Â´an',423),(2426,'Qidong',423),(2427,'Liyang',423),(2428,'Yizheng',423),(2429,'Suqian',423),(2430,'Kunshan',423),(2431,'Zhangjiagang',423),(2432,'Nanchang',424),(2433,'Pingxiang',424),(2434,'Jiujiang',424),(2435,'Jingdezhen',424),(2436,'Ganzhou',424),(2437,'Fengcheng',424),(2438,'Xinyu',424),(2439,'Yichun',424),(2440,'JiÃ?Â´an',424),(2441,'Shangrao',424),(2442,'Linchuan',424),(2443,'Changchun',425),(2444,'Jilin',425),(2445,'Hunjiang',425),(2446,'Liaoyuan',425),(2447,'Tonghua',425),(2448,'Siping',425),(2449,'Dunhua',425),(2450,'Yanji',425),(2451,'Gongziling',425),(2452,'Baicheng',425),(2453,'Meihekou',425),(2454,'Fuyu',425),(2455,'Jiutai',425),(2456,'Jiaohe',425),(2457,'Huadian',425),(2458,'Taonan',425),(2459,'Longjing',425),(2460,'DaÃ?Â´an',425),(2461,'Yushu',425),(2462,'Tumen',425),(2463,'Shenyang',426),(2464,'Dalian',426),(2465,'Anshan',426),(2466,'Fushun',426),(2467,'Benxi',426),(2468,'Fuxin',426),(2470,'Dandong',426),(2471,'Liaoyang',426),(2472,'Yingkou',426),(2473,'Panjin',426),(2474,'Jinxi',426),(2475,'Tieling',426),(2476,'Wafangdian',426),(2477,'Chaoyang',426),(2478,'Haicheng',426),(2479,'Beipiao',426),(2480,'Tiefa',426),(2482,'Xingcheng',426),(2483,'Jinzhou',426),(2484,'Yinchuan',427),(2485,'Shizuishan',427),(2486,'Peking',428),(2487,'Tong Xian',428),(2488,'Xining',429),(2489,'XiÃ?Â´an',430),(2490,'Xianyang',430),(2491,'Baoji',430),(2492,'Tongchuan',430),(2493,'Hanzhong',430),(2494,'Ankang',430),(2495,'Weinan',430),(2496,'YanÃ?Â´an',430),(2497,'Qingdao',431),(2498,'Jinan',431),(2499,'Zibo',431),(2500,'Yantai',431),(2501,'Weifang',431),(2502,'Zaozhuang',431),(2503,'TaiÃ?Â´an',431),(2504,'Linyi',431),(2505,'Tengzhou',431),(2506,'Dongying',431),(2507,'Xintai',431),(2508,'Jining',431),(2509,'Laiwu',431),(2510,'Liaocheng',431),(2511,'Laizhou',431),(2512,'Dezhou',431),(2513,'Heze',431),(2514,'Rizhao',431),(2515,'Liangcheng',431),(2516,'Jiaozhou',431),(2517,'Pingdu',431),(2518,'Longkou',431),(2519,'Laiyang',431),(2520,'Wendeng',431),(2521,'Binzhou',431),(2522,'Weihai',431),(2523,'Qingzhou',431),(2524,'Linqing',431),(2525,'Jiaonan',431),(2526,'Zhucheng',431),(2527,'Junan',431),(2528,'Pingyi',431),(2529,'Shanghai',432),(2530,'Taiyuan',433),(2531,'Datong',433),(2532,'Yangquan',433),(2533,'Changzhi',433),(2534,'Yuci',433),(2535,'Linfen',433),(2536,'Jincheng',433),(2537,'Yuncheng',433),(2538,'Xinzhou',433),(2539,'Chengdu',434),(2540,'Panzhihua',434),(2541,'Zigong',434),(2542,'Leshan',434),(2543,'Mianyang',434),(2544,'Luzhou',434),(2545,'Neijiang',434),(2546,'Yibin',434),(2547,'Daxian',434),(2548,'Deyang',434),(2549,'Guangyuan',434),(2550,'Nanchong',434),(2551,'Jiangyou',434),(2552,'Fuling',434),(2553,'Wanxian',434),(2554,'Suining',434),(2555,'Xichang',434),(2556,'Dujiangyan',434),(2557,'YaÃ?Â´an',434),(2558,'Emeishan',434),(2559,'Huaying',434),(2560,'Tianjin',435),(2561,'Lhasa',436),(2562,'UrumtÃ?Â¡i [ÃƒÅ?rÃƒÂ¼mqi]',437),(2563,'Shihezi',437),(2564,'Qaramay',437),(2565,'Ghulja',437),(2566,'Qashqar',437),(2567,'Aqsu',437),(2568,'Hami',437),(2569,'Korla',437),(2570,'Changji',437),(2571,'Kuytun',437),(2572,'Kunming',438),(2573,'Gejiu',438),(2574,'Qujing',438),(2575,'Dali',438),(2576,'Kaiyuan',438),(2577,'Hangzhou',439),(2578,'Ningbo',439),(2579,'Wenzhou',439),(2580,'Huzhou',439),(2581,'Jiaxing',439),(2582,'Shaoxing',439),(2583,'Xiaoshan',439),(2584,'RuiÃ?Â´an',439),(2585,'Zhoushan',439),(2586,'Jinhua',439),(2587,'Yuyao',439),(2588,'Quzhou',439),(2589,'Cixi',439),(2590,'Haining',439),(2591,'Linhai',439),(2592,'Huangyan',439),(2593,'Abidjan',440),(2594,'BouakÃƒÂ©',441),(2595,'Daloa',442),(2596,'Korhogo',443),(2597,'Yamoussoukro',444),(2601,'Maroua',446),(2602,'Douala',447),(2603,'Nkongsamba',447),(2606,'Bamenda',449),(2611,'Kikwit',451),(2612,'Matadi',452),(2613,'Boma',452),(2614,'Mbuji-Mayi',453),(2615,'Mwene-Ditu',453),(2616,'Mbandaka',454),(2617,'Kisangani',455),(2618,'Kinshasa',456),(2619,'Butembo',457),(2620,'Goma',457),(2621,'Lubumbashi',458),(2622,'Kolwezi',458),(2623,'Likasi',458),(2624,'Kalemie',458),(2625,'Bukavu',459),(2626,'Uvira',459),(2627,'Kananga',460),(2628,'Tshikapa',460),(2629,'Brazzaville',461),(2630,'Pointe-Noire',462),(2631,'Avarua',463),(2632,'MedellÃƒÂ­n',464),(2633,'Bello',464),(2634,'ItagÃƒÂ¼ÃƒÂ­',464),(2635,'Envigado',464),(2636,'Barranquilla',465),(2637,'Soledad',465),(2641,'Tunja',467),(2642,'Sogamoso',467),(2643,'Manizales',468),(2644,'Florencia',469),(2645,'PopayÃƒÂ¡n',470),(2647,'RÃƒÂ­o Cuarto',471),(2648,'MonterÃƒÂ­a',471),(2649,'Valledupar',472),(2650,'Soacha',473),(2651,'Girardot',473),(2652,'Neiva',474),(2653,'Maicao',475),(2654,'Santa Marta',476),(2655,'Villavicencio',477),(2656,'Pasto',478),(2657,'CÃƒÂºcuta',479),(2658,'Armenia',480),(2659,'Pereira',481),(2660,'Dos Quebradas',481),(2661,'SantafÃƒÂ© de BogotÃƒÂ¡',482),(2662,'Bucaramanga',483),(2663,'Floridablanca',483),(2664,'Barrancabermeja',483),(2665,'Giron',483),(2669,'IbaguÃƒÂ©',485),(2670,'Cali',486),(2671,'Palmira',486),(2672,'Buenaventura',486),(2673,'TuluÃƒÂ¡',486),(2674,'Cartago',486),(2675,'Buga',486),(2676,'Moroni',487),(2677,'Praia',488),(2678,'San JosÃƒÂ©',489),(2679,'CamagÃƒÂ¼ey',490),(2681,'Cienfuegos',492),(2682,'Bayamo',493),(2684,'GuantÃƒÂ¡namo',494),(2685,'HolguÃƒÂ­n',495),(2686,'La Habana',496),(2687,'Victoria de las Tunas',497),(2688,'Matanzas',498),(2689,'Pinar del RÃƒÂ­o',499),(2690,'Sancti-SpÃƒÂ­ritus',500),(2691,'Santiago de Cuba',501),(2711,'George Town',504),(2712,'Limassol',505),(2713,'Nicosia',506),(2714,'Praha',507),(2715,'CeskÃƒÂ© Budejovice',508),(2716,'Brno',509),(2717,'Liberec',510),(2718,'ÃƒÅ¡stÃƒÂ­ nad Labem',510),(2719,'Ostrava',511),(2720,'Olomouc',511),(2721,'Hradec KrÃƒÂ¡lovÃƒÂ©',512),(2722,'Pardubice',512),(2723,'Plzen',513),(2724,'Halle/Saale',514),(2725,'Magdeburg',514),(2726,'Stuttgart',515),(2727,'Mannheim',515),(2728,'Karlsruhe',515),(2729,'Freiburg im Breisgau',515),(2730,'Heidelberg',515),(2731,'Heilbronn',515),(2732,'Pforzheim',515),(2733,'Ulm',515),(2734,'Reutlingen',515),(2735,'Esslingen am Neckar',515),(2736,'Munich [MÃƒÂ¼nchen]',516),(2737,'NÃƒÂ¼rnberg',516),(2738,'Augsburg',516),(2739,'WÃƒÂ¼rzburg',516),(2740,'Regensburg',516),(2741,'Ingolstadt',516),(2742,'FÃƒÂ¼rth',516),(2743,'Erlangen',516),(2744,'Berlin',517),(2745,'Potsdam',518),(2746,'Cottbus',518),(2747,'Bremen',519),(2748,'Bremerhaven',519),(2749,'Hamburg',520),(2750,'Frankfurt am Main',521),(2751,'Wiesbaden',521),(2752,'Kassel',521),(2753,'Darmstadt',521),(2754,'Offenbach am Main',521),(2755,'Rostock',522),(2756,'Schwerin',522),(2757,'Hannover',523),(2758,'Braunschweig',523),(2759,'OsnabrÃƒÂ¼ck',523),(2760,'Oldenburg',523),(2761,'GÃƒÂ¶ttingen',523),(2762,'Wolfsburg',523),(2763,'Salzgitter',523),(2764,'Hildesheim',523),(2765,'KÃƒÂ¶ln',524),(2766,'Essen',524),(2767,'Dortmund',524),(2768,'DÃƒÂ¼sseldorf',524),(2769,'Duisburg',524),(2770,'Bochum',524),(2771,'Wuppertal',524),(2772,'Bielefeld',524),(2773,'Bonn',524),(2774,'Gelsenkirchen',524),(2775,'MÃƒÂ¼nster',524),(2776,'MÃƒÂ¶nchengladbach',524),(2777,'Aachen',524),(2778,'Krefeld',524),(2779,'Oberhausen',524),(2780,'Hagen',524),(2781,'Hamm',524),(2782,'Herne',524),(2783,'MÃƒÂ¼lheim an der Ruhr',524),(2784,'Solingen',524),(2785,'Leverkusen',524),(2786,'Neuss',524),(2787,'Paderborn',524),(2788,'Recklinghausen',524),(2789,'Bottrop',524),(2790,'Remscheid',524),(2791,'Siegen',524),(2792,'Moers',524),(2793,'Bergisch Gladbach',524),(2794,'Witten',524),(2795,'Iserlohn',524),(2796,'GÃƒÂ¼tersloh',524),(2797,'Marl',524),(2798,'LÃƒÂ¼nen',524),(2799,'DÃƒÂ¼ren',524),(2800,'Ratingen',524),(2801,'Velbert',524),(2802,'Mainz',525),(2803,'Ludwigshafen am Rhein',525),(2804,'Koblenz',525),(2805,'Kaiserslautern',525),(2806,'Trier',525),(2807,'SaarbrÃƒÂ¼cken',526),(2808,'Leipzig',527),(2809,'Dresden',527),(2810,'Chemnitz',527),(2811,'Zwickau',527),(2812,'Kiel',528),(2813,'LÃƒÂ¼beck',528),(2814,'Erfurt',529),(2815,'Gera',529),(2816,'Jena',529),(2817,'Djibouti',530),(2821,'Ãƒâ?¦rhus',532),(2822,'Frederiksberg',533),(2823,'Odense',534),(2824,'KÃƒÂ¸benhavn',535),(2825,'Aalborg',536),(2826,'Santo Domingo de GuzmÃƒÂ¡n',537),(2827,'San Francisco de MacorÃƒÂ­s',538),(2828,'La Romana',539),(2829,'San Felipe de Puerto Plata',540),(2830,'San Pedro de MacorÃƒÂ­s',541),(2831,'Santiago de Chile',542),(2832,'Puente Alto',542),(2833,'San Bernardo',542),(2834,'Melipilla',542),(2835,'Santiago de los Caballeros',542),(2836,'Alger',543),(2837,'Annaba',544),(2838,'Batna',545),(2839,'BÃƒÂ©char',546),(2840,'BÃƒÂ©jaÃƒÂ¯a',547),(2841,'Biskra',548),(2842,'Blida (el-Boulaida)',549),(2843,'Ech-Chleff (el-Asnam)',550),(2844,'Constantine',551),(2845,'GhardaÃƒÂ¯a',552),(2846,'Mostaganem',553),(2847,'Oran',554),(2848,'SÃƒÂ©tif',555),(2849,'Sidi Bel AbbÃƒÂ¨s',556),(2850,'Skikda',557),(2851,'TÃƒÂ©bessa',558),(2852,'Tiaret',559),(2853,'Tlemcen (Tilimsen)',560),(2854,'Cuenca',561),(2855,'RÃƒÂ­obamba',562),(2856,'Machala',563),(2857,'Esmeraldas',564),(2858,'Guayaquil',565),(2859,'Duran [Eloy Alfaro]',565),(2860,'Milagro',565),(2861,'Ibarra',566),(2862,'Loja',567),(2863,'Quevedo',568),(2864,'Portoviejo',569),(2865,'Manta',569),(2866,'Quito',570),(2867,'Santo Domingo de los Colorados',570),(2868,'Ambato',571),(2869,'Kafr al-Dawwar',572),(2870,'Damanhur',572),(2871,'al-Mansura',573),(2872,'Mit Ghamr',573),(2873,'Talkha',573),(2874,'al-Faiyum',574),(2875,'al-Mahallat al-Kubra',575),(2876,'Tanta',575),(2877,'Shibin al-Kawm',576),(2878,'al-Minya',577),(2879,'Mallawi',577),(2880,'Shubra al-Khayma',578),(2881,'Bahtim',578),(2882,'Banha',578),(2883,'Qalyub',578),(2895,'Assuan',581),(2896,'Asyut',582),(2897,'Bani Suwayf',583),(2898,'Giza',584),(2899,'Bulaq al-Dakrur',584),(2900,'Warraq al-Arab',584),(2901,'al-Hawamidiya',584),(2902,'Ismailia',585),(2903,'Kafr al-Shaykh',586),(2904,'Disuq',586),(2905,'Cairo',587),(2906,'Luxor',588),(2907,'Port Said',589),(2908,'Qina',590),(2909,'Idfu',590),(2910,'Sawhaj',591),(2911,'Jirja',591),(2912,'al-Arish',592),(2913,'Suez',593),(2914,'Asmara',594),(2915,'El-AaiÃƒÂºn',595),(2916,'Sevilla',596),(2917,'MÃƒÂ¡laga',596),(2919,'Granada',596),(2920,'Jerez de la Frontera',596),(2921,'AlmerÃƒÂ­a',596),(2922,'CÃƒÂ¡diz',596),(2923,'Huelva',596),(2924,'JaÃƒÂ©n',596),(2925,'Algeciras',596),(2926,'Marbella',596),(2927,'Dos Hermanas',596),(2928,'Zaragoza',597),(2929,'GijÃƒÂ³n',598),(2930,'Oviedo',598),(2931,'Palma de Mallorca',599),(2932,'Bilbao',600),(2933,'Vitoria-Gasteiz',600),(2934,'Donostia-San SebastiÃƒÂ¡n',600),(2935,'Barakaldo',600),(2936,'Las Palmas de Gran Canaria',601),(2937,'Santa Cruz de Tenerife',601),(2938,'[San CristÃƒÂ³bal de] la Laguna',601),(2939,'Santander',602),(2940,'Valladolid',603),(2941,'Burgos',603),(2944,'Badajoz',604),(2945,'Vigo',605),(2946,'A CoruÃƒÂ±a (La CoruÃƒÂ±a)',605),(2947,'Ourense (Orense)',605),(2948,'Santiago de Compostela',605),(2949,'Albacete',606),(2951,'LÃ?Â´Hospitalet de Llobregat',607),(2952,'Badalona',607),(2953,'Sabadell',607),(2954,'Terrassa',607),(2955,'Santa Coloma de Gramenet',607),(2956,'Tarragona',607),(2957,'Lleida (LÃƒÂ©rida)',607),(2958,'MatarÃƒÂ³',607),(2960,'LogroÃƒÂ±o',608),(2961,'Madrid',609),(2962,'MÃƒÂ³stoles',609),(2963,'LeganÃƒÂ©s',609),(2964,'Fuenlabrada',609),(2965,'AlcalÃƒÂ¡ de Henares',609),(2966,'Getafe',609),(2967,'AlcorcÃƒÂ³n',609),(2968,'TorrejÃƒÂ³n de Ardoz',609),(2969,'Murcia',610),(2970,'Cartagena',610),(2971,'Pamplona [IruÃƒÂ±a]',611),(2973,'Alicante [Alacant]',612),(2974,'Elche [Elx]',612),(2975,'CastellÃƒÂ³n de la Plana [Castel',612),(2976,'Tallinn',613),(2977,'Tartu',614),(2978,'Addis Abeba',615),(2979,'Gonder',616),(2980,'Dese',616),(2981,'Bahir Dar',616),(2982,'Dire Dawa',617),(2983,'Nazret',618),(2984,'Mekele',619),(2985,'Helsinki [Helsingfors]',620),(2986,'Espoo',620),(2987,'Vantaa',620),(2988,'Lahti',621),(2989,'Tampere',622),(2990,'Oulu',623),(2991,'Turku [Ãƒâ?¦bo]',624),(3003,'Stanley',626),(3004,'Strasbourg',627),(3005,'Mulhouse',627),(3006,'Bordeaux',628),(3007,'Clermont-Ferrand',629),(3008,'Paris',630),(3009,'Boulogne-Billancourt',630),(3010,'Argenteuil',630),(3011,'Montreuil',630),(3012,'Caen',631),(3013,'Dijon',632),(3014,'St-Ãƒâ?°tienne',633),(3015,'Brest',633),(3016,'YaoundÃƒÂ©',634),(3017,'Tours',634),(3018,'OrlÃƒÂ©ans',634),(3019,'Le Havre',635),(3020,'BesanÃƒÂ§on',636),(3021,'Rennes',637),(3022,'Rouen',637),(3023,'Montpellier',638),(3024,'NÃƒÂ®mes',638),(3025,'Perpignan',638),(3026,'Limoges',639),(3027,'Metz',640),(3028,'Nancy',640),(3029,'Toulouse',641),(3030,'Reims',642),(3031,'Roubaix',642),(3032,'Tourcoing',642),(3033,'Nantes',643),(3034,'Angers',643),(3035,'Le Mans',643),(3036,'Amiens',644),(3037,'Marseille',645),(3038,'Nice',645),(3039,'Toulon',645),(3040,'Aix-en-Provence',645),(3041,'Lyon',646),(3042,'Lille',646),(3043,'Grenoble',646),(3044,'Villeurbanne',646),(3045,'TÃƒÂ³rshavn',647),(3046,'Weno',648),(3047,'Palikir',649),(3048,'Libreville',650),(3067,'London',652),(3069,'Liverpool',652),(3070,'Sheffield',652),(3072,'Leeds',652),(3073,'Bristol',652),(3074,'Coventry',652),(3075,'Leicester',652),(3076,'Bradford',652),(3077,'Nottingham',652),(3078,'Kingston upon Hull',652),(3080,'Stoke-on-Trent',652),(3081,'Wolverhampton',652),(3082,'Derby',652),(3083,'Southampton',652),(3084,'Northampton',652),(3085,'Dudley',652),(3087,'Newcastle upon Tyne',652),(3088,'Sunderland',652),(3089,'Luton',652),(3090,'Swindon',652),(3091,'Southend-on-Sea',652),(3092,'Walsall',652),(3093,'Bournemouth',652),(3094,'Peterborough',652),(3095,'Brighton',652),(3096,'Blackpool',652),(3097,'West Bromwich',652),(3098,'Reading',652),(3099,'Oldbury/Smethwick (Warley)',652),(3100,'Middlesbrough',652),(3101,'Huddersfield',652),(3102,'Oxford',652),(3103,'Poole',652),(3104,'Bolton',652),(3105,'Blackburn',652),(3106,'Preston',652),(3107,'Stockport',652),(3108,'Norwich',652),(3109,'Rotherham',652),(3111,'Watford',652),(3112,'Ipswich',652),(3113,'Slough',652),(3114,'Exeter',652),(3115,'Cheltenham',652),(3117,'Saint Helens',652),(3118,'Sutton Coldfield',652),(3119,'York',652),(3120,'Oldham',652),(3121,'Basildon',652),(3122,'Worthing',652),(3123,'Chelmsford',652),(3124,'Colchester',652),(3125,'Crawley',652),(3126,'Gillingham',652),(3127,'Solihull',652),(3128,'Rochdale',652),(3129,'Birkenhead',652),(3130,'Worcester',652),(3131,'Hartlepool',652),(3132,'Halifax',652),(3133,'Woking/Byfleet',652),(3134,'Southport',652),(3135,'Maidstone',652),(3136,'Eastbourne',652),(3137,'Grimsby',652),(3138,'Saint Helier',653),(3139,'Belfast',654),(3140,'Glasgow',655),(3141,'Edinburgh',655),(3142,'Aberdeen',655),(3143,'Dundee',655),(3144,'Cardiff',656),(3145,'Swansea',656),(3146,'Newport',656),(3147,'Sohumi',657),(3148,'Batumi',658),(3149,'Kutaisi',659),(3150,'Rustavi',660),(3151,'Tbilisi',661),(3152,'Kumasi',662),(3153,'Accra',663),(3154,'Tema',663),(3184,'Basse-Terre',668),(3185,'Les Abymes',669),(3186,'Banjul',670),(3187,'Serekunda',671),(3188,'Bissau',672),(3189,'Malabo',673),(3190,'Athenai',674),(3191,'Pireus',674),(3192,'Peristerion',674),(3193,'Kallithea',674),(3194,'Thessaloniki',675),(3195,'Herakleion',676),(3196,'Larisa',677),(3197,'Patras',678),(3201,'Nuuk',680),(3202,'Ciudad de Guatemala',681),(3203,'Mixco',681),(3204,'Villa Nueva',681),(3205,'Quetzaltenango',682),(3206,'Cayenne',683),(3225,'Georgetown',685),(3227,'Kowloon and New Kowloon',687),(3228,'La Ceiba',688),(3229,'San Pedro Sula',689),(3230,'Tegucigalpa',690),(3231,'Zagreb',691),(3232,'Osijek',692),(3233,'Rijeka',693),(3234,'Split',694),(3235,'Le-Cap-HaÃƒÂ¯tien',695),(3236,'Garoua',695),(3237,'Port-au-Prince',696),(3238,'Carrefour',696),(3239,'Delmas',696),(3240,'Bafoussam',696),(3241,'PÃƒÂ©cs',697),(3242,'KecskemÃƒÂ©t',698),(3243,'Miskolc',699),(3244,'Budapest',700),(3245,'Szeged',701),(3246,'SzÃƒÂ©kesfehÃƒÂ©rvÃƒÂ¡r',702),(3247,'GyÃƒÂ¶r',703),(3248,'Debrecen',704),(3249,'NyiregyhÃƒÂ¡za',705),(3250,'Banda Aceh',706),(3251,'Lhokseumawe',706),(3252,'Denpasar',707),(3253,'Bengkulu',708),(3254,'Semarang',709),(3255,'Surakarta',709),(3256,'Pekalongan',709),(3257,'Tegal',709),(3258,'Cilacap',709),(3259,'Purwokerto',709),(3260,'Magelang',709),(3261,'Pemalang',709),(3262,'Klaten',709),(3263,'Salatiga',709),(3264,'Kudus',709),(3265,'Surabaya',710),(3266,'Malang',710),(3267,'Kediri',710),(3268,'Jember',710),(3269,'Madiun',710),(3270,'Pasuruan',710),(3271,'Waru',710),(3272,'Blitar',710),(3273,'Probolinggo',710),(3274,'Taman',710),(3275,'Mojokerto',710),(3276,'Jombang',710),(3277,'Banyuwangi',710),(3278,'Jakarta',711),(3279,'Jambi',712),(3280,'Pontianak',713),(3281,'Banjarmasin',714),(3282,'Palangka Raya',715),(3283,'Samarinda',716),(3284,'Balikpapan',716),(3285,'Bandar Lampung',717),(3286,'Ambon',718),(3287,'Mataram',719),(3288,'Kupang',720),(3289,'Pekan Baru',721),(3290,'Batam',721),(3291,'Tanjung Pinang',721),(3292,'Ujung Pandang',722),(3293,'Palu',723),(3294,'Kendari',724),(3295,'Manado',725),(3296,'Gorontalo',725),(3297,'Padang',726),(3298,'Palembang',727),(3299,'Pangkal Pinang',727),(3300,'Medan',728),(3301,'Pematang Siantar',728),(3302,'Tebing Tinggi',728),(3303,'Percut Sei Tuan',728),(3304,'Binjai',728),(3305,'Sunggal',728),(3306,'Padang Sidempuan',728),(3307,'Jaya Pura',729),(3308,'Bandung',730),(3309,'Tangerang',730),(3310,'Bekasi',730),(3312,'Cimahi',730),(3313,'Bogor',730),(3314,'Ciputat',730),(3315,'Pondokgede',730),(3316,'Cirebon',730),(3317,'Cimanggis',730),(3318,'Ciomas',730),(3319,'Tasikmalaya',730),(3320,'Karawang',730),(3321,'Sukabumi',730),(3322,'Serang',730),(3323,'Cilegon',730),(3324,'Cianjur',730),(3325,'Ciparay',730),(3326,'Citeureup',730),(3327,'Cibinong',730),(3328,'Purwakarta',730),(3329,'Garut',730),(3330,'Majalaya',730),(3331,'Pondok Aren',730),(3332,'Sawangan',730),(3333,'Yogyakarta',731),(3334,'Depok',731),(3336,'Vishakhapatnam',732),(3337,'Vijayawada',732),(3338,'Guntur',732),(3339,'Warangal',732),(3340,'Rajahmundry',732),(3341,'Nellore',732),(3342,'Kakinada',732),(3343,'Nizamabad',732),(3344,'Kurnool',732),(3345,'Ramagundam',732),(3346,'Eluru',732),(3347,'Kukatpalle',732),(3348,'Anantapur',732),(3349,'Tirupati',732),(3350,'Secunderabad',732),(3351,'Vizianagaram',732),(3352,'Machilipatnam (Masulipatam)',732),(3353,'Lalbahadur Nagar',732),(3354,'Karimnagar',732),(3355,'Tenali',732),(3356,'Adoni',732),(3357,'Proddatur',732),(3358,'Chittoor',732),(3359,'Khammam',732),(3360,'Malkajgiri',732),(3361,'Cuddapah',732),(3362,'Bhimavaram',732),(3363,'Nandyal',732),(3364,'Mahbubnagar',732),(3365,'Guntakal',732),(3366,'Qutubullapur',732),(3367,'Hindupur',732),(3368,'Gudivada',732),(3369,'Ongole',732),(3370,'Guwahati (Gauhati)',733),(3371,'Dibrugarh',733),(3372,'Silchar',733),(3373,'Nagaon',733),(3374,'Patna',734),(3375,'Gaya',734),(3376,'Bhagalpur',734),(3377,'Muzaffarpur',734),(3378,'Darbhanga',734),(3379,'Bihar Sharif',734),(3380,'Arrah (Ara)',734),(3381,'Katihar',734),(3382,'Munger (Monghyr)',734),(3383,'Chapra',734),(3384,'Sasaram',734),(3385,'Dehri',734),(3386,'Bettiah',734),(3387,'Chandigarh',735),(3388,'Raipur',736),(3389,'Bhilai',736),(3390,'Bilaspur',736),(3391,'Durg',736),(3392,'Raj Nandgaon',736),(3393,'Korba',736),(3394,'Raigarh',736),(3395,'Delhi',737),(3396,'New Delhi',737),(3397,'Delhi Cantonment',737),(3398,'Ahmedabad',738),(3399,'Surat',738),(3400,'Vadodara (Baroda)',738),(3401,'Rajkot',738),(3402,'Bhavnagar',738),(3403,'Jamnagar',738),(3404,'Nadiad',738),(3405,'Bharuch (Broach)',738),(3406,'Junagadh',738),(3407,'Navsari',738),(3408,'Gandhinagar',738),(3409,'Veraval',738),(3410,'Porbandar',738),(3411,'Anand',738),(3412,'Surendranagar',738),(3413,'Gandhidham',738),(3414,'Bhuj',738),(3415,'Godhra',738),(3416,'Patan',738),(3417,'Morvi',738),(3418,'Vejalpur',738),(3419,'Faridabad',739),(3420,'Rohtak',739),(3421,'Panipat',739),(3422,'Karnal',739),(3423,'Hisar (Hissar)',739),(3424,'Yamuna Nagar',739),(3425,'Sonipat (Sonepat)',739),(3426,'Gurgaon',739),(3427,'Sirsa',739),(3428,'Ambala',739),(3429,'Bhiwani',739),(3430,'Ambala Sadar',739),(3431,'Srinagar',740),(3432,'Jammu',740),(3433,'Ranchi',741),(3434,'Jamshedpur',741),(3435,'Bokaro Steel City',741),(3436,'Dhanbad',741),(3437,'Purnea (Purnia)',741),(3438,'Mango',741),(3439,'Hazaribag',741),(3440,'Purulia',741),(3441,'Bangalore',742),(3442,'Hubli-Dharwad',742),(3443,'Mysore',742),(3444,'Belgaum',742),(3445,'Gulbarga',742),(3446,'Mangalore',742),(3447,'Davangere',742),(3448,'Bellary',742),(3449,'Bijapur',742),(3450,'Shimoga',742),(3451,'Raichur',742),(3452,'Timkur',742),(3453,'Gadag Betigeri',742),(3454,'Mandya',742),(3455,'Bidar',742),(3456,'Hospet',742),(3457,'Hassan',742),(3458,'Cochin (Kochi)',743),(3459,'Thiruvananthapuram (Trivandrum',743),(3460,'Calicut (Kozhikode)',743),(3461,'Allappuzha (Alleppey)',743),(3462,'Kollam (Quilon)',743),(3463,'Palghat (Palakkad)',743),(3464,'Tellicherry (Thalassery)',743),(3465,'Indore',744),(3466,'Bhopal',744),(3467,'Jabalpur',744),(3468,'Gwalior',744),(3469,'Ujjain',744),(3470,'Sagar',744),(3471,'Ratlam',744),(3472,'Burhanpur',744),(3473,'Dewas',744),(3474,'Murwara (Katni)',744),(3475,'Satna',744),(3476,'Morena',744),(3477,'Khandwa',744),(3478,'Rewa',744),(3479,'Bhind',744),(3480,'Shivapuri',744),(3481,'Guna',744),(3482,'Mandasor',744),(3483,'Damoh',744),(3484,'Chhindwara',744),(3485,'Vidisha',744),(3486,'Mumbai (Bombay)',745),(3487,'Nagpur',745),(3488,'Pune',745),(3489,'Kalyan',745),(3490,'Thane (Thana)',745),(3491,'Nashik (Nasik)',745),(3492,'Solapur (Sholapur)',745),(3493,'Shambajinagar (Aurangabad)',745),(3494,'Pimpri-Chinchwad',745),(3495,'Amravati',745),(3496,'Kolhapur',745),(3497,'Bhiwandi',745),(3498,'Ulhasnagar',745),(3499,'Malegaon',745),(3500,'Akola',745),(3501,'New Bombay',745),(3502,'Dhule (Dhulia)',745),(3503,'Nanded (Nander)',745),(3504,'Jalgaon',745),(3505,'Chandrapur',745),(3506,'Ichalkaranji',745),(3507,'Latur',745),(3508,'Sangli',745),(3509,'Parbhani',745),(3510,'Ahmadnagar',745),(3511,'Mira Bhayandar',745),(3512,'Jalna',745),(3513,'Bhusawal',745),(3514,'Miraj',745),(3515,'Bhir (Bid)',745),(3516,'Gondiya',745),(3517,'Yeotmal (Yavatmal)',745),(3518,'Wardha',745),(3519,'Achalpur',745),(3520,'Satara',745),(3521,'Imphal',746),(3522,'Shillong',747),(3523,'Aizawl',748),(3524,'Bhubaneswar',749),(3525,'Kataka (Cuttack)',749),(3526,'Raurkela',749),(3527,'Brahmapur',749),(3528,'Raurkela Civil Township',749),(3529,'Sambalpur',749),(3530,'Puri',749),(3531,'Pondicherry',750),(3579,'Jaipur',752),(3580,'Jodhpur',752),(3581,'Kota',752),(3582,'Bikaner',752),(3583,'Ajmer',752),(3584,'Udaipur',752),(3585,'Alwar',752),(3586,'Bhilwara',752),(3587,'Ganganagar',752),(3588,'Bharatpur',752),(3589,'Sikar',752),(3590,'Pali',752),(3591,'Beawar',752),(3592,'Tonk',752),(3593,'Chennai (Madras)',753),(3594,'Madurai',753),(3595,'Coimbatore',753),(3596,'Tiruchirapalli',753),(3597,'Salem',753),(3598,'Tiruppur (Tirupper)',753),(3599,'Ambattur',753),(3600,'Thanjavur',753),(3601,'Tuticorin',753),(3602,'Nagar Coil',753),(3603,'Avadi',753),(3604,'Dindigul',753),(3605,'Vellore',753),(3606,'Tiruvottiyur',753),(3607,'Erode',753),(3608,'Cuddalore',753),(3609,'Kanchipuram',753),(3610,'Kumbakonam',753),(3611,'Tirunelveli',753),(3612,'Alandur',753),(3613,'Neyveli',753),(3614,'Rajapalaiyam',753),(3615,'Pallavaram',753),(3616,'Tiruvannamalai',753),(3617,'Tambaram',753),(3618,'Valparai',753),(3619,'Pudukkottai',753),(3620,'Palayankottai',753),(3621,'Agartala',754),(3622,'Kanpur',755),(3623,'Lucknow',755),(3624,'Varanasi (Benares)',755),(3625,'Agra',755),(3626,'Allahabad',755),(3627,'Meerut',755),(3628,'Bareilly',755),(3629,'Gorakhpur',755),(3630,'Aligarh',755),(3631,'Ghaziabad',755),(3632,'Moradabad',755),(3633,'Saharanpur',755),(3634,'Jhansi',755),(3635,'Rampur',755),(3636,'Muzaffarnagar',755),(3637,'Shahjahanpur',755),(3638,'Mathura',755),(3639,'Firozabad',755),(3640,'Farrukhabad-cum-Fatehgarh',755),(3641,'Mirzapur-cum-Vindhyachal',755),(3642,'Sambhal',755),(3643,'Noida',755),(3644,'Hapur',755),(3645,'Amroha',755),(3646,'Maunath Bhanjan',755),(3647,'Jaunpur',755),(3648,'Bahraich',755),(3649,'Rae Bareli',755),(3650,'Bulandshahr',755),(3651,'Faizabad',755),(3652,'Etawah',755),(3653,'Sitapur',755),(3654,'Fatehpur',755),(3655,'Budaun',755),(3656,'Hathras',755),(3657,'Unnao',755),(3658,'Pilibhit',755),(3659,'Gonda',755),(3660,'Modinagar',755),(3661,'Orai',755),(3662,'Banda',755),(3663,'Meerut Cantonment',755),(3664,'Kanpur Cantonment',755),(3665,'Dehra Dun',756),(3666,'Hardwar (Haridwar)',756),(3667,'Haldwani-cum-Kathgodam',756),(3668,'Calcutta [Kolkata]',757),(3669,'Haora (Howrah)',757),(3670,'Durgapur',757),(3671,'Bhatpara',757),(3672,'Panihati',757),(3673,'Kamarhati',757),(3674,'Asansol',757),(3675,'Barddhaman (Burdwan)',757),(3676,'South Dum Dum',757),(3677,'Barahanagar (Baranagar)',757),(3678,'Siliguri (Shiliguri)',757),(3679,'Bally',757),(3680,'Kharagpur',757),(3681,'Burnpur',757),(3682,'Uluberia',757),(3683,'Hugli-Chinsurah',757),(3684,'Raiganj',757),(3685,'North Dum Dum',757),(3686,'Dabgram',757),(3687,'Ingraj Bazar (English Bazar)',757),(3688,'Serampore',757),(3689,'Barrackpur',757),(3690,'Naihati',757),(3691,'Midnapore (Medinipur)',757),(3692,'Navadwip',757),(3693,'Krishnanagar',757),(3694,'Chandannagar',757),(3695,'Balurghat',757),(3696,'Berhampore (Baharampur)',757),(3697,'Bankura',757),(3698,'Titagarh',757),(3699,'Halisahar',757),(3700,'Santipur',757),(3701,'Kulti-Barakar',757),(3702,'Barasat',757),(3703,'Rishra',757),(3704,'Basirhat',757),(3705,'Uttarpara-Kotrung',757),(3706,'North Barrackpur',757),(3707,'Haldia',757),(3708,'Habra',757),(3709,'Kanchrapara',757),(3710,'Champdani',757),(3711,'Ashoknagar-Kalyangarh',757),(3712,'Bansberia',757),(3713,'Baidyabati',757),(3714,'Dublin',758),(3715,'Cork',759),(3716,'Ardebil',760),(3717,'Bushehr',761),(3718,'Shahr-e Kord',762),(3719,'Tabriz',763),(3720,'Maragheh',763),(3721,'Marand',763),(3722,'Esfahan',764),(3723,'Kashan',764),(3724,'Najafabad',764),(3725,'Khomeynishahr',764),(3726,'Qomsheh',764),(3727,'Shiraz',765),(3728,'Marv Dasht',765),(3729,'Jahrom',765),(3730,'Rasht',766),(3731,'Bandar-e Anzali',766),(3732,'Gorgan',767),(3733,'Hamadan',768),(3734,'Malayer',768),(3735,'Bandar-e-Abbas',769),(3736,'Ilam',770),(3737,'Kerman',771),(3738,'Sirjan',771),(3739,'Rafsanjan',771),(3740,'Kermanshah',772),(3741,'Mashhad',773),(3742,'Sabzevar',773),(3743,'Neyshabur',773),(3744,'Bojnurd',773),(3745,'Birjand',773),(3746,'Torbat-e Heydariyeh',773),(3747,'Ahvaz',774),(3748,'Abadan',774),(3749,'Dezful',774),(3750,'Masjed-e-Soleyman',774),(3751,'Andimeshk',774),(3752,'Khorramshahr',774),(3753,'Sanandaj',775),(3754,'Saqqez',775),(3755,'Khorramabad',776),(3756,'Borujerd',776),(3757,'Arak',777),(3758,'Sari',778),(3759,'Amol',778),(3760,'Babol',778),(3761,'Qaemshahr',778),(3762,'Gonbad-e Qabus',778),(3763,'Qazvin',779),(3764,'Qom',780),(3765,'Saveh',780),(3766,'Shahrud',781),(3767,'Semnan',781),(3768,'Zahedan',782),(3769,'Zabol',782),(3770,'Teheran',783),(3771,'Karaj',783),(3772,'Eslamshahr',783),(3773,'Qarchak',783),(3774,'Qods',783),(3775,'Varamin',783),(3776,'Urmia',784),(3777,'Khoy',784),(3778,'Bukan',784),(3779,'Mahabad',784),(3780,'Miandoab',784),(3781,'Yazd',785),(3782,'Zanjan',786),(3783,'al-Ramadi',787),(3784,'al-Najaf',788),(3785,'al-Diwaniya',789),(3786,'al-Sulaymaniya',790),(3787,'Kirkuk',791),(3788,'al-Hilla',792),(3789,'Baghdad',793),(3790,'Basra',794),(3791,'al-Nasiriya',795),(3792,'Baquba',796),(3793,'Irbil',797),(3794,'Karbala',798),(3795,'al-Amara',799),(3796,'Mosul',800),(3797,'al-Kut',801),(3798,'ReykjavÃƒÂ­k',802),(3799,'Beerseba',803),(3800,'Ashdod',803),(3801,'Ashqelon',803),(3802,'Rishon Le Ziyyon',804),(3803,'Petah Tiqwa',804),(3804,'Netanya',804),(3805,'Rehovot',804),(3806,'Haifa',805),(3807,'Jerusalem',806),(3808,'Tel Aviv-Jaffa',807),(3809,'Holon',807),(3810,'Bat Yam',807),(3811,'Bene Beraq',807),(3812,'Ramat Gan',807),(3813,'Pescara',808),(3814,'Bari',809),(3815,'Taranto',809),(3816,'Foggia',809),(3817,'Lecce',809),(3818,'Andria',809),(3819,'Brindisi',809),(3820,'Barletta',809),(3821,'Reggio di Calabria',810),(3822,'Catanzaro',810),(3823,'Napoli',811),(3824,'Salerno',811),(3825,'Torre del Greco',811),(3826,'Giugliano in Campania',811),(3827,'Bologna',812),(3828,'Modena',812),(3829,'Parma',812),(3830,'Reggio nellÃ?Â´ Emilia',812),(3831,'Ravenna',812),(3832,'Ferrara',812),(3833,'Rimini',812),(3834,'ForlÃƒÂ¬',812),(3835,'Piacenza',812),(3836,'Cesena',812),(3837,'Trieste',813),(3838,'Udine',813),(3839,'Roma',814),(3840,'Latina',814),(3841,'Genova',815),(3842,'La Spezia',815),(3843,'Milano',816),(3844,'Brescia',816),(3845,'Monza',816),(3846,'Bergamo',816),(3847,'Ancona',817),(3848,'Pesaro',817),(3849,'Torino',818),(3850,'Novara',818),(3851,'Alessandria',818),(3852,'Cagliari',819),(3853,'Sassari',819),(3854,'Palermo',820),(3855,'Catania',820),(3856,'Messina',820),(3857,'Syrakusa',820),(3858,'Firenze',821),(3859,'Prato',821),(3860,'Livorno',821),(3861,'Pisa',821),(3862,'Arezzo',821),(3863,'Trento',822),(3864,'Bolzano',822),(3865,'Perugia',823),(3866,'Terni',823),(3867,'Venezia',824),(3868,'Verona',824),(3869,'Padova',824),(3870,'Vicenza',824),(3872,'Portmore',825),(3873,'Spanish Town',826),(3874,'al-Zarqa',827),(3875,'al-Rusayfa',827),(3876,'Amman',828),(3877,'Wadi al-Sir',828),(3878,'Irbid',829),(3879,'Nagoya',830),(3880,'Toyohashi',830),(3881,'Toyota',830),(3882,'Okazaki',830),(3883,'Kasugai',830),(3884,'Ichinomiya',830),(3885,'Anjo',830),(3886,'Komaki',830),(3887,'Seto',830),(3888,'Kariya',830),(3889,'Toyokawa',830),(3890,'Handa',830),(3891,'Tokai',830),(3892,'Inazawa',830),(3893,'Konan',830),(3894,'Akita',831),(3895,'Aomori',832),(3896,'Hachinohe',832),(3897,'Hirosaki',832),(3898,'Chiba',833),(3899,'Funabashi',833),(3900,'Matsudo',833),(3901,'Ichikawa',833),(3902,'Kashiwa',833),(3903,'Ichihara',833),(3904,'Sakura',833),(3905,'Yachiyo',833),(3906,'Narashino',833),(3907,'Nagareyama',833),(3908,'Urayasu',833),(3909,'Abiko',833),(3910,'Kisarazu',833),(3911,'Noda',833),(3912,'Kamagaya',833),(3913,'Nishio',833),(3914,'Kimitsu',833),(3915,'Mobara',833),(3916,'Narita',833),(3917,'Matsuyama',834),(3918,'Niihama',834),(3919,'Imabari',834),(3920,'Fukui',835),(3921,'Fukuoka',836),(3922,'Kitakyushu',836),(3923,'Kurume',836),(3924,'Omuta',836),(3925,'Kasuga',836),(3926,'Iwaki',837),(3927,'Koriyama',837),(3928,'Fukushima',837),(3929,'Aizuwakamatsu',837),(3930,'Gifu',838),(3931,'Ogaki',838),(3932,'Kakamigahara',838),(3933,'Tajimi',838),(3934,'Maebashi',839),(3935,'Takasaki',839),(3936,'Ota',839),(3937,'Isesaki',839),(3938,'Kiryu',839),(3939,'Hiroshima',840),(3940,'Fukuyama',840),(3941,'Kure',840),(3942,'Higashihiroshima',840),(3943,'Onomichi',840),(3944,'Sapporo',841),(3945,'Asahikawa',841),(3946,'Hakodate',841),(3947,'Kushiro',841),(3948,'Obihiro',841),(3949,'Tomakomai',841),(3950,'Otaru',841),(3951,'Ebetsu',841),(3952,'Kitami',841),(3953,'Muroran',841),(3954,'Kobe',842),(3955,'Amagasaki',842),(3956,'Himeji',842),(3957,'Nishinomiya',842),(3958,'Akashi',842),(3959,'Kakogawa',842),(3960,'Takarazuka',842),(3961,'Itami',842),(3962,'Kawanishi',842),(3963,'Sanda',842),(3964,'Takasago',842),(3965,'Mito',843),(3966,'Hitachi',843),(3967,'Tsukuba',843),(3968,'Tama',843),(3969,'Tsuchiura',843),(3970,'Kanazawa',844),(3971,'Komatsu',844),(3972,'Morioka',845),(3973,'Takamatsu',846),(3974,'Kagoshima',847),(3975,'Jokohama [Yokohama]',848),(3976,'Kawasaki',848),(3977,'Sagamihara',848),(3978,'Yokosuka',848),(3979,'Fujisawa',848),(3980,'Hiratsuka',848),(3981,'Chigasaki',848),(3982,'Atsugi',848),(3983,'Yamato',848),(3984,'Odawara',848),(3985,'Kamakura',848),(3986,'Hadano',848),(3987,'Zama',848),(3988,'Ebina',848),(3989,'Isehara',848),(3990,'Kochi',849),(3991,'Kumamoto',850),(3992,'Yatsushiro',850),(3993,'Kioto',851),(3994,'Uji',851),(3995,'Maizuru',851),(3996,'Kameoka',851),(3997,'Yokkaichi',852),(3998,'Suzuka',852),(3999,'Tsu',852),(4000,'Matsusaka',852),(4001,'Kuwana',852),(4002,'Ise',852),(4003,'Sendai',853),(4004,'Ishinomaki',853),(4005,'Miyazaki',854),(4006,'Miyakonojo',854),(4007,'Nobeoka',854),(4008,'Nagano',855),(4009,'Matsumoto',855),(4010,'Ueda',855),(4011,'Iida',855),(4012,'Nagasaki',856),(4013,'Sasebo',856),(4014,'Isahaya',856),(4015,'Nara',857),(4016,'Kashihara',857),(4017,'Ikoma',857),(4018,'Yamatokoriyama',857),(4019,'Niigata',858),(4020,'Nagaoka',858),(4021,'Joetsu',858),(4022,'Kashiwazaki',858),(4023,'Oita',859),(4024,'Beppu',859),(4025,'Okayama',860),(4026,'Kurashiki',860),(4027,'Tsuyama',860),(4028,'Naha',861),(4029,'Okinawa',861),(4030,'Urasoe',861),(4031,'Osaka',862),(4032,'Sakai',862),(4033,'Higashiosaka',862),(4034,'Hirakata',862),(4035,'Toyonaka',862),(4036,'Takatsuki',862),(4037,'Suita',862),(4038,'Yao',862),(4039,'Ibaraki',862),(4040,'Neyagawa',862),(4041,'Kishiwada',862),(4042,'Izumi',862),(4043,'Moriguchi',862),(4044,'Kadoma',862),(4045,'Matsubara',862),(4046,'Daito',862),(4047,'Minoo',862),(4048,'Tondabayashi',862),(4049,'Kawachinagano',862),(4050,'Habikino',862),(4051,'Ikeda',862),(4052,'Izumisano',862),(4053,'Saga',863),(4054,'Urawa',864),(4055,'Kawaguchi',864),(4056,'Omiya',864),(4057,'Kawagoe',864),(4058,'Tokorozawa',864),(4059,'Koshigaya',864),(4060,'Soka',864),(4061,'Ageo',864),(4062,'Kasukabe',864),(4063,'Sayama',864),(4064,'Kumagaya',864),(4065,'Niiza',864),(4066,'Iruma',864),(4067,'Misato',864),(4068,'Asaka',864),(4069,'Iwatsuki',864),(4070,'Toda',864),(4071,'Fukaya',864),(4072,'Sakado',864),(4073,'Fujimi',864),(4074,'Higashimatsuyama',864),(4075,'Otsu',865),(4076,'Kusatsu',865),(4077,'Hikone',865),(4078,'Matsue',866),(4079,'Hamamatsu',867),(4080,'Shizuoka',867),(4081,'Shimizu',867),(4082,'Fuji',867),(4083,'Numazu',867),(4084,'Fujieda',867),(4085,'Fujinomiya',867),(4086,'Yaizu',867),(4087,'Mishima',867),(4088,'Utsunomiya',868),(4089,'Ashikaga',868),(4090,'Oyama',868),(4091,'Kanuma',868),(4092,'Tokushima',869),(4093,'Tokyo',870),(4094,'Hachioji',870),(4095,'Machida',870),(4096,'Fuchu',870),(4097,'Chofu',870),(4098,'Kodaira',870),(4099,'Mitaka',870),(4100,'Hino',870),(4101,'Tachikawa',870),(4102,'Hitachinaka',870),(4103,'Ome',870),(4104,'Higashimurayama',870),(4105,'Musashino',870),(4106,'Higashikurume',870),(4107,'Koganei',870),(4108,'Kokubunji',870),(4109,'Akishima',870),(4110,'Hoya',870),(4111,'Tottori',871),(4112,'Yonago',871),(4113,'Toyama',872),(4114,'Takaoka',872),(4115,'Wakayama',873),(4116,'Yamagata',874),(4117,'Sakata',874),(4118,'Tsuruoka',874),(4119,'Yonezawa',874),(4120,'Shimonoseki',875),(4121,'Ube',875),(4122,'Yamaguchi',875),(4123,'Hofu',875),(4124,'Tokuyama',875),(4125,'Iwakuni',875),(4126,'Kofu',876),(4127,'Taldyqorghan',877),(4128,'Almaty',878),(4129,'AqtÃƒÂ¶be',879),(4130,'Astana',880),(4131,'Atyrau',881),(4132,'Ãƒâ??skemen',882),(4133,'Semey',882),(4134,'Aqtau',883),(4135,'Petropavl',884),(4136,'KÃƒÂ¶kshetau',884),(4137,'Pavlodar',885),(4138,'Ekibastuz',885),(4139,'Qaraghandy',886),(4140,'Temirtau',886),(4141,'Zhezqazghan',886),(4142,'Qostanay',887),(4143,'Rudnyy',887),(4144,'Qyzylorda',888),(4145,'Shymkent',889),(4146,'Taraz',890),(4147,'Oral',891),(4159,'Mombasa',893),(4163,'Nairobi',895),(4164,'Kisumu',896),(4165,'Nakuru',897),(4166,'Eldoret',897),(4167,'Bishkek',898),(4168,'Osh',899),(4169,'Battambang',900),(4170,'Phnom Penh',901),(4171,'Siem Reap',902),(4172,'Bikenibeu',903),(4173,'Bairiki',903),(4174,'Basseterre',904),(4175,'Cheju',905),(4176,'Chonju',906),(4177,'Iksan',906),(4178,'Kunsan',906),(4179,'Chong-up',906),(4180,'Kimje',906),(4181,'Namwon',906),(4182,'Sunchon',907),(4183,'Mokpo',907),(4184,'Yosu',907),(4185,'Kwang-yang',907),(4186,'Naju',907),(4187,'Chongju',908),(4188,'Chungju',908),(4189,'Chechon',908),(4190,'Chonan',909),(4191,'Asan',909),(4192,'Nonsan',909),(4193,'Sosan',909),(4194,'Kongju',909),(4195,'Poryong',909),(4196,'Inchon',910),(4197,'Wonju',911),(4198,'Chunchon',911),(4199,'Kangnung',911),(4200,'Tonghae',911),(4201,'Kwangju',912),(4202,'Songnam',913),(4203,'Puchon',913),(4204,'Suwon',913),(4206,'Koyang',913),(4207,'Ansan',913),(4208,'Kwangmyong',913),(4209,'Pyongtaek',913),(4210,'Uijongbu',913),(4211,'Yong-in',913),(4212,'Kunpo',913),(4213,'Namyangju',913),(4214,'Paju',913),(4215,'Ichon',913),(4216,'Kuri',913),(4217,'Shihung',913),(4218,'Hanam',913),(4219,'Uiwang',913),(4220,'Pohang',914),(4221,'Kumi',914),(4222,'Kyongju',914),(4223,'Andong',914),(4224,'Kyongsan',914),(4225,'Kimchon',914),(4226,'Yongju',914),(4227,'Sangju',914),(4228,'Yongchon',914),(4229,'Mun-gyong',914),(4230,'Ulsan',915),(4231,'Chang-won',915),(4232,'Masan',915),(4233,'Chinju',915),(4234,'Kimhae',915),(4235,'Yangsan',915),(4236,'Koje',915),(4237,'Tong-yong',915),(4238,'Chinhae',915),(4239,'Miryang',915),(4240,'Sachon',915),(4241,'Pusan',916),(4242,'Seoul',917),(4243,'Taegu',918),(4244,'Taejon',919),(4245,'Kuwait',920),(4246,'al-Salimiya',921),(4247,'Jalib al-Shuyukh',921),(4248,'Savannakhet',922),(4249,'Vientiane',923),(4251,'Beirut',925),(4252,'Monrovia',926),(4253,'al-Zawiya',927),(4254,'Bengasi',928),(4255,'Misrata',929),(4256,'Tripoli',930),(4257,'Castries',931),(4258,'Schaan',932),(4259,'Vaduz',933),(4271,'Tamale',935),(4272,'Jaffna',935),(4281,'Maseru',937),(4282,'Kaunas',938),(4283,'Klaipeda',939),(4284,'Panevezys',940),(4285,'Vilnius',941),(4286,'Ã?Â iauliai',942),(4287,'Luxembourg [Luxemburg/LÃƒÂ«tzebu',943),(4288,'Daugavpils',944),(4289,'Liepaja',945),(4290,'Riga',946),(4291,'Macao',947),(4292,'Casablanca',948),(4293,'Mohammedia',948),(4294,'Khouribga',949),(4295,'Settat',949),(4296,'Safi',950),(4297,'El Jadida',950),(4298,'FÃƒÂ¨s',951),(4299,'KÃƒÂ©nitra',952),(4300,'Marrakech',953),(4301,'MeknÃƒÂ¨s',954),(4302,'Oujda',955),(4303,'Nador',955),(4304,'Rabat',956),(4305,'SalÃƒÂ©',956),(4306,'TÃƒÂ©mara',956),(4307,'Agadir',957),(4308,'Beni-Mellal',958),(4309,'Tanger',959),(4310,'TÃƒÂ©touan',959),(4311,'Ksar el Kebir',959),(4312,'El Araich',959),(4313,'Taza',960),(4332,'Balti',962),(4333,'Bender (TÃƒÂ®ghina)',963),(4334,'Chisinau',964),(4335,'Tiraspol',965),(4336,'Antananarivo',966),(4337,'AntsirabÃƒÂ©',966),(4338,'Fianarantsoa',967),(4339,'Mahajanga',968),(4340,'Toamasina',969),(4341,'Male',970),(4342,'Aguascalientes',971),(4343,'Tijuana',972),(4344,'Mexicali',972),(4345,'Ensenada',972),(4347,'Los Cabos',973),(4348,'Campeche',974),(4349,'Carmen',974),(4350,'Tuxtla GutiÃƒÂ©rrez',975),(4351,'Tapachula',975),(4352,'Ocosingo',975),(4353,'San CristÃƒÂ³bal de las Casas',975),(4354,'ComitÃƒÂ¡n de DomÃƒÂ­nguez',975),(4355,'Las Margaritas',975),(4356,'JuÃƒÂ¡rez',976),(4357,'Chihuahua',976),(4358,'CuauhtÃƒÂ©moc',976),(4359,'Delicias',976),(4360,'Hidalgo del Parral',976),(4361,'Saltillo',977),(4362,'TorreÃƒÂ³n',977),(4363,'Monclova',977),(4364,'Piedras Negras',977),(4365,'AcuÃƒÂ±a',977),(4367,'Colima',978),(4368,'Manzanillo',978),(4369,'TecomÃƒÂ¡n',978),(4370,'Buenos Aires',979),(4375,'Durango',980),(4376,'GÃƒÂ³mez Palacio',980),(4377,'Lerdo',980),(4379,'Irapuato',981),(4380,'Celaya',981),(4381,'Salamanca',981),(4382,'PÃƒÂ©njamo',981),(4383,'Guanajuato',981),(4384,'Allende',981),(4385,'Silao',981),(4386,'Valle de Santiago',981),(4387,'Dolores Hidalgo',981),(4388,'AcÃƒÂ¡mbaro',981),(4389,'San Francisco del RincÃƒÂ³n',981),(4390,'San Luis de la Paz',981),(4392,'Salvatierra',981),(4393,'Acapulco de JuÃƒÂ¡rez',982),(4394,'Chilpancingo de los Bravo',982),(4395,'Iguala de la Independencia',982),(4396,'Chilapa de Alvarez',982),(4397,'Taxco de AlarcÃƒÂ³n',982),(4398,'JosÃƒÂ© Azueta',982),(4399,'Pachuca de Soto',983),(4400,'Tulancingo de Bravo',983),(4401,'Huejutla de Reyes',983),(4402,'Guadalajara',984),(4403,'Zapopan',984),(4404,'Tlaquepaque',984),(4405,'TonalÃƒÂ¡',984),(4406,'Puerto Vallarta',984),(4407,'Lagos de Moreno',984),(4408,'Tlajomulco de ZÃƒÂºÃƒÂ±iga',984),(4409,'TepatitlÃƒÂ¡n de Morelos',984),(4410,'Ecatepec de Morelos',985),(4411,'NezahualcÃƒÂ³yotl',985),(4412,'Naucalpan de JuÃƒÂ¡rez',985),(4413,'Tlalnepantla de Baz',985),(4414,'Toluca',985),(4415,'ChimalhuacÃƒÂ¡n',985),(4416,'AtizapÃƒÂ¡n de Zaragoza',985),(4417,'CuautitlÃƒÂ¡n Izcalli',985),(4418,'TultitlÃƒÂ¡n',985),(4419,'Valle de Chalco Solidaridad',985),(4420,'Ixtapaluca',985),(4421,'NicolÃƒÂ¡s Romero',985),(4422,'Coacalco de BerriozÃƒÂ¡bal',985),(4423,'Chalco',985),(4424,'La Paz',985),(4425,'Texcoco',985),(4426,'Metepec',985),(4427,'Huixquilucan',985),(4428,'San Felipe del Progreso',985),(4429,'TecÃƒÂ¡mac',985),(4430,'Zinacantepec',985),(4431,'Ixtlahuaca',985),(4432,'Almoloya de JuÃƒÂ¡rez',985),(4433,'Zumpango',985),(4434,'Lerma',985),(4435,'Tejupilco',985),(4436,'Tultepec',985),(4437,'Morelia',986),(4438,'Uruapan',986),(4439,'LÃƒÂ¡zaro CÃƒÂ¡rdenas',986),(4440,'Zamora',986),(4441,'ZitÃƒÂ¡cuaro',986),(4442,'ApatzingÃƒÂ¡n',986),(4443,'Hidalgo',986),(4444,'Cuernavaca',987),(4445,'Jiutepec',987),(4446,'Cuautla',987),(4447,'Temixco',987),(4448,'Tepic',988),(4449,'Santiago Ixcuintla',988),(4450,'Monterrey',989),(4452,'San NicolÃƒÂ¡s de los Garza',989),(4453,'Apodaca',989),(4454,'General Escobedo',989),(4455,'Santa Catarina',989),(4456,'San Pedro Garza GarcÃƒÂ­a',989),(4457,'Oaxaca de JuÃƒÂ¡rez',990),(4458,'San Juan Bautista Tuxtepec',990),(4459,'Puebla',991),(4460,'TehuacÃƒÂ¡n',991),(4461,'San MartÃƒÂ­n Texmelucan',991),(4462,'Atlixco',991),(4463,'San Pedro Cholula',991),(4464,'San Juan del RÃƒÂ­o',992),(4465,'QuerÃƒÂ©taro',993),(4466,'Benito JuÃƒÂ¡rez',994),(4467,'OthÃƒÂ³n P. Blanco (Chetumal)',994),(4468,'San Luis PotosÃƒÂ­',995),(4469,'Soledad de Graciano SÃƒÂ¡nchez',995),(4470,'Ciudad Valles',995),(4471,'CuliacÃƒÂ¡n',996),(4472,'MazatlÃƒÂ¡n',996),(4473,'Ahome',996),(4474,'Guasave',996),(4475,'Navolato',996),(4476,'El Fuerte',996),(4477,'Hermosillo',997),(4478,'Cajeme',997),(4479,'Nogales',997),(4480,'San Luis RÃƒÂ­o Colorado',997),(4481,'Navojoa',997),(4482,'Guaymas',997),(4483,'Centro (Villahermosa)',998),(4484,'CÃƒÂ¡rdenas',998),(4485,'Comalcalco',998),(4486,'Huimanguillo',998),(4487,'Macuspana',998),(4488,'CunduacÃƒÂ¡n',998),(4489,'Reynosa',999),(4490,'Matamoros',999),(4491,'Nuevo Laredo',999),(4492,'Tampico',999),(4494,'Ciudad Madero',999),(4495,'Altamira',999),(4496,'El Mante',999),(4497,'RÃƒÂ­o Bravo',999),(4498,'Veracruz',1000),(4499,'Xalapa',1000),(4500,'Coatzacoalcos',1000),(4502,'Papantla',1000),(4503,'MinatitlÃƒÂ¡n',1000),(4504,'Poza Rica de Hidalgo',1000),(4505,'San AndrÃƒÂ©s Tuxtla',1000),(4506,'TÃƒÂºxpam',1000),(4507,'MartÃƒÂ­nez de la Torre',1000),(4508,'Orizaba',1000),(4509,'Temapache',1000),(4510,'Cosoleacaque',1000),(4511,'Tantoyuca',1000),(4512,'PÃƒÂ¡nuco',1000),(4513,'Tierra Blanca',1000),(4514,'Boca del RÃƒÂ­o',1001),(4516,'Fresnillo',1003),(4517,'Zacatecas',1003),(4518,'Guadalupe',1003),(4519,'Dalap-Uliga-Darrit',1004),(4520,'Skopje',1005),(4521,'Bamako',1006),(4522,'Valletta',1007),(4523,'Birkirkara',1008),(4524,'Bassein (Pathein)',1009),(4525,'Henzada (Hinthada)',1009),(4526,'Pagakku (Pakokku)',1010),(4527,'Mandalay',1011),(4528,'Meikhtila',1011),(4529,'Myingyan',1011),(4530,'Moulmein (Mawlamyine)',1012),(4531,'Pegu (Bago)',1013),(4532,'Prome (Pyay)',1013),(4533,'Sittwe (Akyab)',1014),(4534,'Rangoon (Yangon)',1015),(4535,'Monywa',1016),(4536,'Taunggyi (Taunggye)',1017),(4537,'Lashio (Lasho)',1017),(4538,'Mergui (Myeik)',1018),(4539,'Tavoy (Dawei)',1018),(4540,'Ulan Bator',1019),(4541,'Garapan',1020),(4544,'Maxixe',1022),(4545,'Chimoio',1023),(4546,'Maputo',1024),(4547,'Matola',1024),(4548,'Nampula',1025),(4549,'NaÃƒÂ§ala-Porto',1025),(4550,'Beira',1026),(4551,'Tete',1027),(4552,'Quelimane',1028),(4553,'Mocuba',1028),(4554,'Gurue',1028),(4555,'NouÃƒÂ¢dhibou',1029),(4556,'Nouakchott',1030),(4557,'Plymouth',1031),(4558,'Fort-de-France',1032),(4559,'Beau Bassin-Rose Hill',1033),(4560,'Vacoas-Phoenix',1033),(4561,'Port-Louis',1034),(4562,'Blantyre',1035),(4563,'Lilongwe',1036),(4564,'Johor Baharu',1037),(4565,'Alor Setar',1038),(4566,'Sungai Petani',1038),(4567,'Kota Bharu',1039),(4568,'Seremban',1040),(4569,'Kuantan',1041),(4570,'Ipoh',1042),(4571,'Taiping',1042),(4572,'Pinang',1043),(4573,'Sandakan',1044),(4574,'Kuching',1045),(4575,'Sibu',1045),(4576,'Petaling Jaya',1046),(4577,'Kelang',1046),(4578,'Selayang Baru',1046),(4579,'Shah Alam',1046),(4580,'Kuala Terengganu',1047),(4581,'Kuala Lumpur',1048),(4582,'Mamoutzou',1049),(4583,'Windhoek',1050),(4602,'Maradi',1052),(4603,'Niamey',1053),(4604,'Zinder',1054),(4623,'Onitsha',1056),(4624,'Enugu',1056),(4625,'Awka',1056),(4626,'Kumo',1057),(4627,'Deba Habe',1057),(4628,'Gombe',1057),(4629,'Makurdi',1058),(4630,'Maiduguri',1059),(4631,'Calabar',1060),(4632,'Ugep',1060),(4633,'Benin City',1061),(4634,'Sapele',1061),(4635,'Warri',1061),(4636,'Abuja',1062),(4637,'Aba',1063),(4638,'Zaria',1064),(4639,'Kaduna',1064),(4640,'Kano',1065),(4641,'Katsina',1066),(4642,'Ilorin',1067),(4643,'Offa',1067),(4644,'Lagos',1068),(4645,'Mushin',1068),(4646,'Ikorodu',1068),(4647,'Shomolu',1068),(4648,'Agege',1068),(4649,'Epe',1068),(4650,'Minna',1069),(4651,'Bida',1069),(4652,'Abeokuta',1070),(4653,'Ijebu-Ode',1070),(4654,'Shagamu',1070),(4655,'Ado-Ekiti',1071),(4656,'Ikerre',1071),(4657,'Ilawe-Ekiti',1071),(4658,'Owo',1071),(4659,'Ondo',1071),(4660,'Akure',1071),(4661,'Oka-Akoko',1071),(4662,'Ikare',1071),(4663,'Ise-Ekiti',1071),(4664,'Ibadan',1072),(4665,'Ogbomosho',1072),(4666,'Oshogbo',1072),(4667,'Ilesha',1072),(4668,'Iwo',1072),(4670,'Ife',1072),(4671,'Ila',1072),(4672,'Oyo',1072),(4673,'Iseyin',1072),(4674,'Ilobu',1072),(4675,'Ikirun',1072),(4676,'Shaki',1072),(4677,'Effon-Alaiye',1072),(4678,'Ikire',1072),(4679,'Inisa',1072),(4680,'Igboho',1072),(4681,'Ejigbo',1072),(4682,'Jos',1073),(4683,'Lafia',1073),(4684,'Port Harcourt',1074),(4685,'Sokoto',1075),(4686,'Gusau',1075),(4687,'Chinandega',1076),(4688,'LeÃƒÂ³n',1077),(4689,'Managua',1078),(4690,'Masaya',1079),(4709,'Emmen',1081),(4710,'Almere',1082),(4711,'Apeldoorn',1083),(4712,'Nijmegen',1083),(4713,'Arnhem',1083),(4714,'Ede',1083),(4715,'Groningen',1084),(4716,'Maastricht',1085),(4717,'Heerlen',1085),(4718,'Eindhoven',1086),(4719,'Tilburg',1086),(4720,'Breda',1086),(4721,'Ã?Â´s-Hertogenbosch',1086),(4722,'Amsterdam',1087),(4723,'Haarlem',1087),(4724,'Zaanstad',1087),(4725,'Haarlemmermeer',1087),(4726,'Alkmaar',1087),(4727,'Enschede',1088),(4728,'Zwolle',1088),(4729,'Utrecht',1089),(4730,'Amersfoort',1089),(4731,'Rotterdam',1090),(4732,'Haag',1090),(4733,'Dordrecht',1090),(4734,'Leiden',1090),(4735,'Zoetermeer',1090),(4736,'Delft',1090),(4737,'BÃƒÂ¦rum',1091),(4738,'Bergen',1092),(4739,'Oslo',1093),(4740,'Stavanger',1094),(4741,'Trondheim',1095),(4753,'Machakos',1097),(4754,'Meru',1097),(4755,'Biratnagar',1097),(4782,'Auckland',1100),(4783,'Manukau',1100),(4784,'North Shore',1100),(4785,'Waitakere',1100),(4786,'Christchurch',1101),(4787,'Dunedin',1102),(4790,'Wellington',1104),(4791,'Lower Hutt',1104),(4792,'Suhar',1105),(4793,'al-Sib',1106),(4794,'Bawshar',1106),(4795,'Masqat',1106),(4796,'Salala',1107),(4797,'Quetta',1108),(4798,'Khuzdar',1108),(4799,'Islamabad',1109),(4800,'Peshawar',1110),(4801,'Mardan',1110),(4802,'Mingora',1110),(4803,'Kohat',1110),(4804,'Abottabad',1110),(4805,'Dera Ismail Khan',1110),(4806,'Nowshera',1110),(4807,'Ludhiana',1111),(4808,'Amritsar',1111),(4809,'Jalandhar (Jullundur)',1111),(4810,'Patiala',1111),(4811,'Bhatinda (Bathinda)',1111),(4812,'Pathankot',1111),(4813,'Hoshiarpur',1111),(4814,'Moga',1111),(4815,'Abohar',1111),(4816,'Lahore',1111),(4817,'Faisalabad',1111),(4818,'Rawalpindi',1111),(4819,'Multan',1111),(4820,'Gujranwala',1111),(4821,'Sargodha',1111),(4822,'Sialkot',1111),(4823,'Bahawalpur',1111),(4824,'Jhang',1111),(4825,'Sheikhupura',1111),(4826,'Gujrat',1111),(4827,'Kasur',1111),(4828,'Rahim Yar Khan',1111),(4829,'Sahiwal',1111),(4830,'Okara',1111),(4831,'Wah',1111),(4832,'Dera Ghazi Khan',1111),(4833,'Chiniot',1111),(4834,'Kamoke',1111),(4835,'Mandi Burewala',1111),(4836,'Jhelum',1111),(4837,'Sadiqabad',1111),(4838,'Khanewal',1111),(4839,'Hafizabad',1111),(4840,'Muzaffargarh',1111),(4841,'Khanpur',1111),(4842,'Gojra',1111),(4843,'Bahawalnagar',1111),(4844,'Muridke',1111),(4845,'Pak Pattan',1111),(4846,'Jaranwala',1111),(4847,'Chishtian Mandi',1111),(4848,'Daska',1111),(4849,'Mandi Bahauddin',1111),(4850,'Ahmadpur East',1111),(4851,'Kamalia',1111),(4852,'Vihari',1111),(4853,'Wazirabad',1111),(4854,'Mirpur Khas',1112),(4855,'Nawabshah',1112),(4856,'Jacobabad',1112),(4857,'Shikarpur',1112),(4858,'Tando Adam',1112),(4859,'Khairpur',1112),(4860,'Dadu',1112),(4861,'Karachi',1113),(4862,'Hyderabad',1113),(4863,'Sukkur',1113),(4864,'Larkana',1113),(4865,'Ciudad de PanamÃƒÂ¡',1114),(4866,'San Miguelito',1115),(4885,'Chimbote',1117),(4886,'Arequipa',1118),(4887,'Ayacucho',1119),(4888,'Cajamarca',1120),(4889,'Callao',1121),(4890,'Ventanilla',1121),(4891,'Cusco',1122),(4892,'HuÃƒÂ¡nuco',1123),(4893,'Ica',1124),(4894,'Chincha Alta',1124),(4895,'Huancayo',1125),(4898,'Chiclayo',1127),(4899,'Lima',1128),(4900,'Iquitos',1129),(4901,'Piura',1130),(4902,'Sullana',1130),(4903,'Castilla',1130),(4904,'Juliaca',1131),(4905,'Puno',1131),(4906,'Tacna',1132),(4907,'Pucallpa',1133),(4908,'Sultan Kudarat',1134),(4909,'Legazpi',1135),(4910,'Naga',1135),(4911,'Tabaco',1135),(4912,'Daraga (Locsin)',1135),(4913,'Sorsogon',1135),(4914,'Ligao',1135),(4915,'Tuguegarao',1136),(4916,'Ilagan',1136),(4918,'Cauayan',1136),(4919,'Baguio',1137),(4920,'Butuan',1138),(4921,'Surigao',1138),(4922,'Bislig',1138),(4923,'Bayugan',1138),(4924,'San JosÃƒÂ© del Monte',1139),(4925,'Angeles',1139),(4926,'Tarlac',1139),(4927,'Cabanatuan',1139),(4929,'Olongapo',1139),(4930,'Malolos',1139),(4931,'Mabalacat',1139),(4932,'Meycauayan',1139),(4933,'Santa Maria',1139),(4934,'Lubao',1139),(4936,'Baliuag',1139),(4937,'Concepcion',1139),(4938,'Hagonoy',1139),(4939,'Mexico',1139),(4941,'Arayat',1139),(4942,'Marilao',1139),(4943,'Talavera',1139),(4944,'Guagua',1139),(4945,'Capas',1139),(4946,'Iligan',1140),(4947,'Cotabato',1140),(4948,'Marawi',1140),(4949,'Midsayap',1140),(4950,'Kidapawan',1140),(4951,'Cebu',1141),(4952,'Mandaue',1141),(4953,'Lapu-Lapu',1141),(4954,'Talisay',1141),(4956,'Dumaguete',1141),(4957,'Bayawan (Tulong)',1141),(4958,'Danao',1141),(4959,'Tacloban',1142),(4960,'Ormoc',1142),(4961,'Calbayog',1142),(4962,'Baybay',1142),(4964,'Dagupan',1143),(4965,'Malasiqui',1143),(4966,'Urdaneta',1143),(4967,'San Fernando',1143),(4968,'Bayambang',1143),(4969,'Laoag',1143),(4970,'Quezon',1144),(4971,'Manila',1144),(4972,'Kalookan',1144),(4973,'Pasig',1144),(4974,'Valenzuela',1144),(4975,'Las PiÃƒÂ±as',1144),(4976,'Taguig',1144),(4977,'ParaÃƒÂ±aque',1144),(4978,'Makati',1144),(4979,'Marikina',1144),(4980,'Muntinlupa',1144),(4981,'Pasay',1144),(4982,'Malabon',1144),(4983,'Mandaluyong',1144),(4984,'Navotas',1144),(4985,'San Juan del Monte',1144),(4986,'Cagayan de Oro',1145),(4988,'Malaybalay',1145),(4989,'Ozamis',1145),(4990,'Gingoog',1145),(4991,'Davao',1146),(4992,'General Santos',1146),(4993,'Tagum',1146),(4994,'Panabo',1146),(4995,'Koronadal',1146),(4996,'Digos',1146),(4997,'Polomolok',1146),(4998,'Mati',1146),(4999,'Malita',1146),(5000,'Malungon',1146),(5001,'Antipolo',1147),(5002,'DasmariÃƒÂ±as',1147),(5003,'Bacoor',1147),(5004,'Calamba',1147),(5005,'Batangas',1147),(5006,'Cainta',1147),(5007,'San Pedro',1147),(5008,'Lipa',1147),(5009,'San Pablo',1147),(5010,'BiÃƒÂ±an',1147),(5011,'Taytay',1147),(5012,'Lucena',1147),(5013,'Imus',1147),(5014,'Binangonan',1147),(5016,'Puerto Princesa',1147),(5017,'Silang',1147),(5019,'Tanauan',1147),(5020,'Rodriguez (Montalban)',1147),(5021,'Sariaya',1147),(5022,'General Mariano Alvarez',1147),(5024,'Tanza',1147),(5025,'General Trias',1147),(5026,'Cabuyao',1147),(5027,'Calapan',1147),(5028,'Cavite',1147),(5029,'Nasugbu',1147),(5030,'Santa Cruz',1147),(5031,'Candelaria',1147),(5032,'Zamboanga',1148),(5033,'Pagadian',1148),(5034,'Dipolog',1148),(5035,'Bacolod',1149),(5036,'Iloilo',1149),(5037,'Kabankalan',1149),(5038,'Cadiz',1149),(5039,'Bago',1149),(5040,'Sagay',1149),(5041,'Roxas',1149),(5042,'San Carlos',1149),(5043,'Silay',1149),(5044,'Koror',1150),(5045,'Port Moresby',1151),(5046,'Wroclaw',1152),(5047,'Walbrzych',1152),(5048,'Legnica',1152),(5049,'Jelenia GÃƒÂ³ra',1152),(5050,'Bydgoszcz',1153),(5051,'Torun',1153),(5052,'Wloclawek',1153),(5053,'Grudziadz',1153),(5054,'LÃƒÂ³dz',1154),(5055,'Lublin',1155),(5056,'GorzÃƒÂ³w Wielkopolski',1156),(5057,'Zielona GÃƒÂ³ra',1156),(5058,'KrakÃƒÂ³w',1157),(5059,'TarnÃƒÂ³w',1157),(5060,'Warszawa',1158),(5061,'Radom',1158),(5062,'Plock',1158),(5063,'Opole',1159),(5064,'RzeszÃƒÂ³w',1160),(5065,'Bialystok',1161),(5066,'Gdansk',1162),(5067,'Gdynia',1162),(5068,'Slupsk',1162),(5069,'Katowice',1163),(5070,'Czestochowa',1163),(5071,'Sosnowiec',1163),(5072,'Gliwice',1163),(5073,'Bytom',1163),(5074,'Zabrze',1163),(5075,'Bielsko-Biala',1163),(5076,'Ruda Slaska',1163),(5077,'Rybnik',1163),(5078,'Tychy',1163),(5079,'Dabrowa GÃƒÂ³rnicza',1163),(5080,'ChorzÃƒÂ³w',1163),(5081,'Jastrzebie-ZdrÃƒÂ³j',1163),(5082,'Jaworzno',1163),(5083,'Kielce',1164),(5084,'Olsztyn',1165),(5085,'Elblag',1165),(5086,'Poznan',1166),(5087,'Kalisz',1166),(5088,'Szczecin',1167),(5089,'Koszalin',1167),(5090,'Arecibo',1168),(5091,'BayamÃƒÂ³n',1169),(5092,'Caguas',1170),(5093,'Carolina',1171),(5094,'Guaynabo',1172),(5095,'MayagÃƒÂ¼ez',1173),(5096,'Ponce',1174),(5099,'Toa Baja',1176),(5100,'Kanggye',1177),(5101,'Hamhung',1178),(5102,'Chongjin',1179),(5103,'Kimchaek',1179),(5104,'Haeju',1180),(5105,'Sariwon',1181),(5106,'Kaesong',1182),(5107,'Wonsan',1183),(5108,'Nampo',1184),(5109,'Phyongsong',1185),(5110,'Sinuiju',1186),(5111,'Pyongyang',1187),(5112,'Hyesan',1188),(5113,'Braga',1189),(5114,'CoÃƒÂ­mbra',1190),(5118,'Porto',1192),(5119,'Ciudad del Este',1193),(5120,'AsunciÃƒÂ³n',1194),(5132,'Xai-Xai',1196),(5134,'Hebron',1197),(5135,'Khan Yunis',1198),(5136,'Nablus',1199),(5137,'Jabaliya',1200),(5138,'Rafah',1201),(5139,'Faaa',1202),(5140,'Papeete',1202),(5141,'Doha',1203),(5142,'Saint-Denis',1204),(5143,'Arad',1205),(5144,'Pitesti',1206),(5145,'Bacau',1207),(5146,'Oradea',1208),(5147,'Botosani',1209),(5148,'Braila',1210),(5149,'Brasov',1211),(5150,'Bucuresti',1212),(5151,'Buzau',1213),(5152,'Resita',1214),(5153,'Cluj-Napoca',1215),(5154,'Constanta',1216),(5155,'TÃƒÂ¢rgoviste',1217),(5156,'Craiova',1218),(5157,'Galati',1219),(5158,'TÃƒÂ¢rgu Jiu',1220),(5159,'Iasi',1221),(5160,'Baia Mare',1222),(5161,'Drobeta-Turnu Severin',1223),(5162,'TÃƒÂ¢rgu Mures',1224),(5163,'Piatra Neamt',1225),(5164,'Ploiesti',1226),(5165,'Satu Mare',1227),(5166,'Sibiu',1228),(5167,'Suceava',1229),(5168,'Timisoara',1230),(5169,'Tulcea',1231),(5170,'RÃƒÂ¢mnicu VÃƒÂ¢lcea',1232),(5171,'Focsani',1233),(5172,'Maikop',1234),(5173,'Barnaul',1235),(5174,'Bijsk',1235),(5175,'Rubtsovsk',1235),(5176,'BlagoveÃ?Â¡tÃ?Â¡ensk',1236),(5177,'Arkangeli',1237),(5178,'Severodvinsk',1237),(5179,'Astrahan',1238),(5180,'Ufa',1239),(5181,'Sterlitamak',1239),(5182,'Salavat',1239),(5183,'Neftekamsk',1239),(5184,'Oktjabrski',1239),(5185,'Belgorod',1240),(5186,'Staryi Oskol',1240),(5187,'Brjansk',1241),(5188,'Ulan-Ude',1242),(5189,'MahatÃ?Â¡kala',1243),(5190,'Derbent',1243),(5191,'Habarovsk',1244),(5192,'Komsomolsk-na-Amure',1244),(5193,'Abakan',1245),(5194,'Surgut',1246),(5195,'Niznevartovsk',1246),(5196,'Neftejugansk',1246),(5197,'Irkutsk',1247),(5198,'Bratsk',1247),(5199,'Angarsk',1247),(5200,'Ust-Ilimsk',1247),(5201,'Usolje-Sibirskoje',1247),(5202,'Ivanovo',1248),(5203,'KineÃ?Â¡ma',1248),(5204,'Jaroslavl',1249),(5205,'Rybinsk',1249),(5206,'NaltÃ?Â¡ik',1250),(5207,'Kaliningrad',1251),(5208,'Elista',1252),(5209,'Kaluga',1253),(5210,'Obninsk',1253),(5211,'Petropavlovsk-KamtÃ?Â¡atski',1254),(5212,'TÃ?Â¡erkessk',1255),(5213,'Petroskoi',1256),(5214,'Novokuznetsk',1257),(5215,'Kemerovo',1257),(5216,'Prokopjevsk',1257),(5217,'Leninsk-Kuznetski',1257),(5218,'Kiseljovsk',1257),(5219,'MezduretÃ?Â¡ensk',1257),(5220,'Anzero-Sudzensk',1257),(5221,'Kirov',1258),(5222,'Kirovo-TÃ?Â¡epetsk',1258),(5223,'Syktyvkar',1259),(5224,'Uhta',1259),(5225,'Vorkuta',1259),(5226,'Kostroma',1260),(5227,'Krasnodar',1261),(5228,'SotÃ?Â¡i',1261),(5229,'Novorossijsk',1261),(5230,'Armavir',1261),(5231,'Krasnojarsk',1262),(5232,'Norilsk',1262),(5233,'AtÃ?Â¡insk',1262),(5234,'Kansk',1262),(5236,'Kurgan',1263),(5237,'Kursk',1264),(5239,'Lipetsk',1265),(5240,'Jelets',1265),(5241,'Magadan',1266),(5242,'JoÃ?Â¡kar-Ola',1267),(5243,'Saransk',1268),(5244,'Moscow',1269),(5245,'Zelenograd',1269),(5246,'Podolsk',1270),(5247,'Ljubertsy',1270),(5248,'MytiÃ?Â¡tÃ?Â¡i',1270),(5249,'Kolomna',1270),(5250,'Elektrostal',1270),(5251,'Himki',1270),(5252,'BalaÃ?Â¡iha',1270),(5253,'Korolev',1270),(5254,'Serpuhov',1270),(5255,'Odintsovo',1270),(5256,'Orehovo-Zujevo',1270),(5257,'Noginsk',1270),(5258,'Sergijev Posad',1270),(5259,'Ã?Â tÃ?Â¡olkovo',1270),(5260,'Zeleznodoroznyi',1270),(5261,'Zukovski',1270),(5262,'Krasnogorsk',1270),(5263,'Klin',1270),(5264,'Murmansk',1271),(5265,'Nizni Novgorod',1272),(5266,'Dzerzinsk',1272),(5267,'Arzamas',1272),(5268,'Vladikavkaz',1273),(5269,'Veliki Novgorod',1274),(5270,'Novosibirsk',1275),(5271,'Omsk',1276),(5272,'Orenburg',1277),(5273,'Orsk',1277),(5274,'Novotroitsk',1277),(5275,'Orjol',1278),(5276,'Penza',1279),(5277,'Kuznetsk',1279),(5278,'Perm',1280),(5279,'Berezniki',1280),(5280,'Solikamsk',1280),(5281,'TÃ?Â¡aikovski',1280),(5282,'St Petersburg',1281),(5283,'Kolpino',1281),(5284,'PuÃ?Â¡kin',1281),(5285,'Pihkova',1282),(5286,'Velikije Luki',1282),(5287,'Vladivostok',1283),(5288,'Nahodka',1283),(5289,'Ussurijsk',1283),(5290,'Rjazan',1284),(5291,'Rostov-na-Donu',1285),(5292,'Taganrog',1285),(5293,'Ã?Â ahty',1285),(5294,'NovotÃ?Â¡erkassk',1285),(5295,'Volgodonsk',1285),(5296,'NovoÃ?Â¡ahtinsk',1285),(5297,'Bataisk',1285),(5298,'Jakutsk',1286),(5299,'Juzno-Sahalinsk',1287),(5300,'Samara',1288),(5301,'Toljatti',1288),(5302,'Syzran',1288),(5303,'NovokuibyÃ?Â¡evsk',1288),(5304,'Saratov',1289),(5305,'Balakovo',1289),(5306,'Engels',1289),(5307,'BalaÃ?Â¡ov',1289),(5308,'Smolensk',1290),(5309,'Stavropol',1291),(5310,'Nevinnomyssk',1291),(5311,'Pjatigorsk',1291),(5312,'Kislovodsk',1291),(5313,'Jessentuki',1291),(5314,'Jekaterinburg',1292),(5315,'Nizni Tagil',1292),(5316,'Kamensk-Uralski',1292),(5317,'Pervouralsk',1292),(5318,'Serov',1292),(5319,'Novouralsk',1292),(5320,'Tambov',1293),(5321,'MitÃ?Â¡urinsk',1293),(5322,'Kazan',1294),(5323,'Nabereznyje TÃ?Â¡elny',1294),(5324,'Niznekamsk',1294),(5325,'Almetjevsk',1294),(5326,'Zelenodolsk',1294),(5327,'Bugulma',1294),(5328,'Tjumen',1295),(5329,'Tobolsk',1295),(5330,'Tomsk',1296),(5331,'Seversk',1296),(5332,'Tula',1297),(5333,'Novomoskovsk',1297),(5334,'Tver',1298),(5335,'Kyzyl',1299),(5336,'TÃ?Â¡eljabinsk',1300),(5337,'Magnitogorsk',1300),(5338,'Zlatoust',1300),(5339,'Miass',1300),(5340,'Grozny',1301),(5341,'TÃ?Â¡ita',1302),(5342,'TÃ?Â¡eboksary',1303),(5343,'NovotÃ?Â¡eboksarsk',1303),(5344,'Izevsk',1304),(5345,'Glazov',1304),(5346,'Sarapul',1304),(5347,'Votkinsk',1304),(5348,'Uljanovsk',1305),(5349,'Dimitrovgrad',1305),(5350,'Vladimir',1306),(5351,'Kovrov',1306),(5352,'Murom',1306),(5353,'Volgograd',1307),(5354,'Volzski',1307),(5355,'KamyÃ?Â¡in',1307),(5356,'TÃ?Â¡erepovets',1308),(5357,'Vologda',1308),(5358,'Voronez',1309),(5359,'Nojabrsk',1310),(5360,'Novyi Urengoi',1310),(5361,'Kigali',1311),(5362,'AraÃ?Â´ar',1312),(5363,'Burayda',1313),(5364,'Zagazig',1314),(5365,'Bilbays',1314),(5366,'al-Dammam',1314),(5367,'al-Hufuf',1314),(5368,'al-Mubarraz',1314),(5369,'al-Khubar',1314),(5370,'Jubayl',1314),(5371,'Hafar al-Batin',1314),(5372,'al-Tuqba',1314),(5373,'al-Qatif',1314),(5374,'Khamis Mushayt',1315),(5375,'Abha',1315),(5376,'Hail',1316),(5377,'Medina',1317),(5378,'Yanbu',1317),(5379,'Jedda',1318),(5380,'Mekka',1318),(5381,'al-Taif',1318),(5382,'al-Hawiya',1318),(5383,'Najran',1319),(5384,'Unayza',1320),(5385,'al-Kharj',1321),(5386,'Riyadh',1322),(5387,'Tabuk',1323),(5388,'Kusti',1324),(5389,'Port Sudan',1325),(5390,'Wad Madani',1326),(5391,'al-Qadarif',1327),(5392,'Juba',1328),(5393,'Nyala',1329),(5394,'al-Fashir',1330),(5395,'Kassala',1331),(5396,'Omdurman',1332),(5397,'Khartum',1332),(5398,'Sharq al-Nil',1332),(5399,'Obeid',1333),(5400,'Pikine',1334),(5401,'Dakar',1334),(5402,'Rufisque',1334),(5403,'Diourbel',1335),(5404,'Kaolack',1336),(5405,'Saint-Louis',1337),(5406,'ThiÃƒÂ¨s',1338),(5407,'Mbour',1338),(5408,'Ziguinchor',1339),(5427,'Jamestown',1341),(5428,'Longyearbyen',1342),(5429,'Honiara',1343),(5430,'Sekondi-Takoradi',1344),(5431,'Pokhara',1344),(5432,'Freetown',1344),(5433,'Colombo',1344),(5434,'Dehiwala',1344),(5435,'Moratuwa',1344),(5436,'Sri Jayawardenepura Kotte',1344),(5437,'Negombo',1344),(5438,'Nueva San Salvador',1345),(5439,'Trujillo',1345),(5440,'San Miguel',1346),(5441,'San Salvador',1347),(5442,'Mejicanos',1347),(5443,'Soyapango',1347),(5444,'Apopa',1347),(5446,'San Marino',1349),(5447,'Serravalle',1350),(5448,'Mogadishu',1351),(5449,'Kismaayo',1352),(5450,'Hargeysa',1353),(5451,'Saint-Pierre',1354),(5452,'SÃƒÂ£o TomÃƒÂ©',1355),(5453,'Paramaribo',1356),(5454,'Bratislava',1357),(5455,'KoÃ?Â¡ice',1358),(5456,'PreÃ?Â¡ov',1358),(5457,'Ljubljana',1359),(5458,'Maribor',1360),(5459,'Ãƒâ??rebro',1361),(5460,'LinkÃƒÂ¶ping',1362),(5461,'NorrkÃƒÂ¶ping',1362),(5462,'GÃƒÂ¤vle',1363),(5463,'JÃƒÂ¶nkÃƒÂ¶ping',1364),(5465,'Amadora',1365),(5466,'Stockholm',1365),(5467,'MalmÃƒÂ¶',1366),(5468,'Helsingborg',1366),(5469,'Lund',1366),(5470,'Uppsala',1367),(5471,'UmeÃƒÂ¥',1368),(5472,'Sundsvall',1369),(5473,'VÃƒÂ¤sterÃƒÂ¥s',1370),(5474,'Gothenburg [GÃƒÂ¶teborg]',1371),(5475,'BorÃƒÂ¥s',1371),(5476,'Mbabane',1372),(5477,'Victoria',1373),(5478,'al-Qamishliya',1374),(5479,'al-Raqqa',1375),(5480,'Aleppo',1376),(5481,'Damascus',1377),(5482,'Jaramana',1378),(5483,'Duma',1378),(5484,'Dayr al-Zawr',1379),(5485,'Hama',1380),(5486,'Hims',1381),(5487,'Idlib',1382),(5488,'Latakia',1383),(5489,'Cockburn Town',1384),(5490,'NÃ?Â´DjamÃƒÂ©na',1385),(5491,'Moundou',1386),(5492,'LomÃƒÂ©',1387),(5493,'Bangkok',1388),(5494,'Chiang Mai',1389),(5495,'Khon Kaen',1390),(5496,'Nakhon Pathom',1391),(5497,'Nakhon Ratchasima',1392),(5498,'Nakhon Sawan',1393),(5499,'Nonthaburi',1394),(5500,'Pak Kret',1394),(5501,'Hat Yai',1395),(5502,'Songkhla',1395),(5503,'Ubon Ratchathani',1396),(5504,'Udon Thani',1397),(5505,'Dushanbe',1398),(5506,'Khujand',1399),(5507,'Fakaofo',1400),(5508,'Ashgabat',1401),(5509,'Dashhowuz',1402),(5510,'ChÃƒÂ¤rjew',1403),(5511,'Mary',1404),(5512,'Dili',1405),(5513,'NukuÃ?Â´alofa',1406),(5514,'Chaguanas',1407),(5515,'Port-of-Spain',1408),(5516,'Ariana',1409),(5517,'Ettadhamen',1409),(5518,'Biserta',1410),(5519,'GabÃƒÂ¨s',1411),(5520,'Kairouan',1412),(5521,'Sfax',1413),(5522,'Sousse',1414),(5523,'Tunis',1415),(5524,'Adana',1416),(5525,'Tarsus',1416),(5526,'Ceyhan',1416),(5527,'Adiyaman',1417),(5528,'Afyon',1418),(5529,'Aksaray',1419),(5530,'Ankara',1420),(5531,'Antalya',1421),(5532,'Alanya',1421),(5533,'Aydin',1422),(5534,'Nazilli',1422),(5535,'Ãƒâ?¡orum',1423),(5536,'Balikesir',1424),(5537,'Bandirma',1424),(5538,'Batman',1425),(5539,'Bursa',1426),(5540,'InegÃƒÂ¶l',1426),(5541,'Denizli',1427),(5542,'Diyarbakir',1428),(5543,'Bismil',1428),(5544,'Edirne',1429),(5545,'ElÃƒÂ¢zig',1430),(5546,'Erzincan',1431),(5547,'Erzurum',1432),(5548,'Eskisehir',1433),(5549,'Gaziantep',1434),(5550,'Iskenderun',1435),(5551,'Hatay (Antakya)',1435),(5552,'Mersin (IÃƒÂ§el)',1436),(5553,'Isparta',1437),(5554,'Istanbul',1438),(5555,'Sultanbeyli',1438),(5556,'Izmir',1439),(5557,'Kahramanmaras',1440),(5558,'KarabÃƒÂ¼k',1441),(5559,'Karaman',1442),(5560,'Kars',1443),(5561,'Kayseri',1444),(5562,'KÃƒÂ¼tahya',1445),(5563,'Kilis',1446),(5564,'Kirikkale',1447),(5565,'Gebze',1448),(5566,'Izmit (Kocaeli)',1448),(5567,'Konya',1449),(5568,'Malatya',1450),(5569,'Manisa',1451),(5570,'Kiziltepe',1452),(5571,'Ordu',1453),(5572,'Osmaniye',1454),(5573,'Sakarya (Adapazari)',1455),(5574,'Samsun',1456),(5575,'Sanliurfa',1457),(5576,'Viransehir',1457),(5577,'Siirt',1458),(5578,'Sivas',1459),(5579,'Ãƒâ?¡orlu',1460),(5580,'Tekirdag',1460),(5581,'Tokat',1461),(5582,'Trabzon',1462),(5583,'Usak',1463),(5584,'Van',1464),(5585,'Zonguldak',1465),(5586,'Funafuti',1466),(5591,'Changhwa',1468),(5592,'Yuanlin',1468),(5593,'Chiayi',1469),(5594,'Hsinchu',1470),(5595,'Hualien',1471),(5596,'Ilan',1472),(5597,'Kaohsiung',1473),(5598,'Fengshan',1473),(5599,'Kangshan',1473),(5600,'Keelung (Chilung)',1474),(5601,'Miaoli',1475),(5602,'Nantou',1476),(5603,'Tsaotun',1476),(5604,'Pingtung',1477),(5605,'Taichung',1478),(5606,'Tali',1478),(5607,'Fengyuan',1478),(5608,'Tainan',1479),(5609,'Yungkang',1479),(5610,'Taipei',1480),(5611,'Panchiao',1480),(5612,'Chungho',1480),(5613,'Sanchung',1480),(5614,'Hsinchuang',1480),(5615,'Hsintien',1480),(5616,'Yungho',1480),(5617,'Tucheng',1480),(5618,'Luchou',1480),(5619,'Hsichuh',1480),(5620,'Shulin',1480),(5621,'Tanshui',1480),(5622,'Lungtan',1480),(5623,'Taitung',1481),(5624,'Chungli',1482),(5625,'Taoyuan',1482),(5626,'Pingchen',1482),(5627,'Pate',1482),(5628,'Yangmei',1482),(5629,'Touliu',1483),(5630,'Arusha',1484),(5631,'Dar es Salaam',1485),(5632,'Dodoma',1486),(5633,'Moshi',1487),(5634,'Mbeya',1488),(5635,'Morogoro',1489),(5636,'Mwanza',1490),(5637,'Tabora',1491),(5638,'Tanga',1492),(5639,'Zanzibar',1493),(5651,'Dnipropetrovsk',1495),(5652,'Kryvyi Rig',1495),(5653,'Dniprodzerzynsk',1495),(5654,'Nikopol',1495),(5655,'Pavlograd',1495),(5656,'Donetsk',1496),(5657,'Mariupol',1496),(5658,'Makijivka',1496),(5659,'Gorlivka',1496),(5660,'Kramatorsk',1496),(5661,'Slovjansk',1496),(5662,'Jenakijeve',1496),(5663,'Kostjantynivka',1496),(5664,'Harkova [Harkiv]',1497),(5665,'Herson',1498),(5666,'Hmelnytskyi',1499),(5667,'Kamjanets-Podilskyi',1499),(5668,'Ivano-Frankivsk',1500),(5669,'Kyiv',1501),(5670,'Bila Tserkva',1501),(5671,'Brovary',1501),(5672,'Kirovograd',1502),(5673,'Oleksandrija',1502),(5674,'Sevastopol',1503),(5675,'Simferopol',1503),(5676,'KertÃ?Â¡',1503),(5677,'Jevpatorija',1503),(5678,'Lugansk',1504),(5679,'Sjeverodonetsk',1504),(5680,'AltÃ?Â¡evsk',1504),(5681,'LysytÃ?Â¡ansk',1504),(5682,'Krasnyi LutÃ?Â¡',1504),(5683,'Stahanov',1504),(5684,'Lviv',1505),(5685,'Mykolajiv',1506),(5686,'Odesa',1507),(5687,'Izmajil',1507),(5688,'Pultava [Poltava]',1508),(5689,'KrementÃ?Â¡uk',1508),(5690,'Rivne',1509),(5691,'Sumy',1510),(5692,'Konotop',1510),(5693,'Ã?Â ostka',1510),(5694,'Uzgorod',1511),(5695,'MukatÃ?Â¡eve',1511),(5696,'Ternopil',1512),(5697,'TÃ?Â¡erkasy',1513),(5698,'Uman',1513),(5699,'TÃ?Â¡ernigiv',1514),(5700,'TÃ?Â¡ernivtsi',1515),(5701,'Vinnytsja',1516),(5702,'Lutsk',1517),(5703,'Zaporizzja',1518),(5704,'Melitopol',1518),(5705,'Berdjansk',1518),(5706,'Zytomyr',1519),(5707,'BerdytÃ?Â¡iv',1519),(5708,'Montevideo',1520),(5709,'Birmingham',1521),(5710,'Montgomery',1521),(5711,'Mobile',1521),(5712,'Huntsville',1521),(5713,'Anchorage',1522),(5714,'Phoenix',1523),(5715,'Tucson',1523),(5716,'Mesa',1523),(5717,'Glendale',1523),(5718,'Scottsdale',1523),(5719,'Chandler',1523),(5720,'Tempe',1523),(5721,'Gilbert',1523),(5723,'Little Rock',1524),(5724,'Los Angeles',1525),(5725,'San Diego',1525),(5726,'San Jose',1525),(5727,'San Francisco',1525),(5728,'Long Beach',1525),(5729,'Fresno',1525),(5730,'Sacramento',1525),(5731,'Oakland',1525),(5732,'Santa Ana',1525),(5733,'Anaheim',1525),(5734,'Riverside',1525),(5735,'Bakersfield',1525),(5736,'Stockton',1525),(5737,'Fremont',1525),(5739,'Huntington Beach',1525),(5740,'Modesto',1525),(5741,'San Bernardino',1525),(5742,'Chula Vista',1525),(5743,'Oxnard',1525),(5744,'Garden Grove',1525),(5745,'Oceanside',1525),(5746,'Ontario',1525),(5747,'Santa Clarita',1525),(5748,'Salinas',1525),(5749,'Pomona',1525),(5750,'Santa Rosa',1525),(5751,'Irvine',1525),(5752,'Moreno Valley',1525),(5753,'Pasadena',1525),(5754,'Hayward',1525),(5755,'Torrance',1525),(5756,'Escondido',1525),(5757,'Sunnyvale',1525),(5758,'Fontana',1525),(5759,'Orange',1525),(5760,'Rancho Cucamonga',1525),(5761,'East Los Angeles',1525),(5762,'Fullerton',1525),(5763,'Corona',1525),(5764,'Concord',1525),(5765,'Lancaster',1525),(5766,'Thousand Oaks',1525),(5767,'Vallejo',1525),(5768,'Palmdale',1525),(5769,'El Monte',1525),(5770,'Inglewood',1525),(5771,'Simi Valley',1525),(5772,'Costa Mesa',1525),(5773,'Downey',1525),(5774,'West Covina',1525),(5775,'Daly City',1525),(5776,'Citrus Heights',1525),(5777,'Norwalk',1525),(5778,'Berkeley',1525),(5779,'Santa Clara',1525),(5780,'San Buenaventura',1525),(5781,'Burbank',1525),(5782,'Mission Viejo',1525),(5783,'El Cajon',1525),(5785,'Compton',1525),(5786,'Fairfield',1525),(5787,'Arden-Arcade',1525),(5788,'San Mateo',1525),(5789,'Visalia',1525),(5790,'Santa Monica',1525),(5791,'Carson',1525),(5792,'Denver',1526),(5793,'Colorado Springs',1526),(5795,'Lakewood',1526),(5796,'Fort Collins',1526),(5797,'Arvada',1526),(5798,'Pueblo',1526),(5799,'Westminster',1526),(5800,'Boulder',1526),(5801,'Bridgeport',1527),(5802,'New Haven',1527),(5803,'Hartford',1527),(5804,'Stamford',1527),(5805,'Waterbury',1527),(5806,'Washington',1528),(5807,'Jacksonville',1529),(5808,'Miami',1529),(5809,'Tampa',1529),(5810,'Saint Petersburg',1529),(5811,'Hialeah',1529),(5812,'Orlando',1529),(5813,'Fort Lauderdale',1529),(5814,'Tallahassee',1529),(5815,'Hollywood',1529),(5816,'Pembroke Pines',1529),(5817,'Coral Springs',1529),(5818,'Cape Coral',1529),(5819,'Clearwater',1529),(5820,'Miami Beach',1529),(5821,'Gainesville',1529),(5822,'Atlanta',1530),(5823,'Augusta-Richmond County',1530),(5825,'Savannah',1530),(5826,'Macon',1530),(5827,'Athens-Clarke County',1530),(5828,'Honolulu',1531),(5829,'Boise City',1532),(5830,'Chicago',1533),(5831,'Rockford',1533),(5832,'Aurora',1533),(5833,'Naperville',1533),(5834,'Peoria',1533),(5836,'Joliet',1533),(5837,'Elgin',1533),(5838,'Indianapolis',1534),(5839,'Fort Wayne',1534),(5840,'Evansville',1534),(5841,'South Bend',1534),(5842,'Gary',1534),(5843,'Des Moines',1535),(5844,'Cedar Rapids',1535),(5845,'Davenport',1535),(5846,'Wichita',1536),(5847,'Overland Park',1536),(5848,'Kansas City',1536),(5849,'Topeka',1536),(5850,'Lexington-Fayette',1537),(5851,'Louisville',1537),(5852,'New Orleans',1538),(5853,'Baton Rouge',1538),(5854,'Shreveport',1538),(5855,'Metairie',1538),(5856,'Lafayette',1538),(5857,'Baltimore',1539),(5858,'Boston',1540),(5861,'Lowell',1540),(5862,'Cambridge',1540),(5863,'New Bedford',1540),(5864,'Brockton',1540),(5865,'Fall River',1540),(5866,'Detroit',1541),(5867,'Grand Rapids',1541),(5868,'Warren',1541),(5869,'Flint',1541),(5870,'Sterling Heights',1541),(5871,'Lansing',1541),(5872,'Ann Arbor',1541),(5873,'Livonia',1541),(5874,'Minneapolis',1542),(5875,'Saint Paul',1542),(5876,'Jackson',1543),(5878,'Saint Louis',1544),(5879,'Springfield',1544),(5880,'Independence',1544),(5881,'Billings',1545),(5882,'Omaha',1546),(5883,'Lincoln',1546),(5884,'Las Vegas',1547),(5885,'Reno',1547),(5886,'Henderson',1547),(5887,'Paradise',1547),(5888,'North Las Vegas',1547),(5889,'Sunrise Manor',1547),(5890,'Manchester',1548),(5891,'Newark',1549),(5892,'Jersey City',1549),(5893,'Paterson',1549),(5894,'Elizabeth',1549),(5895,'Albuquerque',1550),(5896,'New York',1551),(5897,'Buffalo',1551),(5898,'Rochester',1551),(5899,'Yonkers',1551),(5900,'Syracuse',1551),(5901,'Albany',1551),(5902,'Charlotte',1552),(5903,'Raleigh',1552),(5904,'Greensboro',1552),(5905,'Durham',1552),(5906,'Winston-Salem',1552),(5907,'Fayetteville',1552),(5908,'Cary',1552),(5909,'Columbus',1553),(5910,'Cleveland',1553),(5911,'Cincinnati',1553),(5912,'Toledo',1553),(5913,'Akron',1553),(5914,'Dayton',1553),(5915,'Oklahoma City',1554),(5916,'Tulsa',1554),(5917,'Norman',1554),(5918,'Portland',1555),(5919,'Eugene',1555),(5921,'Philadelphia',1556),(5922,'Pittsburgh',1556),(5923,'Allentown',1556),(5924,'Erie',1556),(5925,'Providence',1557),(5926,'Columbia',1558),(5927,'Charleston',1558),(5928,'Sioux Falls',1559),(5929,'Memphis',1560),(5930,'Nashville-Davidson',1560),(5931,'Knoxville',1560),(5932,'Chattanooga',1560),(5933,'Clarksville',1560),(5934,'Houston',1561),(5935,'Dallas',1561),(5936,'San Antonio',1561),(5937,'Austin',1561),(5938,'El Paso',1561),(5939,'Fort Worth',1561),(5941,'Corpus Christi',1561),(5942,'Plano',1561),(5943,'Garland',1561),(5944,'Lubbock',1561),(5945,'Irving',1561),(5946,'Laredo',1561),(5947,'Amarillo',1561),(5948,'Brownsville',1561),(5950,'Grand Prairie',1561),(5951,'Mesquite',1561),(5952,'Abilene',1561),(5953,'Beaumont',1561),(5954,'Waco',1561),(5955,'Carrollton',1561),(5956,'McAllen',1561),(5957,'Wichita Falls',1561),(5958,'Midland',1561),(5959,'Odessa',1561),(5960,'Salt Lake City',1562),(5961,'West Valley City',1562),(5962,'Provo',1562),(5963,'Sandy',1562),(5964,'Virginia Beach',1563),(5965,'Norfolk',1563),(5966,'Chesapeake',1563),(5967,'Richmond',1563),(5968,'Newport News',1563),(5969,'Arlington',1563),(5970,'Hampton',1563),(5971,'Alexandria',1563),(5972,'Portsmouth',1563),(5973,'Roanoke',1563),(5974,'Seattle',1564),(5975,'Spokane',1564),(5976,'Tacoma',1564),(5978,'Bellevue',1564),(5979,'Milwaukee',1565),(5980,'Madison',1565),(5981,'Green Bay',1565),(5982,'Kenosha',1565),(5983,'Andijon',1566),(5984,'Buhoro',1567),(5985,'Cizah',1568),(5986,'KÃƒÂ¼kon',1569),(5987,'Fargona',1569),(5988,'Margilon',1569),(5989,'Nukus',1570),(5990,'ÃƒÅ?rgenc',1571),(5991,'Namangan',1572),(5992,'Navoi',1573),(5993,'Karsi',1574),(5994,'Samarkand',1575),(5995,'Termiz',1576),(5996,'Circik',1577),(5997,'Angren',1577),(5998,'Olmalik',1577),(5999,'Toskent',1578),(6000,'South Hill',1579),(6001,'The Valley',1579),(6002,'Oranjestad',1579),(6003,'Douglas',1579),(6004,'Gibraltar',1579),(6005,'Tamuning',1579),(6006,'AgaÃƒÂ±a',1579),(6007,'Flying Fish Cove',1579),(6008,'Monte-Carlo',1579),(6009,'Monaco-Ville',1579),(6010,'Yangor',1579),(6011,'Yaren',1579),(6012,'Alofi',1579),(6013,'Kingston',1579),(6014,'Adamstown',1579),(6015,'Singapore',1579),(6016,'NoumÃƒÂ©a',1579),(6017,'CittÃƒÂ  del Vaticano',1579),(6018,'Roseau',1580),(6019,'Saint GeorgeÃ?Â´s',1580),(6020,'Kingstown',1580),(6025,'Barcelona',1582),(6026,'Puerto La Cruz',1582),(6027,'El Tigre',1582),(6028,'Pozuelos',1582),(6029,'San Fernando de Apure',1583),(6030,'Maracay',1584),(6031,'Turmero',1584),(6032,'El LimÃƒÂ³n',1584),(6033,'Barinas',1585),(6037,'Valencia',1587),(6038,'Puerto Cabello',1587),(6039,'Guacara',1587),(6041,'BrasÃƒÂ­lia',1588),(6042,'Ciudad de MÃƒÂ©xico',1588),(6043,'Caracas',1588),(6044,'Catia La Mar',1588),(6045,'Santa Ana de Coro',1589),(6046,'Punto Fijo',1589),(6047,'Calabozo',1590),(6048,'Valle de la Pascua',1590),(6049,'Barquisimeto',1591),(6050,'MÃƒÂ©rida',1592),(6051,'Petare',1593),(6052,'Baruta',1593),(6053,'Los Teques',1593),(6054,'Guarenas',1593),(6055,'Guatire',1593),(6056,'Ocumare del Tuy',1593),(6057,'MaturÃƒÂ­n',1594),(6058,'Acarigua',1595),(6059,'Guanare',1595),(6060,'Araure',1595),(6061,'Sincelejo',1596),(6062,'CumanÃƒÂ¡',1596),(6063,'CarÃƒÂºpano',1596),(6064,'San CristÃƒÂ³bal',1597),(6065,'Valera',1598),(6066,'San Felipe',1599),(6067,'MaracaÃƒÂ­bo',1600),(6068,'Cabimas',1600),(6069,'Ciudad Ojeda',1600),(6070,'Road Town',1601),(6071,'Charlotte Amalie',1602),(6072,'Long Xuyen',1603),(6073,'Vung Tau',1604),(6074,'Thai Nguyen',1605),(6075,'Quy Nhon',1606),(6076,'Phan ThiÃƒÂªt',1607),(6077,'Can Tho',1608),(6078,'Buon Ma Thuot',1609),(6079,'BiÃƒÂªn Hoa',1610),(6080,'Haiphong',1611),(6081,'Hanoi',1612),(6082,'Ho Chi Minh City',1613),(6083,'Nha Trang',1614),(6084,'Cam Ranh',1614),(6085,'Rach Gia',1615),(6086,'Da Lat',1616),(6087,'Nam Dinh',1617),(6088,'Vinh',1618),(6089,'Cam Pha',1619),(6090,'Da Nang',1620),(6091,'Hong Gai',1621),(6092,'Hue',1622),(6093,'My Tho',1623),(6094,'Port-Vila',1624),(6095,'Mata-Utu',1625),(6096,'Apia',1626),(6097,'Aden',1627),(6098,'al-Mukalla',1628),(6099,'Hodeida',1629),(6100,'Ibb',1630),(6101,'Sanaa',1631),(6102,'Taizz',1632),(6103,'Beograd',1633),(6104,'NiÃ?Â¡',1633),(6105,'Kragujevac',1633),(6106,'PriÃ?Â¡tina',1634),(6107,'Prizren',1634),(6108,'Podgorica',1635),(6109,'Novi Sad',1636),(6110,'Subotica',1636),(6111,'Port Elizabeth',1637),(6112,'East London',1637),(6113,'Uitenhage',1637),(6114,'Mdantsane',1637),(6115,'Bloemfontein',1638),(6116,'Welkom',1638),(6117,'Botshabelo',1638),(6118,'Soweto',1639),(6119,'Johannesburg',1639),(6120,'Pretoria',1639),(6121,'Vanderbijlpark',1639),(6122,'Kempton Park',1639),(6123,'Alberton',1639),(6124,'Benoni',1639),(6125,'Randburg',1639),(6126,'Vereeniging',1639),(6127,'Wonderboom',1639),(6128,'Roodepoort',1639),(6129,'Boksburg',1639),(6130,'Soshanguve',1639),(6131,'Krugersdorp',1639),(6132,'Brakpan',1639),(6133,'Oberholzer',1639),(6134,'Germiston',1639),(6135,'Springs',1639),(6136,'Westonaria',1639),(6137,'Randfontein',1639),(6138,'Nigel',1639),(6139,'Inanda',1640),(6140,'Durban',1640),(6141,'Pinetown',1640),(6142,'Pietermaritzburg',1640),(6143,'Umlazi',1640),(6144,'Newcastle',1640),(6145,'Chatsworth',1640),(6146,'Ladysmith',1640),(6147,'Witbank',1641),(6148,'Klerksdorp',1642),(6149,'Potchefstroom',1642),(6150,'Rustenburg',1642),(6151,'Kimberley',1643),(6152,'Cape Town',1644),(6153,'Paarl',1644),(6154,'George',1644),(6155,'Suva',1645),(6156,'Nyeri',1645),(6157,'Kathmandu',1645),(6158,'Lalitapur',1645),(6159,'Birgunj',1645),(6160,'San Lorenzo',1645),(6161,'LambarÃƒÂ©',1645),(6162,'Fernando de la Mora',1645),(6163,'Kabwe',1645),(6164,'Kandy',1645),(6165,'Kampala',1645),(6166,'Ndola',1646),(6167,'Kitwe',1646),(6168,'Chingola',1646),(6169,'Mufulira',1646),(6170,'Luanshya',1646),(6171,'Lusaka',1647),(6172,'Bulawayo',1648),(6173,'Harare',1649),(6174,'Chitungwiza',1649),(6175,'Mount Darwin',1649),(6176,'Mutare',1650),(6177,'Gweru',1651);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(3) unsigned NOT NULL,
  `country_name` varchar(40) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (2,'Afghanistan'),(5,'Albania'),(62,'Algeria'),(11,'American Samoa'),(6,'Andorra'),(3,'Angola'),(4,'Anguilla'),(12,'Antarctica'),(14,'Antigua and Barbuda'),(9,'Argentina'),(10,'Armenia'),(1,'Aruba'),(15,'Australia'),(16,'Austria'),(17,'Azerbaijan'),(25,'Bahamas'),(24,'Bahrain'),(22,'Bangladesh'),(32,'Barbados'),(27,'Belarus'),(19,'Belgium'),(28,'Belize'),(20,'Benin'),(29,'Bermuda'),(34,'Bhutan'),(30,'Bolivia'),(26,'Bosnia and Herzegovina'),(36,'Botswana'),(35,'Bouvet Island'),(31,'Brazil'),(101,'British Indian Ocean Territory'),(33,'Brunei'),(23,'Bulgaria'),(21,'Burkina Faso'),(18,'Burundi'),(114,'Cambodia'),(44,'Cameroon'),(38,'Canada'),(50,'Cape Verde'),(54,'Cayman Islands'),(43,'CÃƒÂ´te dÃ¢â?¬â?¢Ivoire'),(37,'Central African Republic'),(206,'Chad'),(41,'Chile'),(42,'China'),(53,'Christmas Island'),(39,'Cocos (Keeling) Islands'),(48,'Colombia'),(49,'Comoros'),(46,'Congo'),(45,'Congo, The Democratic Republic'),(47,'Cook Islands'),(51,'Costa Rica'),(96,'Croatia'),(52,'Cuba'),(55,'Cyprus'),(56,'Czech Republic'),(60,'Denmark'),(58,'Djibouti'),(59,'Dominica'),(61,'Dominican Republic'),(212,'East Timor'),(63,'Ecuador'),(64,'Egypt'),(193,'El Salvador'),(85,'Equatorial Guinea'),(65,'Eritrea'),(68,'Estonia'),(69,'Ethiopia'),(72,'Falkland Islands'),(74,'Faroe Islands'),(71,'Fiji Islands'),(70,'Finland'),(73,'France'),(90,'French Guiana'),(178,'French Polynesia'),(13,'French Southern territories'),(76,'Gabon'),(83,'Gambia'),(78,'Georgia'),(57,'Germany'),(79,'Ghana'),(80,'Gibraltar'),(86,'Greece'),(88,'Greenland'),(87,'Grenada'),(82,'Guadeloupe'),(91,'Guam'),(89,'Guatemala'),(81,'Guinea'),(84,'Guinea-Bissau'),(92,'Guyana'),(97,'Haiti'),(94,'Heard Island and McDonald Isla'),(226,'Holy See (Vatican City State)'),(95,'Honduras'),(93,'Hong Kong'),(98,'Hungary'),(105,'Iceland'),(100,'India'),(99,'Indonesia'),(103,'Iran'),(104,'Iraq'),(102,'Ireland'),(106,'Israel'),(107,'Italy'),(108,'Jamaica'),(110,'Japan'),(109,'Jordan'),(111,'Kazakstan'),(112,'Kenya'),(115,'Kiribati'),(118,'Kuwait'),(113,'Kyrgyzstan'),(119,'Laos'),(129,'Latvia'),(120,'Lebanon'),(126,'Lesotho'),(121,'Liberia'),(122,'Libyan Arab Jamahiriya'),(124,'Liechtenstein'),(127,'Lithuania'),(128,'Luxembourg'),(130,'Macao'),(138,'Macedonia'),(134,'Madagascar'),(149,'Malawi'),(150,'Malaysia'),(135,'Maldives'),(139,'Mali'),(140,'Malta'),(137,'Marshall Islands'),(147,'Martinique'),(145,'Mauritania'),(148,'Mauritius'),(151,'Mayotte'),(136,'Mexico'),(75,'Micronesia, Federated States o'),(133,'Moldova'),(132,'Monaco'),(142,'Mongolia'),(146,'Montserrat'),(131,'Morocco'),(144,'Mozambique'),(141,'Myanmar'),(152,'Namibia'),(162,'Nauru'),(161,'Nepal'),(159,'Netherlands'),(7,'Netherlands Antilles'),(153,'New Caledonia'),(163,'New Zealand'),(157,'Nicaragua'),(154,'Niger'),(156,'Nigeria'),(158,'Niue'),(0,'none'),(155,'Norfolk Island'),(174,'North Korea'),(143,'Northern Mariana Islands'),(160,'Norway'),(164,'Oman'),(165,'Pakistan'),(170,'Palau'),(177,'Palestine'),(166,'Panama'),(171,'Papua New Guinea'),(176,'Paraguay'),(168,'Peru'),(169,'Philippines'),(167,'Pitcairn'),(172,'Poland'),(175,'Portugal'),(173,'Puerto Rico'),(179,'Qatar'),(180,'RÃƒÂ©union'),(181,'Romania'),(182,'Russian Federation'),(183,'Rwanda'),(189,'Saint Helena'),(116,'Saint Kitts and Nevis'),(123,'Saint Lucia'),(196,'Saint Pierre and Miquelon'),(227,'Saint Vincent and the Grenadin'),(234,'Samoa'),(194,'San Marino'),(197,'Sao Tome and Principe'),(184,'Saudi Arabia'),(186,'Senegal'),(203,'Seychelles'),(192,'Sierra Leone'),(187,'Singapore'),(199,'Slovakia'),(200,'Slovenia'),(191,'Solomon Islands'),(195,'Somalia'),(237,'South Africa'),(188,'South Georgia and the South Sa'),(117,'South Korea'),(67,'Spain'),(125,'Sri Lanka'),(185,'Sudan'),(198,'Suriname'),(190,'Svalbard and Jan Mayen'),(202,'Swaziland'),(201,'Sweden'),(40,'Switzerland'),(204,'Syria'),(218,'Taiwan'),(209,'Tajikistan'),(219,'Tanzania'),(208,'Thailand'),(207,'Togo'),(210,'Tokelau'),(213,'Tonga'),(214,'Trinidad and Tobago'),(215,'Tunisia'),(216,'Turkey'),(211,'Turkmenistan'),(205,'Turks and Caicos Islands'),(217,'Tuvalu'),(220,'Uganda'),(221,'Ukraine'),(8,'United Arab Emirates'),(77,'United Kingdom'),(224,'United States'),(222,'United States Minor Outlying I'),(223,'Uruguay'),(225,'Uzbekistan'),(232,'Vanuatu'),(228,'Venezuela'),(231,'Vietnam'),(229,'Virgin Islands, British'),(230,'Virgin Islands, U.S.'),(233,'Wallis and Futuna'),(66,'Western Sahara'),(235,'Yemen'),(236,'Yugoslavia'),(238,'Zambia'),(239,'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `code` varchar(8) NOT NULL,
  `title` varchar(10) NOT NULL,
  `days` varchar(7) NOT NULL,
  `begin_time` varchar(5) NOT NULL,
  `end_time` varchar(5) NOT NULL,
  `credits` int(2) NOT NULL,
  `professor_last_name` varchar(30) NOT NULL,
  `professor_first_name` varchar(30) NOT NULL,
  `location` varchar(40) NOT NULL,
  `department` varchar(40) NOT NULL,
  `am_pm` varchar(2) NOT NULL,
  PRIMARY KEY (`code`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `professor_last_name` (`professor_last_name`),
  FULLTEXT KEY `professor_first_name` (`professor_first_name`),
  FULLTEXT KEY `location` (`location`),
  FULLTEXT KEY `department` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('ENG101','English I','MWF','9:00','9:50',3,'Smith','Mike','Hardway Hall','English','am'),('MATH101','Math 100','TR','8:00','9:15',3,'Hawkins','Jenny','Colebank Hall','Math','am');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_american_express`
--

DROP TABLE IF EXISTS `credit_card_american_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_american_express` (
  `american_express_number_hash` varchar(140) NOT NULL,
  `american_express_expire` date NOT NULL,
  `american_express_cvv` int(11) NOT NULL,
  `american_express_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `american_express_fullname` varchar(40) NOT NULL,
  PRIMARY KEY (`american_express_number_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_american_express`
--

LOCK TABLES `credit_card_american_express` WRITE;
/*!40000 ALTER TABLE `credit_card_american_express` DISABLE KEYS */;
INSERT INTO `credit_card_american_express` VALUES ('343453656979423','2019-02-00',3754,4045.15,'ulysses s parker'),('345858484825353','2017-03-00',2435,384.15,'michael j jordan'),('349493027412456','2018-04-00',8823,400.15,'john l stevens'),('376789124367894','2020-06-00',1287,2800.12,'bob h pompeani'),('379555789643345','2018-12-00',9176,908.45,'john w jaso');
/*!40000 ALTER TABLE `credit_card_american_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_discover`
--

DROP TABLE IF EXISTS `credit_card_discover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_discover` (
  `discover_number_hash` varchar(140) NOT NULL,
  `discover_expire` date NOT NULL,
  `discover_cvv` int(11) NOT NULL,
  `discover_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discover_fullname` varchar(40) NOT NULL,
  PRIMARY KEY (`discover_number_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_discover`
--

LOCK TABLES `credit_card_discover` WRITE;
/*!40000 ALTER TABLE `credit_card_discover` DISABLE KEYS */;
INSERT INTO `credit_card_discover` VALUES ('6011057085920365','2018-04-00',823,8456.12,'michael j jordan'),('6011245585923345','2018-12-00',176,904.75,'ulysses s parker'),('6221283237582934','2017-03-00',235,495.12,'bob h pompeani'),('6508274038920492','2019-02-00',374,12.73,'john l stevens'),('6508314038920492','2020-06-00',287,3456.23,'john w jaso');
/*!40000 ALTER TABLE `credit_card_discover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_mastercard`
--

DROP TABLE IF EXISTS `credit_card_mastercard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_mastercard` (
  `mastercard_number_hash` varchar(140) NOT NULL,
  `mastercard_expire` date NOT NULL,
  `mastercard_cvv` int(11) NOT NULL,
  `mastercard_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mastercard_fullname` varchar(40) NOT NULL,
  PRIMARY KEY (`mastercard_number_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_mastercard`
--

LOCK TABLES `credit_card_mastercard` WRITE;
/*!40000 ALTER TABLE `credit_card_mastercard` DISABLE KEYS */;
INSERT INTO `credit_card_mastercard` VALUES ('5247691283367394','2020-06-00',138,123.56,'ulysses s parker'),('5315552789543375','2018-12-00',626,9.73,'michael j jordan'),('5454536529477453','2019-02-00',937,3739.23,'john l stevens'),('5474938278319496','2018-04-00',423,5923.56,'bob h pompeani'),('5492584384845373','2017-03-00',864,67.83,'john w jaso');
/*!40000 ALTER TABLE `credit_card_mastercard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_visa`
--

DROP TABLE IF EXISTS `credit_card_visa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_visa` (
  `visa_number_hash` varchar(140) NOT NULL,
  `visa_expire` date NOT NULL,
  `visa_cvv` int(11) NOT NULL,
  `visa_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `visa_fullname` varchar(40) NOT NULL,
  PRIMARY KEY (`visa_number_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_visa`
--

LOCK TABLES `credit_card_visa` WRITE;
/*!40000 ALTER TABLE `credit_card_visa` DISABLE KEYS */;
INSERT INTO `credit_card_visa` VALUES ('4434855697948','2019-02-00',283,649.49,'bob h pompeani'),('4458584848253532','2017-03-00',396,765.45,'john w jaso'),('4494950677124563','2018-04-00',753,1894.34,'michael j jordan'),('4767891243679','2020-06-00',457,9485.93,'john l stevens'),('4795537443945','2018-12-00',946,345.00,'ulysses s parker');
/*!40000 ALTER TABLE `credit_card_visa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_courses_capacity`
--

DROP TABLE IF EXISTS `current_courses_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_courses_capacity` (
  `code` varchar(8) NOT NULL,
  `current_capacity` int(3) NOT NULL,
  `max_capacity` int(3) NOT NULL,
  PRIMARY KEY (`code`),
  CONSTRAINT `current_courses_capacity_ibfk_1` FOREIGN KEY (`code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_courses_capacity`
--

LOCK TABLES `current_courses_capacity` WRITE;
/*!40000 ALTER TABLE `current_courses_capacity` DISABLE KEYS */;
INSERT INTO `current_courses_capacity` VALUES ('ENG101',13,28),('MATH101',21,34);
/*!40000 ALTER TABLE `current_courses_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `department` varchar(40) NOT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('Business'),('Computer Science'),('English'),('Math');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2010`
--

DROP TABLE IF EXISTS `enrolled_2010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2010` (
  `user_email_2010` varchar(30) NOT NULL,
  `user_grade_2010` char(1) NOT NULL DEFAULT '-',
  `user_semester_2010` varchar(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2010`,`user_semester_2010`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2010_ibfk_1` FOREIGN KEY (`user_email_2010`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2010_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2010`
--

LOCK TABLES `enrolled_2010` WRITE;
/*!40000 ALTER TABLE `enrolled_2010` DISABLE KEYS */;
INSERT INTO `enrolled_2010` VALUES ('bpomp@yahoo.com','-','Spring','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2011`
--

DROP TABLE IF EXISTS `enrolled_2011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2011` (
  `user_email_2011` varchar(30) NOT NULL,
  `user_grade_2011` char(1) NOT NULL DEFAULT '-',
  `user_semester_2011` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2011`,`user_semester_2011`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2011_ibfk_1` FOREIGN KEY (`user_email_2011`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2011_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2011`
--

LOCK TABLES `enrolled_2011` WRITE;
/*!40000 ALTER TABLE `enrolled_2011` DISABLE KEYS */;
INSERT INTO `enrolled_2011` VALUES ('bpomp@yahoo.com','B','Fall','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2011` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2012`
--

DROP TABLE IF EXISTS `enrolled_2012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2012` (
  `user_email_2012` varchar(30) NOT NULL,
  `user_grade_2012` char(1) NOT NULL DEFAULT '-',
  `user_semester_2012` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2012`,`user_semester_2012`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2012_ibfk_1` FOREIGN KEY (`user_email_2012`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2012_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2012`
--

LOCK TABLES `enrolled_2012` WRITE;
/*!40000 ALTER TABLE `enrolled_2012` DISABLE KEYS */;
INSERT INTO `enrolled_2012` VALUES ('bpomp@yahoo.com','B','Fall','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2012` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2013`
--

DROP TABLE IF EXISTS `enrolled_2013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2013` (
  `user_email_2013` varchar(30) NOT NULL,
  `user_grade_2013` char(1) NOT NULL DEFAULT '-',
  `user_semester_2013` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2013`,`user_semester_2013`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2013_ibfk_1` FOREIGN KEY (`user_email_2013`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2013_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2013`
--

LOCK TABLES `enrolled_2013` WRITE;
/*!40000 ALTER TABLE `enrolled_2013` DISABLE KEYS */;
INSERT INTO `enrolled_2013` VALUES ('bpomp@yahoo.com','B','Fall','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2013` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2014`
--

DROP TABLE IF EXISTS `enrolled_2014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2014` (
  `user_email_2014` varchar(30) NOT NULL,
  `user_grade_2014` char(1) NOT NULL DEFAULT '-',
  `user_semester_2014` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2014`,`user_semester_2014`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2014_ibfk_1` FOREIGN KEY (`user_email_2014`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2014_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2014`
--

LOCK TABLES `enrolled_2014` WRITE;
/*!40000 ALTER TABLE `enrolled_2014` DISABLE KEYS */;
INSERT INTO `enrolled_2014` VALUES ('bpomp@yahoo.com','B','Fall','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2014` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2015`
--

DROP TABLE IF EXISTS `enrolled_2015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2015` (
  `user_email_2015` varchar(30) NOT NULL,
  `user_grade_2015` char(1) NOT NULL DEFAULT '-',
  `user_semester_2015` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2015`,`user_semester_2015`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2015_ibfk_1` FOREIGN KEY (`user_email_2015`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2015_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2015`
--

LOCK TABLES `enrolled_2015` WRITE;
/*!40000 ALTER TABLE `enrolled_2015` DISABLE KEYS */;
INSERT INTO `enrolled_2015` VALUES ('bpomp@yahoo.com','B','Fall','MATH101'),('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2015` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_2016`
--

DROP TABLE IF EXISTS `enrolled_2016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_2016` (
  `user_email_2016` varchar(30) NOT NULL,
  `user_grade_2016` char(1) NOT NULL DEFAULT '-',
  `user_semester_2016` char(6) NOT NULL,
  `user_course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_email_2016`,`user_semester_2016`,`user_course_code`),
  KEY `user_course_code` (`user_course_code`),
  CONSTRAINT `enrolled_2016_ibfk_1` FOREIGN KEY (`user_email_2016`) REFERENCES `users` (`user_email`),
  CONSTRAINT `enrolled_2016_ibfk_2` FOREIGN KEY (`user_course_code`) REFERENCES `courses` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_2016`
--

LOCK TABLES `enrolled_2016` WRITE;
/*!40000 ALTER TABLE `enrolled_2016` DISABLE KEYS */;
INSERT INTO `enrolled_2016` VALUES ('jjaso@gmail.com','C','Spring','ENG101'),('jsvens@gmail.com','A','Summer','MATH101'),('mjordan@gmail.com','F','Fall','ENG101'),('up@yahoo.com','D','Spring','MATH101');
/*!40000 ALTER TABLE `enrolled_2016` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `location` varchar(40) NOT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Colebank Hall'),('Falcon Center'),('Feaster Center'),('Hardway Hall'),('Technology Park');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `majors` (
  `major` varchar(30) NOT NULL,
  PRIMARY KEY (`major`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES ('Business'),('Computer Science'),('English'),('Math'),('Undecided');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_payment_amazon`
--

DROP TABLE IF EXISTS `online_payment_amazon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_payment_amazon` (
  `online_amazon_username` varchar(50) NOT NULL,
  `online_amazon_password` varchar(50) DEFAULT NULL,
  `online_amazon_balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`online_amazon_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_payment_amazon`
--

LOCK TABLES `online_payment_amazon` WRITE;
/*!40000 ALTER TABLE `online_payment_amazon` DISABLE KEYS */;
INSERT INTO `online_payment_amazon` VALUES ('bpomp@yahoo.com','pass1',849.23),('jjaso.gmail.com','pass4',194.25),('jsvens@gmail','pass2',3945.93),('mjordan@gmail.com','pass3',2390.19),('up@yahoo.com','pass5',1834.73);
/*!40000 ALTER TABLE `online_payment_amazon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_payment_google`
--

DROP TABLE IF EXISTS `online_payment_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_payment_google` (
  `online_google_username` varchar(50) NOT NULL,
  `online_google_password` varchar(50) DEFAULT NULL,
  `online_google_balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`online_google_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_payment_google`
--

LOCK TABLES `online_payment_google` WRITE;
/*!40000 ALTER TABLE `online_payment_google` DISABLE KEYS */;
INSERT INTO `online_payment_google` VALUES ('bpomp@yahoo.com','pass1',742.23),('jjaso.gmail.com','pass4',4194.25),('jsvens@gmail','pass2',1935.92),('mjordan@gmail.com','pass3',90.19),('up@yahoo.com','pass5',7434.43);
/*!40000 ALTER TABLE `online_payment_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_payment_paypal`
--

DROP TABLE IF EXISTS `online_payment_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_payment_paypal` (
  `online_paypal_username` varchar(50) NOT NULL,
  `online_paypal_password` varchar(50) DEFAULT NULL,
  `online_paypal_balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`online_paypal_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_payment_paypal`
--

LOCK TABLES `online_payment_paypal` WRITE;
/*!40000 ALTER TABLE `online_payment_paypal` DISABLE KEYS */;
INSERT INTO `online_payment_paypal` VALUES ('bpomp@yahoo.com','pass1',42.23),('jjaso.gmail.com','pass4',0.23),('jsvens@gmail','pass2',1632.26),('mjordan@gmail.com','pass3',1256.83),('up@yahoo.com','pass5',2535.38);
/*!40000 ALTER TABLE `online_payment_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_username` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_username` (`payment_username`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`payment_username`) REFERENCES `users` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,102.11,'2016-09-22 20:16:56','bpomp@yahoo.com'),(2,12.65,'2016-09-22 20:16:56','jsvens@gmail.com'),(3,949.22,'2016-09-22 20:16:56','mjordan@gmail.com'),(4,1.44,'2016-09-22 20:16:56','jjaso@gmail.com'),(5,1444.00,'2016-09-22 20:16:56','up@yahoo.com');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `state_id` int(11) unsigned NOT NULL,
  `country_id` int(3) unsigned NOT NULL,
  `state_name` varchar(60) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_name` (`state_name`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (0,0,'none'),(241,2,'Balkh'),(242,2,'Herat'),(243,2,'Kabol'),(244,2,'Qandahar'),(245,3,'Benguela'),(246,3,'Huambo'),(247,3,'Luanda'),(248,3,'Namibe'),(249,4,'Ã¢â?¬â??'),(250,5,'Tirana'),(251,6,'Andorra la Vella'),(252,7,'CuraÃƒÂ§ao'),(253,8,'Abu Dhabi'),(254,8,'Ajman'),(255,8,'Dubai'),(256,8,'Sharja'),(257,9,'Buenos Aires'),(258,9,'Catamarca'),(260,9,'Chaco'),(261,9,'Chubut'),(262,9,'Corrientes'),(264,9,'Entre Rios'),(265,9,'Formosa'),(266,9,'Jujuy'),(268,9,'Mendoza'),(269,9,'Misiones'),(270,9,'NeuquÃƒÂ©n'),(271,9,'Salta'),(273,9,'San Luis'),(274,9,'Santa FÃƒÂ©'),(275,9,'Santiago del Estero'),(276,9,'TucumÃƒÂ¡n'),(277,10,'Lori'),(278,10,'Yerevan'),(279,10,'Ã?Â irak'),(280,11,'Tutuila'),(281,14,'St John'),(282,15,'Capital Region'),(283,15,'New South Wales'),(284,15,'Queensland'),(285,15,'South Australia'),(286,15,'Tasmania'),(287,15,'Victoria'),(288,15,'West Australia'),(289,16,'KÃƒÂ¤rnten'),(290,16,'North Austria'),(291,16,'Salzburg'),(292,16,'Steiermark'),(293,16,'Tiroli'),(294,16,'Wien'),(295,17,'Baki'),(296,17,'GÃƒÂ¤ncÃƒÂ¤'),(297,17,'MingÃƒÂ¤ÃƒÂ§evir'),(298,17,'Sumqayit'),(299,18,'Bujumbura'),(300,19,'Antwerpen'),(301,19,'Bryssel'),(302,19,'East Flanderi'),(303,19,'Hainaut'),(304,19,'LiÃƒÂ¨ge'),(305,19,'Namur'),(306,19,'West Flanderi'),(307,20,'Atacora'),(308,20,'Atlantique'),(309,20,'Borgou'),(310,20,'OuÃƒÂ©mÃƒÂ©'),(311,21,'BoulkiemdÃƒÂ©'),(312,21,'Houet'),(313,21,'Kadiogo'),(314,22,'Barisal'),(315,22,'Chittagong'),(316,22,'Dhaka'),(317,22,'Khulna'),(318,22,'Rajshahi'),(319,22,'Sylhet'),(320,23,'Burgas'),(321,23,'Grad Sofija'),(322,23,'Haskovo'),(323,23,'Lovec'),(324,23,'Plovdiv'),(325,23,'Ruse'),(326,23,'Varna'),(327,24,'al-Manama'),(328,25,'New Providence'),(329,26,'Federaatio'),(330,26,'Republika Srpska'),(331,27,'Brest'),(332,27,'Gomel'),(333,27,'Grodno'),(334,27,'Horad Minsk'),(335,27,'Minsk'),(336,27,'Mogiljov'),(337,27,'Vitebsk'),(338,28,'Belize City'),(339,28,'Cayo'),(341,29,'Saint GeorgeÃ?Â´s'),(342,30,'Chuquisaca'),(343,30,'Cochabamba'),(344,30,'La Paz'),(345,30,'Oruro'),(346,30,'PotosÃƒÂ­'),(347,30,'Santa Cruz'),(348,30,'Tarija'),(349,31,'Acre'),(350,31,'Alagoas'),(351,31,'AmapÃƒÂ¡'),(352,31,'Amazonas'),(353,31,'Bahia'),(354,31,'CearÃƒÂ¡'),(356,31,'EspÃƒÂ­rito Santo'),(357,31,'GoiÃƒÂ¡s'),(358,31,'MaranhÃƒÂ£o'),(359,31,'Mato Grosso'),(360,31,'Mato Grosso do Sul'),(361,31,'Minas Gerais'),(362,31,'ParaÃƒÂ­ba'),(363,31,'ParanÃƒÂ¡'),(364,31,'ParÃƒÂ¡'),(365,31,'Pernambuco'),(366,31,'PiauÃƒÂ­'),(367,31,'Rio de Janeiro'),(368,31,'Rio Grande do Norte'),(369,31,'Rio Grande do Sul'),(370,31,'RondÃƒÂ´nia'),(371,31,'Roraima'),(372,31,'Santa Catarina'),(373,31,'SÃƒÂ£o Paulo'),(374,31,'Sergipe'),(375,31,'Tocantins'),(376,32,'St Michael'),(377,33,'Brunei and Muara'),(378,34,'Thimphu'),(379,36,'Francistown'),(380,36,'Gaborone'),(381,37,'Bangui'),(382,38,'Alberta'),(383,38,'British Colombia'),(384,38,'Manitoba'),(385,38,'Newfoundland'),(386,38,'Nova Scotia'),(387,38,'Ontario'),(388,38,'QuÃƒÂ©bec'),(389,38,'Saskatchewan'),(390,39,'Home Island'),(391,39,'West Island'),(392,40,'Basel-Stadt'),(393,40,'Bern'),(394,40,'Geneve'),(395,40,'Vaud'),(396,40,'ZÃƒÂ¼rich'),(397,41,'Antofagasta'),(398,41,'Atacama'),(399,41,'BÃƒÂ­obÃƒÂ­o'),(400,41,'Coquimbo'),(401,41,'La AraucanÃƒÂ­a'),(402,41,'Los Lagos'),(403,41,'Magallanes'),(404,41,'Maule'),(405,41,'OÃ?Â´Higgins'),(407,41,'TarapacÃƒÂ¡'),(408,41,'ValparaÃƒÂ­so'),(409,42,'Anhui'),(410,42,'Chongqing'),(411,42,'Fujian'),(412,42,'Gansu'),(413,42,'Guangdong'),(414,42,'Guangxi'),(415,42,'Guizhou'),(416,42,'Hainan'),(417,42,'Hebei'),(418,42,'Heilongjiang'),(419,42,'Henan'),(420,42,'Hubei'),(421,42,'Hunan'),(422,42,'Inner Mongolia'),(423,42,'Jiangsu'),(424,42,'Jiangxi'),(425,42,'Jilin'),(426,42,'Liaoning'),(427,42,'Ningxia'),(428,42,'Peking'),(429,42,'Qinghai'),(430,42,'Shaanxi'),(431,42,'Shandong'),(432,42,'Shanghai'),(433,42,'Shanxi'),(434,42,'Sichuan'),(435,42,'Tianjin'),(436,42,'Tibet'),(437,42,'Xinxiang'),(438,42,'Yunnan'),(439,42,'Zhejiang'),(440,43,'Abidjan'),(441,43,'BouakÃƒÂ©'),(442,43,'Daloa'),(443,43,'Korhogo'),(444,43,'Yamoussoukro'),(446,44,'ExtrÃƒÂªme-Nord'),(447,44,'Littoral'),(449,44,'Nord-Ouest'),(451,45,'Bandundu'),(452,45,'Bas-ZaÃƒÂ¯re'),(453,45,'East Kasai'),(454,45,'Equateur'),(455,45,'Haute-ZaÃƒÂ¯re'),(456,45,'Kinshasa'),(457,45,'North Kivu'),(458,45,'Shaba'),(459,45,'South Kivu'),(460,45,'West Kasai'),(461,46,'Brazzaville'),(462,46,'Kouilou'),(463,47,'Rarotonga'),(464,48,'Antioquia'),(465,48,'AtlÃƒÂ¡ntico'),(467,48,'BoyacÃƒÂ¡'),(468,48,'Caldas'),(469,48,'CaquetÃƒÂ¡'),(470,48,'Cauca'),(472,48,'Cesar'),(473,48,'Cundinamarca'),(474,48,'Huila'),(475,48,'La Guajira'),(476,48,'Magdalena'),(477,48,'Meta'),(478,48,'NariÃƒÂ±o'),(479,48,'Norte de Santander'),(480,48,'QuindÃƒÂ­o'),(481,48,'Risaralda'),(482,48,'SantafÃƒÂ© de BogotÃƒÂ¡'),(483,48,'Santander'),(485,48,'Tolima'),(486,48,'Valle'),(487,49,'Njazidja'),(488,50,'SÃƒÂ£o Tiago'),(489,51,'San JosÃƒÂ©'),(490,52,'CamagÃƒÂ¼ey'),(492,52,'Cienfuegos'),(493,52,'Granma'),(494,52,'GuantÃƒÂ¡namo'),(495,52,'HolguÃƒÂ­n'),(496,52,'La Habana'),(497,52,'Las Tunas'),(498,52,'Matanzas'),(499,52,'Pinar del RÃƒÂ­o'),(500,52,'Sancti-SpÃƒÂ­ritus'),(501,52,'Santiago de Cuba'),(502,52,'Villa Clara'),(504,54,'Grand Cayman'),(505,55,'Limassol'),(506,55,'Nicosia'),(507,56,'HlavnÃƒÂ­ mesto Praha'),(508,56,'JiznÃƒÂ­ Cechy'),(509,56,'JiznÃƒÂ­ Morava'),(510,56,'SevernÃƒÂ­ Cechy'),(511,56,'SevernÃƒÂ­ Morava'),(512,56,'VÃƒÂ½chodnÃƒÂ­ Cechy'),(513,56,'ZapadnÃƒÂ­ Cechy'),(514,57,'Anhalt Sachsen'),(515,57,'Baden-WÃƒÂ¼rttemberg'),(516,57,'Baijeri'),(517,57,'Berliini'),(518,57,'Brandenburg'),(519,57,'Bremen'),(520,57,'Hamburg'),(521,57,'Hessen'),(522,57,'Mecklenburg-Vorpomme'),(523,57,'Niedersachsen'),(524,57,'Nordrhein-Westfalen'),(525,57,'Rheinland-Pfalz'),(526,57,'Saarland'),(527,57,'Saksi'),(528,57,'Schleswig-Holstein'),(529,57,'ThÃƒÂ¼ringen'),(530,58,'Djibouti'),(532,60,'Ãƒâ?¦rhus'),(533,60,'Frederiksberg'),(534,60,'Fyn'),(535,60,'KÃƒÂ¸benhavn'),(536,60,'Nordjylland'),(537,61,'Distrito Nacional'),(538,61,'Duarte'),(539,61,'La Romana'),(540,61,'Puerto Plata'),(541,61,'San Pedro de MacorÃƒÂ­'),(543,62,'Alger'),(544,62,'Annaba'),(545,62,'Batna'),(546,62,'BÃƒÂ©char'),(547,62,'BÃƒÂ©jaÃƒÂ¯a'),(548,62,'Biskra'),(549,62,'Blida'),(550,62,'Chlef'),(551,62,'Constantine'),(552,62,'GhardaÃƒÂ¯a'),(553,62,'Mostaganem'),(554,62,'Oran'),(555,62,'SÃƒÂ©tif'),(556,62,'Sidi Bel AbbÃƒÂ¨s'),(557,62,'Skikda'),(558,62,'TÃƒÂ©bessa'),(559,62,'Tiaret'),(560,62,'Tlemcen'),(561,63,'Azuay'),(562,63,'Chimborazo'),(563,63,'El Oro'),(564,63,'Esmeraldas'),(565,63,'Guayas'),(566,63,'Imbabura'),(567,63,'Loja'),(568,63,'Los RÃƒÂ­os'),(569,63,'ManabÃƒÂ­'),(570,63,'Pichincha'),(571,63,'Tungurahua'),(572,64,'al-Buhayra'),(573,64,'al-Daqahliya'),(574,64,'al-Faiyum'),(575,64,'al-Gharbiya'),(576,64,'al-Minufiya'),(577,64,'al-Minya'),(578,64,'al-Qalyubiya'),(580,64,'Aleksandria'),(581,64,'Assuan'),(582,64,'Asyut'),(583,64,'Bani Suwayf'),(584,64,'Giza'),(585,64,'Ismailia'),(586,64,'Kafr al-Shaykh'),(587,64,'Kairo'),(588,64,'Luxor'),(589,64,'Port Said'),(590,64,'Qina'),(591,64,'Sawhaj'),(592,64,'Shamal Sina'),(593,64,'Suez'),(594,65,'Maekel'),(595,66,'El-AaiÃƒÂºn'),(596,67,'Andalusia'),(597,67,'Aragonia'),(598,67,'Asturia'),(599,67,'Balears'),(600,67,'Baskimaa'),(601,67,'Canary Islands'),(602,67,'Cantabria'),(603,67,'Castilla and LeÃƒÂ³n'),(604,67,'Extremadura'),(605,67,'Galicia'),(606,67,'Kastilia-La Mancha'),(607,67,'Katalonia'),(609,67,'Madrid'),(610,67,'Murcia'),(611,67,'Navarra'),(612,67,'Valencia'),(613,68,'Harjumaa'),(614,68,'Tartumaa'),(615,69,'Addis Abeba'),(616,69,'Amhara'),(617,69,'Dire Dawa'),(618,69,'Oromia'),(619,69,'Tigray'),(620,70,'Newmaa'),(621,70,'PÃƒÂ¤ijÃƒÂ¤t-HÃƒÂ¤me'),(622,70,'Pirkanmaa'),(623,70,'Pohjois-Pohjanmaa'),(624,70,'Varsinais-Suomi'),(626,72,'East Falkland'),(627,73,'Alsace'),(628,73,'Aquitaine'),(629,73,'Auvergne'),(630,73,'ÃƒÅ½le-de-France'),(631,73,'Basse-Normandie'),(632,73,'Bourgogne'),(633,73,'Bretagne'),(635,73,'Champagne-Ardenne'),(636,73,'Franche-ComtÃƒÂ©'),(637,73,'Haute-Normandie'),(638,73,'Languedoc-Roussillon'),(639,73,'Limousin'),(640,73,'Lorraine'),(641,73,'Midi-PyrÃƒÂ©nÃƒÂ©es'),(642,73,'Nord-Pas-de-Calais'),(643,73,'Pays de la Loire'),(644,73,'Picardie'),(645,73,'Provence-Alpes-CÃƒÂ´te'),(646,73,'RhÃƒÂ´ne-Alpes'),(647,74,'Streymoyar'),(648,75,'Chuuk'),(649,75,'Pohnpei'),(650,76,'Estuaire'),(652,77,'England'),(653,77,'Jersey'),(654,77,'North Ireland'),(655,77,'Scotland'),(656,77,'Wales'),(657,78,'Abhasia [Aphazeti]'),(658,78,'Adzaria [AtÃ?Â¡ara]'),(659,78,'Imereti'),(660,78,'Kvemo Kartli'),(661,78,'Tbilisi'),(662,79,'Ashanti'),(663,79,'Greater Accra'),(667,81,'Conakry'),(668,82,'Basse-Terre'),(669,82,'Grande-Terre'),(670,83,'Banjul'),(671,83,'Kombo St Mary'),(672,84,'Bissau'),(673,85,'Bioko'),(674,86,'Attika'),(675,86,'Central Macedonia'),(676,86,'Crete'),(677,86,'Thessalia'),(678,86,'West Greece'),(680,88,'Kitaa'),(681,89,'Guatemala'),(682,89,'Quetzaltenango'),(683,90,'Cayenne'),(685,92,'Georgetown'),(686,93,'Hongkong'),(687,93,'Kowloon and New Kowl'),(688,95,'AtlÃƒÂ¡ntida'),(689,95,'CortÃƒÂ©s'),(690,95,'Distrito Central'),(691,96,'Grad Zagreb'),(692,96,'Osijek-Baranja'),(693,96,'Primorje-Gorski Kota'),(694,96,'Split-Dalmatia'),(697,98,'Baranya'),(698,98,'BÃƒÂ¡cs-Kiskun'),(699,98,'Borsod-AbaÃƒÂºj-ZemplÃƒ'),(700,98,'Budapest'),(701,98,'CsongrÃƒÂ¡d'),(702,98,'FejÃƒÂ©r'),(703,98,'GyÃƒÂ¶r-Moson-Sopron'),(704,98,'HajdÃƒÂº-Bihar'),(705,98,'Szabolcs-SzatmÃƒÂ¡r-Be'),(706,99,'Aceh'),(707,99,'Bali'),(708,99,'Bengkulu'),(709,99,'Central Java'),(710,99,'East Java'),(711,99,'Jakarta Raya'),(712,99,'Jambi'),(713,99,'Kalimantan Barat'),(714,99,'Kalimantan Selatan'),(715,99,'Kalimantan Tengah'),(716,99,'Kalimantan Timur'),(717,99,'Lampung'),(718,99,'Molukit'),(719,99,'Nusa Tenggara Barat'),(720,99,'Nusa Tenggara Timur'),(721,99,'Riau'),(722,99,'Sulawesi Selatan'),(723,99,'Sulawesi Tengah'),(724,99,'Sulawesi Tenggara'),(725,99,'Sulawesi Utara'),(726,99,'Sumatera Barat'),(727,99,'Sumatera Selatan'),(728,99,'Sumatera Utara'),(729,99,'West Irian'),(730,99,'West Java'),(731,99,'Yogyakarta'),(732,100,'Andhra Pradesh'),(733,100,'Assam'),(734,100,'Bihar'),(735,100,'Chandigarh'),(736,100,'Chhatisgarh'),(737,100,'Delhi'),(738,100,'Gujarat'),(739,100,'Haryana'),(740,100,'Jammu and Kashmir'),(741,100,'Jharkhand'),(742,100,'Karnataka'),(743,100,'Kerala'),(744,100,'Madhya Pradesh'),(745,100,'Maharashtra'),(746,100,'Manipur'),(747,100,'Meghalaya'),(748,100,'Mizoram'),(749,100,'Orissa'),(750,100,'Pondicherry'),(752,100,'Rajasthan'),(753,100,'Tamil Nadu'),(754,100,'Tripura'),(755,100,'Uttar Pradesh'),(756,100,'Uttaranchal'),(757,100,'West Bengali'),(758,102,'Leinster'),(759,102,'Munster'),(760,103,'Ardebil'),(761,103,'Bushehr'),(762,103,'Chaharmahal va Bakht'),(763,103,'East Azerbaidzan'),(764,103,'Esfahan'),(765,103,'Fars'),(766,103,'Gilan'),(767,103,'Golestan'),(768,103,'Hamadan'),(769,103,'Hormozgan'),(770,103,'Ilam'),(771,103,'Kerman'),(772,103,'Kermanshah'),(773,103,'Khorasan'),(774,103,'Khuzestan'),(775,103,'Kordestan'),(776,103,'Lorestan'),(777,103,'Markazi'),(778,103,'Mazandaran'),(779,103,'Qazvin'),(780,103,'Qom'),(781,103,'Semnan'),(782,103,'Sistan va Baluchesta'),(783,103,'Teheran'),(784,103,'West Azerbaidzan'),(785,103,'Yazd'),(786,103,'Zanjan'),(787,104,'al-Anbar'),(788,104,'al-Najaf'),(789,104,'al-Qadisiya'),(790,104,'al-Sulaymaniya'),(791,104,'al-Tamim'),(792,104,'Babil'),(793,104,'Baghdad'),(794,104,'Basra'),(795,104,'DhiQar'),(796,104,'Diyala'),(797,104,'Irbil'),(798,104,'Karbala'),(799,104,'Maysan'),(800,104,'Ninawa'),(801,104,'Wasit'),(802,105,'HÃƒÂ¶fuÃƒÂ°borgarsvÃƒÂ¦ÃƒÂ°i'),(803,106,'Ha Darom'),(804,106,'Ha Merkaz'),(805,106,'Haifa'),(806,106,'Jerusalem'),(807,106,'Tel Aviv'),(808,107,'Abruzzit'),(809,107,'Apulia'),(810,107,'Calabria'),(811,107,'Campania'),(812,107,'Emilia-Romagna'),(813,107,'Friuli-Venezia Giuli'),(814,107,'Latium'),(815,107,'Liguria'),(816,107,'Lombardia'),(817,107,'Marche'),(818,107,'Piemonte'),(819,107,'Sardinia'),(820,107,'Sisilia'),(821,107,'Toscana'),(822,107,'Trentino-Alto Adige'),(823,107,'Umbria'),(824,107,'Veneto'),(825,108,'St. Andrew'),(826,108,'St. Catherine'),(827,109,'al-Zarqa'),(828,109,'Amman'),(829,109,'Irbid'),(830,110,'Aichi'),(831,110,'Akita'),(832,110,'Aomori'),(833,110,'Chiba'),(834,110,'Ehime'),(835,110,'Fukui'),(836,110,'Fukuoka'),(837,110,'Fukushima'),(838,110,'Gifu'),(839,110,'Gumma'),(840,110,'Hiroshima'),(841,110,'Hokkaido'),(842,110,'Hyogo'),(843,110,'Ibaragi'),(844,110,'Ishikawa'),(845,110,'Iwate'),(846,110,'Kagawa'),(847,110,'Kagoshima'),(848,110,'Kanagawa'),(849,110,'Kochi'),(850,110,'Kumamoto'),(851,110,'Kyoto'),(852,110,'Mie'),(853,110,'Miyagi'),(854,110,'Miyazaki'),(855,110,'Nagano'),(856,110,'Nagasaki'),(857,110,'Nara'),(858,110,'Niigata'),(859,110,'Oita'),(860,110,'Okayama'),(861,110,'Okinawa'),(862,110,'Osaka'),(863,110,'Saga'),(864,110,'Saitama'),(865,110,'Shiga'),(866,110,'Shimane'),(867,110,'Shizuoka'),(868,110,'Tochigi'),(869,110,'Tokushima'),(870,110,'Tokyo-to'),(871,110,'Tottori'),(872,110,'Toyama'),(873,110,'Wakayama'),(874,110,'Yamagata'),(875,110,'Yamaguchi'),(876,110,'Yamanashi'),(877,111,'Almaty'),(878,111,'Almaty Qalasy'),(879,111,'AqtÃƒÂ¶be'),(880,111,'Astana'),(881,111,'Atyrau'),(882,111,'East Kazakstan'),(883,111,'Mangghystau'),(884,111,'North Kazakstan'),(885,111,'Pavlodar'),(886,111,'Qaraghandy'),(887,111,'Qostanay'),(888,111,'Qyzylorda'),(889,111,'South Kazakstan'),(890,111,'Taraz'),(891,111,'West Kazakstan'),(893,112,'Coast'),(895,112,'Nairobi'),(896,112,'Nyanza'),(897,112,'Rift Valley'),(898,113,'Bishkek shaary'),(899,113,'Osh'),(900,114,'Battambang'),(901,114,'Phnom Penh'),(902,114,'Siem Reap'),(903,115,'South Tarawa'),(904,116,'St George Basseterre'),(905,117,'Cheju'),(906,117,'Chollabuk'),(907,117,'Chollanam'),(908,117,'Chungchongbuk'),(909,117,'Chungchongnam'),(910,117,'Inchon'),(911,117,'Kang-won'),(912,117,'Kwangju'),(913,117,'Kyonggi'),(914,117,'Kyongsangbuk'),(915,117,'Kyongsangnam'),(916,117,'Pusan'),(917,117,'Seoul'),(918,117,'Taegu'),(919,117,'Taejon'),(920,118,'al-Asima'),(921,118,'Hawalli'),(922,119,'Savannakhet'),(923,119,'Viangchan'),(924,120,'al-Shamal'),(925,120,'Beirut'),(926,121,'Montserrado'),(927,122,'al-Zawiya'),(928,122,'Bengasi'),(929,122,'Misrata'),(937,126,'Maseru'),(938,127,'Kaunas'),(939,127,'Klaipeda'),(940,127,'Panevezys'),(941,127,'Vilna'),(942,127,'Ã?Â iauliai'),(943,128,'Luxembourg'),(944,129,'Daugavpils'),(945,129,'Liepaja'),(946,129,'Riika'),(947,130,'Macau'),(948,131,'Casablanca'),(949,131,'Chaouia-Ouardigha'),(950,131,'Doukkala-Abda'),(951,131,'FÃƒÂ¨s-Boulemane'),(952,131,'Gharb-Chrarda-BÃƒÂ©ni'),(953,131,'Marrakech-Tensift-Al'),(954,131,'MeknÃƒÂ¨s-Tafilalet'),(955,131,'Oriental'),(956,131,'Rabat-SalÃƒÂ©-Zammour-'),(957,131,'Souss Massa-DraÃƒÂ¢'),(958,131,'Tadla-Azilal'),(959,131,'Tanger-TÃƒÂ©touan'),(960,131,'Taza-Al Hoceima-Taou'),(962,133,'Balti'),(963,133,'Bender (TÃƒÂ®ghina)'),(964,133,'Chisinau'),(965,133,'Dnjestria'),(966,134,'Antananarivo'),(967,134,'Fianarantsoa'),(968,134,'Mahajanga'),(969,134,'Toamasina'),(970,135,'Maale'),(971,136,'Aguascalientes'),(972,136,'Baja California'),(973,136,'Baja California Sur'),(974,136,'Campeche'),(975,136,'Chiapas'),(976,136,'Chihuahua'),(977,136,'Coahuila de Zaragoza'),(978,136,'Colima'),(980,136,'Durango'),(981,136,'Guanajuato'),(982,136,'Guerrero'),(983,136,'Hidalgo'),(984,136,'Jalisco'),(985,136,'MÃƒÂ©xico'),(986,136,'MichoacÃƒÂ¡n de Ocampo'),(987,136,'Morelos'),(988,136,'Nayarit'),(989,136,'Nuevo LeÃƒÂ³n'),(990,136,'Oaxaca'),(991,136,'Puebla'),(992,136,'QuerÃƒÂ©taro'),(993,136,'QuerÃƒÂ©taro de Arteag'),(994,136,'Quintana Roo'),(995,136,'San Luis PotosÃƒÂ­'),(996,136,'Sinaloa'),(997,136,'Sonora'),(998,136,'Tabasco'),(999,136,'Tamaulipas'),(1000,136,'Veracruz'),(1001,136,'Veracruz-Llave'),(1002,136,'YucatÃƒÂ¡n'),(1003,136,'Zacatecas'),(1004,137,'Majuro'),(1005,138,'Skopje'),(1006,139,'Bamako'),(1007,140,'Inner Harbour'),(1008,140,'Outer Harbour'),(1009,141,'Irrawaddy [Ayeyarwad'),(1010,141,'Magwe [Magway]'),(1011,141,'Mandalay'),(1012,141,'Mon'),(1013,141,'Pegu [Bago]'),(1014,141,'Rakhine'),(1015,141,'Rangoon [Yangon]'),(1016,141,'Sagaing'),(1017,141,'Shan'),(1018,141,'Tenasserim [Tanintha'),(1019,142,'Ulaanbaatar'),(1020,143,'Saipan'),(1022,144,'Inhambane'),(1023,144,'Manica'),(1024,144,'Maputo'),(1025,144,'Nampula'),(1026,144,'Sofala'),(1027,144,'Tete'),(1028,144,'ZambÃƒÂ©zia'),(1029,145,'Dakhlet NouÃƒÂ¢dhibou'),(1030,145,'Nouakchott'),(1031,146,'Plymouth'),(1032,147,'Fort-de-France'),(1033,148,'Plaines Wilhelms'),(1034,148,'Port-Louis'),(1035,149,'Blantyre'),(1036,149,'Lilongwe'),(1037,150,'Johor'),(1038,150,'Kedah'),(1039,150,'Kelantan'),(1040,150,'Negeri Sembilan'),(1041,150,'Pahang'),(1042,150,'Perak'),(1043,150,'Pulau Pinang'),(1044,150,'Sabah'),(1045,150,'Sarawak'),(1046,150,'Selangor'),(1047,150,'Terengganu'),(1048,150,'Wilayah Persekutuan'),(1049,151,'Mamoutzou'),(1050,152,'Khomas'),(1052,154,'Maradi'),(1053,154,'Niamey'),(1054,154,'Zinder'),(1056,156,'Anambra & Enugu & Eb'),(1057,156,'Bauchi & Gombe'),(1058,156,'Benue'),(1059,156,'Borno & Yobe'),(1060,156,'Cross River'),(1061,156,'Edo & Delta'),(1062,156,'Federal Capital Dist'),(1063,156,'Imo & Abia'),(1064,156,'Kaduna'),(1065,156,'Kano & Jigawa'),(1066,156,'Katsina'),(1067,156,'Kwara & Kogi'),(1068,156,'Lagos'),(1069,156,'Niger'),(1070,156,'Ogun'),(1071,156,'Ondo & Ekiti'),(1072,156,'Oyo & Osun'),(1073,156,'Plateau & Nassarawa'),(1074,156,'Rivers & Bayelsa'),(1075,156,'Sokoto & Kebbi & Zam'),(1076,157,'Chinandega'),(1078,157,'Managua'),(1079,157,'Masaya'),(1081,159,'Drenthe'),(1082,159,'Flevoland'),(1083,159,'Gelderland'),(1084,159,'Groningen'),(1085,159,'Limburg'),(1086,159,'Noord-Brabant'),(1087,159,'Noord-Holland'),(1088,159,'Overijssel'),(1089,159,'Utrecht'),(1090,159,'Zuid-Holland'),(1091,160,'Akershus'),(1092,160,'Hordaland'),(1093,160,'Oslo'),(1094,160,'Rogaland'),(1095,160,'SÃƒÂ¸r-TrÃƒÂ¸ndelag'),(1100,163,'Auckland'),(1101,163,'Canterbury'),(1102,163,'Dunedin'),(1104,163,'Wellington'),(1105,164,'al-Batina'),(1106,164,'Masqat'),(1107,164,'Zufar'),(1108,165,'Baluchistan'),(1109,165,'Islamabad'),(1110,165,'Nothwest Border Prov'),(1112,165,'Sind'),(1113,165,'Sindh'),(1114,166,'PanamÃƒÂ¡'),(1115,166,'San Miguelito'),(1117,168,'Ancash'),(1118,168,'Arequipa'),(1119,168,'Ayacucho'),(1120,168,'Cajamarca'),(1121,168,'Callao'),(1122,168,'Cusco'),(1123,168,'Huanuco'),(1124,168,'Ica'),(1125,168,'JunÃƒÂ­n'),(1127,168,'Lambayeque'),(1128,168,'Lima'),(1129,168,'Loreto'),(1130,168,'Piura'),(1131,168,'Puno'),(1132,168,'Tacna'),(1133,168,'Ucayali'),(1134,169,'ARMM'),(1135,169,'Bicol'),(1136,169,'Cagayan Valley'),(1137,169,'CAR'),(1138,169,'Caraga'),(1139,169,'Central Luzon'),(1140,169,'Central Mindanao'),(1141,169,'Central Visayas'),(1142,169,'Eastern Visayas'),(1143,169,'Ilocos'),(1144,169,'National Capital Reg'),(1145,169,'Northern Mindanao'),(1146,169,'Southern Mindanao'),(1147,169,'Southern Tagalog'),(1148,169,'Western Mindanao'),(1149,169,'Western Visayas'),(1150,170,'Koror'),(1151,171,'National Capital Dis'),(1152,172,'Dolnoslaskie'),(1153,172,'Kujawsko-Pomorskie'),(1154,172,'Lodzkie'),(1155,172,'Lubelskie'),(1156,172,'Lubuskie'),(1157,172,'Malopolskie'),(1158,172,'Mazowieckie'),(1159,172,'Opolskie'),(1160,172,'Podkarpackie'),(1161,172,'Podlaskie'),(1162,172,'Pomorskie'),(1163,172,'Slaskie'),(1164,172,'Swietokrzyskie'),(1165,172,'Warminsko-Mazurskie'),(1166,172,'Wielkopolskie'),(1167,172,'Zachodnio-Pomorskie'),(1168,173,'Arecibo'),(1169,173,'BayamÃƒÂ³n'),(1170,173,'Caguas'),(1171,173,'Carolina'),(1172,173,'Guaynabo'),(1173,173,'MayagÃƒÂ¼ez'),(1174,173,'Ponce'),(1176,173,'Toa Baja'),(1177,174,'Chagang'),(1178,174,'Hamgyong N'),(1179,174,'Hamgyong P'),(1180,174,'Hwanghae N'),(1181,174,'Hwanghae P'),(1182,174,'Kaesong-si'),(1183,174,'Kangwon'),(1184,174,'Nampo-si'),(1185,174,'Pyongan N'),(1186,174,'Pyongan P'),(1187,174,'Pyongyang-si'),(1188,174,'Yanggang'),(1189,175,'Braga'),(1190,175,'CoÃƒÂ­mbra'),(1192,175,'Porto'),(1193,176,'Alto ParanÃƒÂ¡'),(1194,176,'AsunciÃƒÂ³n'),(1197,177,'Hebron'),(1198,177,'Khan Yunis'),(1199,177,'Nablus'),(1200,177,'North Gaza'),(1201,177,'Rafah'),(1202,178,'Tahiti'),(1203,179,'Doha'),(1204,180,'Saint-Denis'),(1205,181,'Arad'),(1206,181,'Arges'),(1207,181,'Bacau'),(1208,181,'Bihor'),(1209,181,'Botosani'),(1210,181,'Braila'),(1211,181,'Brasov'),(1212,181,'Bukarest'),(1213,181,'Buzau'),(1214,181,'Caras-Severin'),(1215,181,'Cluj'),(1216,181,'Constanta'),(1217,181,'DÃƒÂ¢mbovita'),(1218,181,'Dolj'),(1219,181,'Galati'),(1220,181,'Gorj'),(1221,181,'Iasi'),(1222,181,'Maramures'),(1223,181,'Mehedinti'),(1224,181,'Mures'),(1225,181,'Neamt'),(1226,181,'Prahova'),(1227,181,'Satu Mare'),(1228,181,'Sibiu'),(1229,181,'Suceava'),(1230,181,'Timis'),(1231,181,'Tulcea'),(1232,181,'VÃƒÂ¢lcea'),(1233,181,'Vrancea'),(1234,182,'Adygea'),(1235,182,'Altai'),(1236,182,'Amur'),(1237,182,'Arkangeli'),(1238,182,'Astrahan'),(1239,182,'BaÃ?Â¡kortostan'),(1240,182,'Belgorod'),(1241,182,'Brjansk'),(1242,182,'Burjatia'),(1243,182,'Dagestan'),(1244,182,'Habarovsk'),(1245,182,'Hakassia'),(1246,182,'Hanti-Mansia'),(1247,182,'Irkutsk'),(1248,182,'Ivanovo'),(1249,182,'Jaroslavl'),(1250,182,'Kabardi-Balkaria'),(1251,182,'Kaliningrad'),(1252,182,'Kalmykia'),(1253,182,'Kaluga'),(1254,182,'KamtÃ?Â¡atka'),(1255,182,'KaratÃ?Â¡ai-TÃ?Â¡erkessi'),(1256,182,'Karjala'),(1257,182,'Kemerovo'),(1258,182,'Kirov'),(1259,182,'Komi'),(1260,182,'Kostroma'),(1261,182,'Krasnodar'),(1262,182,'Krasnojarsk'),(1263,182,'Kurgan'),(1264,182,'Kursk'),(1265,182,'Lipetsk'),(1266,182,'Magadan'),(1267,182,'Marinmaa'),(1268,182,'Mordva'),(1269,182,'Moscow (City)'),(1270,182,'Moskova'),(1271,182,'Murmansk'),(1272,182,'Nizni Novgorod'),(1273,182,'North Ossetia-Alania'),(1274,182,'Novgorod'),(1275,182,'Novosibirsk'),(1276,182,'Omsk'),(1277,182,'Orenburg'),(1278,182,'Orjol'),(1279,182,'Penza'),(1280,182,'Perm'),(1281,182,'Pietari'),(1282,182,'Pihkova'),(1283,182,'Primorje'),(1284,182,'Rjazan'),(1285,182,'Rostov-na-Donu'),(1286,182,'Saha (Jakutia)'),(1287,182,'Sahalin'),(1288,182,'Samara'),(1289,182,'Saratov'),(1290,182,'Smolensk'),(1291,182,'Stavropol'),(1292,182,'Sverdlovsk'),(1293,182,'Tambov'),(1294,182,'Tatarstan'),(1295,182,'Tjumen'),(1296,182,'Tomsk'),(1297,182,'Tula'),(1298,182,'Tver'),(1299,182,'Tyva'),(1300,182,'TÃ?Â¡eljabinsk'),(1301,182,'TÃ?Â¡etÃ?Â¡enia'),(1302,182,'TÃ?Â¡ita'),(1303,182,'TÃ?Â¡uvassia'),(1304,182,'Udmurtia'),(1305,182,'Uljanovsk'),(1306,182,'Vladimir'),(1307,182,'Volgograd'),(1308,182,'Vologda'),(1309,182,'Voronez'),(1310,182,'Yamalin Nenetsia'),(1311,183,'Kigali'),(1312,184,'al-Khudud al-Samaliy'),(1313,184,'al-Qasim'),(1315,184,'Asir'),(1316,184,'Hail'),(1317,184,'Medina'),(1318,184,'Mekka'),(1319,184,'Najran'),(1320,184,'Qasim'),(1321,184,'Riad'),(1322,184,'Riyadh'),(1323,184,'Tabuk'),(1324,185,'al-Bahr al-Abyad'),(1325,185,'al-Bahr al-Ahmar'),(1326,185,'al-Jazira'),(1327,185,'al-Qadarif'),(1328,185,'Bahr al-Jabal'),(1329,185,'Darfur al-Janubiya'),(1330,185,'Darfur al-Shamaliya'),(1331,185,'Kassala'),(1332,185,'Khartum'),(1333,185,'Kurdufan al-Shamaliy'),(1334,186,'Cap-Vert'),(1335,186,'Diourbel'),(1336,186,'Kaolack'),(1337,186,'Saint-Louis'),(1338,186,'ThiÃƒÂ¨s'),(1339,186,'Ziguinchor'),(1341,189,'Saint Helena'),(1342,190,'LÃƒÂ¤nsimaa'),(1343,191,'Honiara'),(1346,193,'San Miguel'),(1347,193,'San Salvador'),(1348,193,'Santa Ana'),(1349,194,'San Marino'),(1350,194,'Serravalle/Dogano'),(1351,195,'Banaadir'),(1352,195,'Jubbada Hoose'),(1353,195,'Woqooyi Galbeed'),(1354,196,'Saint-Pierre'),(1355,197,'Aqua Grande'),(1356,198,'Paramaribo'),(1357,199,'Bratislava'),(1358,199,'VÃƒÂ½chodnÃƒÂ© Slovensko'),(1359,200,'Osrednjeslovenska'),(1360,200,'Podravska'),(1361,201,'Ãƒâ??rebros lÃƒÂ¤n'),(1362,201,'East GÃƒÂ¶tanmaan lÃƒÂ¤n'),(1363,201,'GÃƒÂ¤vleborgs lÃƒÂ¤n'),(1364,201,'JÃƒÂ¶nkÃƒÂ¶pings lÃƒÂ¤n'),(1366,201,'SkÃƒÂ¥ne lÃƒÂ¤n'),(1367,201,'Uppsala lÃƒÂ¤n'),(1368,201,'VÃƒÂ¤sterbottens lÃƒÂ¤n'),(1369,201,'VÃƒÂ¤sternorrlands lÃƒÂ¤'),(1370,201,'VÃƒÂ¤stmanlands lÃƒÂ¤n'),(1371,201,'West GÃƒÂ¶tanmaan lÃƒÂ¤n'),(1372,202,'Hhohho'),(1373,203,'MahÃƒÂ©'),(1374,204,'al-Hasaka'),(1375,204,'al-Raqqa'),(1376,204,'Aleppo'),(1377,204,'Damascus'),(1378,204,'Damaskos'),(1379,204,'Dayr al-Zawr'),(1380,204,'Hama'),(1381,204,'Hims'),(1382,204,'Idlib'),(1383,204,'Latakia'),(1384,205,'Grand Turk'),(1385,206,'Chari-Baguirmi'),(1386,206,'Logone Occidental'),(1387,207,'Maritime'),(1388,208,'Bangkok'),(1389,208,'Chiang Mai'),(1390,208,'Khon Kaen'),(1391,208,'Nakhon Pathom'),(1392,208,'Nakhon Ratchasima'),(1393,208,'Nakhon Sawan'),(1394,208,'Nonthaburi'),(1395,208,'Songkhla'),(1396,208,'Ubon Ratchathani'),(1397,208,'Udon Thani'),(1398,209,'Karotegin'),(1399,209,'Khujand'),(1400,210,'Fakaofo'),(1401,211,'Ahal'),(1402,211,'Dashhowuz'),(1403,211,'Lebap'),(1404,211,'Mary'),(1405,212,'Dili'),(1406,213,'Tongatapu'),(1407,214,'Caroni'),(1408,214,'Port-of-Spain'),(1409,215,'Ariana'),(1410,215,'Biserta'),(1411,215,'GabÃƒÂ¨s'),(1412,215,'Kairouan'),(1413,215,'Sfax'),(1414,215,'Sousse'),(1415,215,'Tunis'),(1416,216,'Adana'),(1417,216,'Adiyaman'),(1418,216,'Afyon'),(1419,216,'Aksaray'),(1420,216,'Ankara'),(1421,216,'Antalya'),(1422,216,'Aydin'),(1423,216,'Ãƒâ?¡orum'),(1424,216,'Balikesir'),(1425,216,'Batman'),(1426,216,'Bursa'),(1427,216,'Denizli'),(1428,216,'Diyarbakir'),(1429,216,'Edirne'),(1430,216,'ElÃƒÂ¢zig'),(1431,216,'Erzincan'),(1432,216,'Erzurum'),(1433,216,'Eskisehir'),(1434,216,'Gaziantep'),(1435,216,'Hatay'),(1436,216,'IÃƒÂ§el'),(1437,216,'Isparta'),(1438,216,'Istanbul'),(1439,216,'Izmir'),(1440,216,'Kahramanmaras'),(1441,216,'KarabÃƒÂ¼k'),(1442,216,'Karaman'),(1443,216,'Kars'),(1444,216,'Kayseri'),(1445,216,'KÃƒÂ¼tahya'),(1446,216,'Kilis'),(1447,216,'Kirikkale'),(1448,216,'Kocaeli'),(1449,216,'Konya'),(1450,216,'Malatya'),(1451,216,'Manisa'),(1452,216,'Mardin'),(1453,216,'Ordu'),(1454,216,'Osmaniye'),(1455,216,'Sakarya'),(1456,216,'Samsun'),(1457,216,'Sanliurfa'),(1458,216,'Siirt'),(1459,216,'Sivas'),(1460,216,'Tekirdag'),(1461,216,'Tokat'),(1462,216,'Trabzon'),(1463,216,'Usak'),(1464,216,'Van'),(1465,216,'Zonguldak'),(1466,217,'Funafuti'),(1468,218,'Changhwa'),(1469,218,'Chiayi'),(1470,218,'Hsinchu'),(1471,218,'Hualien'),(1472,218,'Ilan'),(1473,218,'Kaohsiung'),(1474,218,'Keelung'),(1475,218,'Miaoli'),(1476,218,'Nantou'),(1477,218,'Pingtung'),(1478,218,'Taichung'),(1479,218,'Tainan'),(1480,218,'Taipei'),(1481,218,'Taitung'),(1482,218,'Taoyuan'),(1483,218,'YÃƒÂ¼nlin'),(1484,219,'Arusha'),(1485,219,'Dar es Salaam'),(1486,219,'Dodoma'),(1487,219,'Kilimanjaro'),(1488,219,'Mbeya'),(1489,219,'Morogoro'),(1490,219,'Mwanza'),(1491,219,'Tabora'),(1492,219,'Tanga'),(1493,219,'Zanzibar West'),(1495,221,'Dnipropetrovsk'),(1496,221,'Donetsk'),(1497,221,'Harkova'),(1498,221,'Herson'),(1499,221,'Hmelnytskyi'),(1500,221,'Ivano-Frankivsk'),(1501,221,'Kiova'),(1502,221,'Kirovograd'),(1503,221,'Krim'),(1504,221,'Lugansk'),(1505,221,'Lviv'),(1506,221,'Mykolajiv'),(1507,221,'Odesa'),(1508,221,'Pultava'),(1509,221,'Rivne'),(1510,221,'Sumy'),(1511,221,'Taka-Karpatia'),(1512,221,'Ternopil'),(1513,221,'TÃ?Â¡erkasy'),(1514,221,'TÃ?Â¡ernigiv'),(1515,221,'TÃ?Â¡ernivtsi'),(1516,221,'Vinnytsja'),(1517,221,'Volynia'),(1518,221,'Zaporizzja'),(1519,221,'Zytomyr'),(1520,223,'Montevideo'),(1521,224,'Alabama'),(1522,224,'Alaska'),(1523,224,'Arizona'),(1524,224,'Arkansas'),(1525,224,'California'),(1526,224,'Colorado'),(1527,224,'Connecticut'),(1528,224,'District of Columbia'),(1529,224,'Florida'),(1530,224,'Georgia'),(1531,224,'Hawaii'),(1532,224,'Idaho'),(1533,224,'Illinois'),(1534,224,'Indiana'),(1535,224,'Iowa'),(1536,224,'Kansas'),(1537,224,'Kentucky'),(1538,224,'Louisiana'),(1539,224,'Maryland'),(1540,224,'Massachusetts'),(1541,224,'Michigan'),(1542,224,'Minnesota'),(1543,224,'Mississippi'),(1544,224,'Missouri'),(1545,224,'Montana'),(1546,224,'Nebraska'),(1547,224,'Nevada'),(1548,224,'New Hampshire'),(1549,224,'New Jersey'),(1550,224,'New Mexico'),(1551,224,'New York'),(1552,224,'North Carolina'),(1553,224,'Ohio'),(1554,224,'Oklahoma'),(1555,224,'Oregon'),(1556,224,'Pennsylvania'),(1557,224,'Rhode Island'),(1558,224,'South Carolina'),(1559,224,'South Dakota'),(1560,224,'Tennessee'),(1561,224,'Texas'),(1562,224,'Utah'),(1563,224,'Virginia'),(1564,224,'Washington'),(1565,224,'Wisconsin'),(1566,225,'Andijon'),(1567,225,'Buhoro'),(1568,225,'Cizah'),(1569,225,'Fargona'),(1570,225,'Karakalpakistan'),(1571,225,'Khorazm'),(1572,225,'Namangan'),(1573,225,'Navoi'),(1574,225,'Qashqadaryo'),(1575,225,'Samarkand'),(1576,225,'Surkhondaryo'),(1577,225,'Toskent'),(1578,225,'Toskent Shahri'),(1582,228,'AnzoÃƒÂ¡tegui'),(1583,228,'Apure'),(1584,228,'Aragua'),(1585,228,'Barinas'),(1587,228,'Carabobo'),(1589,228,'FalcÃƒÂ³n'),(1590,228,'GuÃƒÂ¡rico'),(1591,228,'Lara'),(1593,228,'Miranda'),(1594,228,'Monagas'),(1595,228,'Portuguesa'),(1597,228,'TÃƒÂ¡chira'),(1598,228,'Trujillo'),(1599,228,'Yaracuy'),(1600,228,'Zulia'),(1601,229,'Tortola'),(1602,230,'St Thomas'),(1603,231,'An Giang'),(1604,231,'Ba Ria-Vung Tau'),(1605,231,'Bac Thai'),(1606,231,'Binh Dinh'),(1607,231,'Binh Thuan'),(1608,231,'Can Tho'),(1609,231,'Dac Lac'),(1610,231,'Dong Nai'),(1611,231,'Haiphong'),(1612,231,'Hanoi'),(1613,231,'Ho Chi Minh City'),(1614,231,'Khanh Hoa'),(1615,231,'Kien Giang'),(1616,231,'Lam Dong'),(1617,231,'Nam Ha'),(1618,231,'Nghe An'),(1619,231,'Quang Binh'),(1620,231,'Quang Nam-Da Nang'),(1621,231,'Quang Ninh'),(1622,231,'Thua Thien-Hue'),(1623,231,'Tien Giang'),(1624,232,'Shefa'),(1625,233,'Wallis'),(1626,234,'Upolu'),(1627,235,'Aden'),(1628,235,'Hadramawt'),(1629,235,'Hodeida'),(1630,235,'Ibb'),(1631,235,'Sanaa'),(1632,235,'Taizz'),(1633,236,'Central Serbia'),(1634,236,'Kosovo and Metohija'),(1635,236,'Montenegro'),(1636,236,'Vojvodina'),(1637,237,'Eastern Cape'),(1638,237,'Free State'),(1639,237,'Gauteng'),(1640,237,'KwaZulu-Natal'),(1641,237,'Mpumalanga'),(1642,237,'North West'),(1643,237,'Northern Cape'),(1644,237,'Western Cape'),(1646,238,'Copperbelt'),(1647,238,'Lusaka'),(1648,239,'Bulawayo'),(1649,239,'Harare'),(1650,239,'Manicaland'),(1651,239,'Midlands');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logs` (
  `log_email` varchar(40) NOT NULL,
  `log_action` varchar(40) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_email`),
  CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`log_email`) REFERENCES `users` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logs`
--

LOCK TABLES `user_logs` WRITE;
/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(61) NOT NULL,
  `user_country` varchar(40) NOT NULL,
  `user_state` varchar(40) NOT NULL,
  `user_city` varchar(40) NOT NULL,
  `user_major` varchar(30) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_home_phone` varchar(15) NOT NULL,
  `user_mobile_phone` varchar(15) DEFAULT NULL,
  `user_postal_code` int(5) NOT NULL,
  `user_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_year_started` int(4) NOT NULL,
  `user_fine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currently_enrolled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`user_email`),
  KEY `country` (`user_country`),
  KEY `state` (`user_state`),
  KEY `city` (`user_city`),
  KEY `major` (`user_major`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_country`) REFERENCES `countries` (`country_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_state`) REFERENCES `states` (`state_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`user_city`) REFERENCES `cities` (`city_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`user_major`) REFERENCES `majors` (`major`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Pompeani','Bob','bpomp@yahoo.com','$2y$11$USg6gVx5rmywRyhLnanE8..5xnpSixkRG/oh6uyZVjm152xHGBYvG','Iraq','Karbala','Karbala','Math','123 slow lane','895-757-4463','142-342-4242',97978,1044.23,2012,5.35,''),('Jaso','John','jjaso@gmail.com','$2y$11$k/a6HG/fgEdJwD.uBEgwVeHO2/xCKtI9MCB9Yyqdx2Laxn7gWXRMO','Djibouti','Djibouti','Djibouti','Business','123 wow lane','645-347-5867','978-456-7357',56858,0.00,0,0.00,''),('Stevens','John','jsvens@gmail.com','$2y$11$zZDavUx4BTeWQwZXnGYMZeZftZIxgsw0H9OddKxlaquIdS2gL9zNe','Kiribati','South Tarawa','Bikenibeu','English','Maltese Street','896-478-4678','234-124-1242',66767,0.00,0,0.00,''),('Michael','Jordan','mjordan@gmail.com','$2y$11$tj3GWi.vC4hNSJPplRMl4uZuXGq1b2K1lWpttX.jp7cArWf0PNDsi','Mexico','Durango','Durango','English','4545 First Lane','456-435-6457','657-567-5675',45345,0.00,0,0.00,''),('Jordy','Mercer','up@yahoo.com','$2y$11$P8viKyPH.8i09gvF.VlWE.D52169TXk//pinUePNA.gIkJG5zfbO6','Croatia','Osijek-Baranja','Osijek','Business','123 fast lane','222-224-5533','585-858-6585',45678,0.00,0,0.00,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'enrollment'
--
/*!50003 DROP FUNCTION IF EXISTS `getTotalGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalGPA`(email VARCHAR(30), stringYears VARCHAR(100)) RETURNS decimal(10,2)
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE semester VARCHAR(6);
  DECLARE enrolledTable CHAR(13) DEFAULT CONCAT("enrolled_", year);
  DECLARE enrolledGrade CHAR(15) DEFAULT CONCAT("user_grade_", year);
  DECLARE enrolledSemester CHAR(16) DEFAULT ("user_semester_", year);        
  DECLARE enrolledEmail CHAR(14) DEFAULT ("user_email_", year);
  DECLARE gradeTotal INT(3) DEFAULT 0;
  DECLARE creditHours INT(3) DEFAULT 0;

  IF stringYears IS NULL THEN
    SET stringYears = '';
  END IF;

perform_totaling:
  LOOP
    SET stringLength = CHAR_LENGTH(stringYears);
    SET year = SUBSTRING_INDEX(stringYears, ',', 1);
    SET stringYears = MID(stringYears, 6, stringLength);

    IF stringYears = '' THEN
      LEAVE perform_totaling;
    ELSE 
         CASE
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                             WHERE enrolledEmail = email 
                             AND enrolledSemester = 'fall' LIMIT 1) THEN 
             SET semester = 'fall';
         END CASE;    
         CASE 
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                                 WHERE enrolledEmail = email 
                                 AND enrolledSemester  = 'spring' LIMIT 1) THEN
             SET semester = 'spring';         
         END CASE;   
         CASE
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                                 WHERE enrolledEmail = email 
                                 AND enrolledSemester  = 'summer' LIMIT 1) THEN
             SET semester = 'spring';    
         END CASE;   
      CALL getSemesterGPA(email, semester, year, gradeTotal, creditHours);
    END IF;
   END LOOP perform_totaling;
 
   RETURN (gradeTotal/creditHours);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getYearsAttended` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getYearsAttended`(email VARCHAR(30)) RETURNS varchar(100) CHARSET utf8
    DETERMINISTIC
BEGIN
      DECLARE years_concat VARCHAR(100) DEFAULT ""; 
      
      IF EXISTS(SELECT 1 FROM enrolled_2010 WHERE user_email_2010 = email LIMIT 1) THEN
           SET years_concat = CONCAT_WS(',', '2010', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2011 WHERE user_email_2011 = email LIMIT 1) THEN 
          SET years_concat = CONCAT_WS(',', '2011', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2012 WHERE user_email_2012 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2012', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2013 WHERE user_email_2013 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2013', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2014 WHERE user_email_2014 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2014', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2015 WHERE user_email_2015 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2015', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2016 WHERE user_email_2016 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2016', years_concat);
      END IF;
         
      SET years_concat = TRIM(TRAILING ',' FROM years_concat);
      
      RETURN years_concat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCumulativeGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCumulativeGPA`(IN email VARCHAR(30),
                                  OUT cumulativeGPA DECIMAL(10, 2))
    DETERMINISTIC
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE enrolledTable CHAR(13);
  DECLARE enrolledGrade CHAR(15);
  DECLARE enrolledEmail CHAR(15);
  DECLARE gradeTotal INT(3) DEFAULT 0;
  DECLARE creditHours INT(3) DEFAULT 0;
  DECLARE yearsAttended VARCHAR(100) DEFAULT getYearsAttended(email);
  SET @tempGradeTotal = 0;
  SET @tempCreditHours = 0;
  
  IF yearsAttended != "" THEN      
    perform_totaling:
      LOOP
            SET stringLength = CHAR_LENGTH(yearsAttended);
            SET year = SUBSTRING_INDEX(yearsAttended, ',', 1);
            SET enrolledTable = CONCAT("enrolled_", year);
            SET enrolledGrade = CONCAT("user_grade_", year);
            SET enrolledEmail = CONCAT("user_email_", year);
            SET yearsAttended = MID(yearsAttended, 6, stringLength);
            
            SET @sqlText = CONCAT("SELECT SUM(courses.credits), 
                                       SUM(CASE ",enrolledGrade,"
                                                WHEN 'A' THEN 4
                                                WHEN 'B' THEN 3
                                                WHEN 'C' THEN 2
                                                WHEN 'D' THEN 1
                                                WHEN 'F' THEN 0
                                           END)                                         
                              INTO @tempCreditHours, @tempGradeTotal 
                              FROM ", enrolledTable, " 
                              INNER JOIN courses
                              ON courses.code = user_course_code
                              WHERE ", enrolledEmail, " = '",email,"'");
        
                PREPARE stmt FROM @sqlText;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
              
              SET gradeTotal = (gradeTotal + (@tempGradeTotal * @tempCreditHours));
              SET creditHours = (creditHours + @tempCreditHours);
            
            IF yearsAttended = '' THEN
              LEAVE perform_totaling;
            END IF;
       END LOOP perform_totaling;
     SELECT (gradeTotal / creditHours) INTO cumulativeGPA;
   END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSemesterGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSemesterGPA`(IN email VARCHAR(30),
                               IN semester VARCHAR(6), 
                               IN year INT(4),
                               OUT semesterGPA DECIMAL(10, 2))
    DETERMINISTIC
BEGIN
    DECLARE enrolledTable CHAR(13) DEFAULT CONCAT('enrolled_', year);
    DECLARE userGrade CHAR(15) DEFAULT CONCAT('user_grade_', year);
    DECLARE userSemester CHAR(18) DEFAULT CONCAT('user_semester_', year);
    DECLARE userEmail CHAR(15) DEFAULT CONCAT('user_email_', year);
    SET @gradeTotal = 0;
    SET @creditHours = 0;
    
    SET @sqlText = CONCAT("SELECT SUM(courses.credits), 
                                   SUM(CASE ",userGrade,"
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO @creditHours, @gradeTotal 
                          FROM ", enrolledTable, " 
                          INNER JOIN courses
                          ON courses.code = user_course_code
                          WHERE ", userEmail, " = '",email,"' AND ",userSemester," = '",semester, "'");
    
    PREPARE stmt FROM @sqlText;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;    
    
    SELECT (@gradeTotal * @creditHours / @creditHours) INTO semesterGPA;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTotalGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalGPA`(IN email VARCHAR(30),
                             OUT cumulativeGPA DECIMAL(10, 2))
    DETERMINISTIC
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE enrolledTable CHAR(13) DEFAULT CONCAT("enrolled_", year);
  DECLARE enrolledGrade CHAR(15) DEFAULT CONCAT("user_grade_", year);
  DECLARE enrolledSemester CHAR(18) DEFAULT ("user_semester_", year);        
  DECLARE enrolledEmail CHAR(15) DEFAULT ("user_email_", year);
  DECLARE gradeTotal INT(3) DEFAULT 0;
  DECLARE creditHours INT(3) DEFAULT 0;
  DECLARE yearsAttended VARCHAR(100) DEFAULT getYearsAttended(email);
  SET @tempGradeTotal = 0;
  SET @tempCreditHours = 0;
  
  IF yearsAttended IS NULL THEN
    SET yearsAttended = '';
  END IF;

perform_totaling:
  LOOP
        SET stringLength = CHAR_LENGTH(yearsAttended);
        SET year = SUBSTRING_INDEX(yearsAttended, ',', 1);
        SET yearsAttended = MID(yearsAttended, 6, stringLength);

        IF yearsAttended = '' THEN
          LEAVE perform_totaling;
        ELSE 
           SET @sqlText = CONCAT("SELECT SUM(courses.credits), 
                                   SUM(CASE ",userGrade,"
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO @tempCreditHours, @tempGradeTotal 
                          FROM ", enrolledTable, " 
                          INNER JOIN courses
                          ON courses.code = user_course_code
                          WHERE ", userEmail, " = '",email,"'");
    
            PREPARE stmt FROM @sqlText;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
          
          SET gradeTotal = (gradeTotal + @tempGradeTotal);
          SET creditHours = (creditHours + @tempCreditHours);
        END IF;
   END LOOP perform_totaling;
 
   SELECT ((gradeTotal * creditHours) / creditHours) INTO cumulativeGPA;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-17 16:42:04
