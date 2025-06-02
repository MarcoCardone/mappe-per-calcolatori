## Domanda 1 (località dei riferimenti) x2
Si descriva il principio di località dei riferimenti riportando qualche esempio e spiegando le ragioni che lo giustificano.
Si riporti anche in quali contesti architetturali viene sfruttato il principio di località dei riferimenti, spiegando come esso venga
sfruttato.

## Domanda 2 (banco di memoria) x2
Si consideri un banco di memoria RAM da 4 Kparole di 32 bit ciascuna, composto da moduli da 1 Kparole da 8 bit ciascuno.
Si risponda alle seguenti domande:
1. quali e quanti sono i segnali di ingresso e uscita del banco di memoria?
2. quanti moduli sono necessari per realizzare l’intero banco di memoria?
3. quali altri moduli oltre quelli di memoria sono necessari per realizzare il banco?
4. che cosa pilotano i segnali di indirizzo in ingresso?
5. chi genera i segnali che pilotano i segnali di enable dei vari moduli?

Si consideri un banco di memoria da 8 Kparole di 16 bit ciascuna, composto da moduli da 2Kparole da 8 bit ciascuno.
Si risponda alle seguenti domande:
1. quanti moduli sono necessari per realizzare l’intero banco di memoria?
2. chi pilota i segnali di indirizzo di ciascun modulo?
3. chi pilota il segnale di enable di ciascun modulo?
4. chi pilota i segnali di dato di ciascun modulo?



## Domanda 3 (arbitraggio del bus)
Si consideri un sistema composto da 20 moduli master con arbitraggio del bus di tipo polling.
Si risponda ai seguenti punti
1. Quanti e quali segnali sono necessari per l’arbitraggio? Chi genera e chi legge ciascuno di tali segnali?
2. Come funziona il meccanismo di arbitraggio? Si dettaglino i vari passaggi dal momento in cui il bus diventa libero al
momento in cui il dispositivo identificato come master ne prende il controllo.
3. Quali vantaggi / svantaggi presenta la soluzione basata su polling rispetto ad una soluzione basata su daisy chain?

Si consideri un sistema composto da n moduli master con arbitraggio del bus di tipo daisy chain.
Si risponda ai seguenti punti
1. Quanti e quali segnali sono necessari per l’arbitraggio? Chi genera e chi legge ciascuno di tali segnali?
2. Come funziona il meccanismo di arbitraggio?
3. Quali vantaggi / svantaggi presenta la soluzione basata su daisy chain rispetto ad una soluzione basata su polling?


## Domanda 4 (DMA) x3
Si illustrino le funzionalità offerte da un DMA Controller e si elenchino i passaggi attraverso i quali avviene un trasferimento in
DMA, partendo dalla fase di programmazione.

Si descrivano le funzionalità del Direct Memory Access (DMA) e si elenchino i passaggi attraverso i quali avviene un
trasferimento. Si consideri anche la fase di programmazione effettuata dalla CPU.

Con riferimento al meccanismo del DMA
 Si descrivano le funzionalità offerte dal DMA Controller
 Si evidenzino i vantaggi offerti dal DMA rispetto ad altri meccanismi di trasferimento dati da/verso periferiche, quali
l’I/O programmato o l’interrupt
 Si descrivano le connessioni tra il DMA controller e il resto del sistema
 Si illustrino i passaggi attraverso i quali avviene un trasferimento in DMA, partendo dalla fase di programmazione da
parte della CPU.



## Domanda 5 (contatore) x2
Si considerino le varie soluzioni per la realizzazione di un contatore. In particolare
1. Si descriva l’architettura di un contatore asincrono, specificando il tipo di moduli elementari utilizzati e la loro
connessione
2. Si descriva l’architettura di un contatore sincrono, specificando il tipo di moduli elementari utilizzati e la loro
connessione
3. Si elenchino i vantaggi /svantaggi delle due soluzioni.

## Domanda 6 (unità di controllo microprogrammata) x5
Si consideri un’unità di controllo microprogrammata e si risponda ai seguenti punti
1. Quali sono i moduli che la compongono? Si descrivano i collegamenti tra i vari moduli e l’esterno.
2. Quali sono le operazioni svolte dall’unità di controllo microprogrammata durante l’esecuzione di ciascuna istruzione?
3. Quali sono i vantaggi e svantaggi della soluzione microprogrammata rispetto a quella cablata?

Si consideri un’unità di controllo microprogrammata:
1. se ne descriva l’architettura (elencando i componenti e le connessioni)
2. Se ne descriva il funzionamento
3. Si elenchino vantaggi e svantaggi rispetto all’architettura cablata
4. Assumendo che la memoria di microcodice sia composta da 250 parole da 70 bit ciascuna, si determini la
dimensione in bit del PC e quella del IR.

Si descriva la tecnica nota come microprogrammazione verticale e si elenchino svantaggi e svantaggi
rispetto alla micorpogrammazione orizzontale

Si consideri un’unità di controllo microprogrammata:
1. se ne descriva l’architettura (elencando i componenti e le loro connessioni reciproche e con l’esterno dell’unità di
controllo)
2. Se ne descriva il funzionamento
3. Si elenchino vantaggi e svantaggi rispetto all’architettura cablata
4. Assumendo che la memoria di microcodice sia composta da 150 parole da 56 bit ciascuna, si determini la dimensione in
bit del PC.

## Domanda 7 (cache) x7
Si consideri un processore connesso ad una memoria da 64KB e dotato di una cache direct mapped da 16 linee, ciascuna da 32
byte. Assumendo che inizialmente le 16 linee contengano i primi 16 blocchi di memoria (quindi la linea 0 contiene il blocco 0, la
linea 1 il blocco 1, e così via), si determini quali dei seguenti 12 accessi in memoria da parte del processore provocano un hit, e
quali un miss, scrivendo H o M nella colonna di destra della corrispondente riga nella tabella.


Si consideri un processore connesso a una memoria da 1 Kbyte e dotato di una cache direct mapped composta da 8 linee da 32
byte ciascuna.
Si assuma che la cache sia inizialmente vuota e che il processore esegua una serie di accessi in memoria in cui genera i seguenti
indirizzi:
0001001010, 0111001100, 1000110100, 1100000000, 0101100110, 0001001000, 1010000010, 0010100010,
0111001000, 1100011000, 0001000000, 0000110100, 1010010010, 1001000000, 0011100000
Per ogni accesso, si indichi la linea in cui si trova eventualmente il blocco di memoria referenziato e se l’accesso in cache
determina un hit o un miss.
Si specifichi il numero del blocco memorizzato in ciascuna linea della cache al termine della sequenza.

Si consideri un sistema a processore che include
 una memoria di 1k byte
 una cache direct-mapped composta da 4 linee da 8 byte ciascuna.
Si assuma che inizialmente la cache contenga i blocchi 0, 1, 2, 3. Si determini il numero del blocco presente in ciascuna linea della
cache al termine della sequenza di accessi in memoria corrispondente agli indirizzi riportati in tabella e si riporti il risultato nella
tabella apposita.
Sequenza degli accessi alla memoria
|||
|:---:|:---:|
|Accesso 1| 00 00 01 01 01|
|Accesso 2| 11 00 01 01 11|
|Accesso 3| 10 00 01 10 01|
|Accesso 4| 00 00 00 00 00|
|Accesso 5| 10 01 11 01 00|
|Accesso 6| 10 01 01 01 11|
|Accesso 7| 01 00 01 10 01|
|Accesso 8| 10 10 11 11 00|


Contenuto iniziale della cache
|Linea|Blocco|
|:---:|:---:|
|0 | 0|
|1 | 1|
|2 | 2|
|3 | 3|


Contenuto finale della cache
|Linea|Blocco|
|:---:|:---:|
|0|
|1|
|2|
|3|

Si consideri un processore connesso ad una memoria da 64KB e dotato di una cache direct mapped da 16 linee, ciascuna composta
da 32 byte. Assumendo che inizialmente le 16 linee contengano i primi 16 blocchi di memoria (quindi la linea 0 contiene il blocco
0, la linea 1 il blocco 1, e così via), si determini quali dei seguenti 12 accessi in memoria da parte del processore provocano un hit,
e quali un miss, scrivendo H o M nella colonna di destra della corrispondente riga nella tabella.

Si consideri un sistema a processore che include
 una memoria di 512 byte
 una cache direct-mapped composta da 4 linee da 4 byte ciascuna.
Si assuma che inizialmente la cache contenga i blocchi 0, 1, 2, 3. Si determini il numero del blocco presente in ciascuna linea della
cache al termine della sequenza di accessi in memoria corrispondente agli indirizzi riportati in tabella e si riporti il risultato nella
figura.

Si consideri un processore connesso a una memoria da 1Kbyte e dotato di una cache direct-mapped composta da 8 linee da 32 byte
ciascuna.
Si assuma che la cache sia inizialmente vuota e che il processore esegua una serie di accessi in memoria in cui genera i seguenti
indirizzi:
1010010101, 1011010111, 0111111001, 1100000100, 1000111100, 1110100111, 1111011001, 1000111100, 1111011101,
0001001111, 1110111110, 0001000100.
Si riempia la tabella allegata, specificando il blocco acceduto, la linea di cache coinvolta e se l’accesso in cache ha provocato un
hit (H) o miss (M).

Si consideri un processore connesso ad una memoria da 64KB e dotato di una cache direct mapped da 32 linee, ciascuna da 16
byte. Assumendo che inizialmente le 32 linee contengano i primi 32 blocchi di memoria (quindi la linea 0 contiene il blocco 0, la
linea 1 il blocco 1, e così via), si determini quali dei seguenti 12 accessi in memoria da parte del processore provocano un hit (H),
e quali un miss (M), completando la tabella seguente.

## Domanda 8 (memoria virtuale) x4
Si consideri il meccanismo della memoria virtuale: si descriva la sequenza di operazioni eseguite per trasformare ciascun indirizzo
logico generato dal processore nel conseguente indirizzo fisico. Per ciascuna operazione, si specifichi quali sono i moduli
hardware o i componenti software coinvolti. Si richiede inoltre di elencare i vantaggi derivanti dall'adozione del meccanismo della
memoria virtuale.

## Domanda 9 (interrupt) x3
Si elenchino le operazioni che si susseguono in un sistema a processore che utilizza il meccanismo dell’interrupt vettorizzato dal
momento in cui una periferica attiva una richiesta di interrupt al momento in cui la CPU esegue la prima istruzione della
corrispondente procedura di servizio dell’interrupt (ISR), elencando tra l’altro le operazioni necessarie per il salvataggio dello
stato corrente.

## Domanda 10 (micro-operazione) x3
Utilizzando la tabella riportata, si elenchino le micro-operazioni eseguite da un processore MIPS durante la fase di esecuzione
(ignorando il fetch) dell’istruzione sw $s2, 100($s1), specificando il valore dei segnali di controllo in ogni periodo di clock.

## Domanda 11 (pipeline) x3
Si descrivano le principali caratteristiche dell’architettura di un processore basato su pipeline, mettendo in evidenza i vantaggi ed
elencando i possibili fattori che ne riducono l’efficacia.

Con riferimento ad un’architettura a pipeline ideale
 se ne descriva l’architettura e il funzionamento
 si elenchino le principali cause che ne limitano il comportamento ideale

Si descrivano le principali cause che limitano il comportamento ideale delle pipeline in un processore RISC.

## Domanda 12 (dischi magnetici)
Con riferimento all’organizzazione e al funzionamento dei dischi magnetici, si risponda alle seguenti domande:
1. Come sono organizzati i dati sulle facce dei vari dischi?
2. Come avviene l’operazione di accesso ad un settore? Quali sono e a che cosa corrispondono i tre tempi che definiscono il
tempo di accesso?
3. Quali sono i vantaggi / svantaggi di una soluzione di tipo CAV (Constant Angular Velocity) rispetto ad una soluzione
CLV (Constant Linear Velocity)? Quale delle due soluzioni è usata nei dischi magnetici e perché?

## Domanda 13 (SSD) x2
Si consideri una memoria basata su unità SSD
1. Si descrivano le caratteristiche della memoria
2. Si descriva l’organizzazione dei dati sui moduli SSD
3. Si descriva il meccanismo di accesso alla generica pagina
4. Si elenchino vantaggi e svantaggi rispetto ad un’unità basata su disco magnetico.

Considerando le unità di memoria a stato solido (Solid State Disk o SSD):
1. Se ne descrivano gli usi nell’ambito dell’architettura di un calcolatore
2. Si descrivano le principali tecnologie utilizzate
3. Si illustri l’architettura interna, riportando i principali elementi interni e le rispettive funzionalità
4. Si riporti un esempio di architettura di una SSD.

## Domanda 14 (RAM) x2
Si descrivano le principali caratteristiche delle memorie RAM dinamiche, evidenziando vantaggi e svantaggi rispetto alle memorie
di tipo RAM statico.

## Domanda 15 (cache funzionamento)
Si descrivano i due meccanismi noti come Write-Back e Write-Through per la gestione delle operazioni di
scrittura in una cache, elencando i principali vantaggi e svantaggi di ciascuno dei due meccanismi.

## Domanda 16 (page fault)
Si descrivano le cause che portano all’evento noto come page fault e si descrivano le operazioni eseguite in
conseguenza di tale evento, specificando chi ha il compito di svolgere ciascuna di tali operazioni.

## Domanda 17 (BUS)
In riferimento al bus di sistema:
1. si descriva la struttura e il funzionamento di un bus sincrono, evidenziando le differenze rispetto ad un bus asincrono
2. si descriva il meccanismo di arbitraggio distribuito (architettura e funzionamento), usando come esempio il bus SCSI
3. si elenchino i meccanismi di arbitraggio centralizzato, elencando per ciascuno vantaggi e svantaggi.