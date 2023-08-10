#from imagem (golang)
FROM golang:alpine as builder 

#Workdir /paste/ se nao tiver paste ele vai criar dentro do container
#ou seja tudo o que for feito pra baixo vai ser dentro do container
WORKDIR  /go/src/

#copy (.)primeiro ponto = directorio (onde esta Dockerfile e o main.go) 
# o Copy, vai copiar no diretorio (Dockerfile e o main.go)e colar dentro /go/src/
# o D4 é o aquivo raiz dentro da minha maquina e a intensao e de o colocar dentro do container = Workdir
# (.)segundo ponto é o Workdir
COPY . .

#o RUN, é pra executar qualquer tipo comando
#exemplo: RUN mkdir, ls, chmod
#este RUN, é um commando do golang. para criar a imagem
RUN CGO_ENABLE=0 GOOS=linux go build -o /go/bin/server main.go

CMD [ "/go/bin/server" ]
#A primeira imagem (FROM: golang:alpine), foi apenas para gerar o executavel que vai ser usada depois no
# (FROM scratch)
#------------------------------------------------------------------------------------------------------
#o From Scratch é uma imagem sem nada, criado pelo docker, como se fosse um planta de casa sem devisorias
# cada vez que fazemos o FROM esta a criar um processo de criar imagem
#FROM  scratch

#o copy o que el vai fazer aqui é que ele vai buscar a imagem gerada no buildes o por isso
#o commando --from=builder, ou seja vai buscar a imagem do builder  /go/bin/server e colocar no /server
#o /server é o nome do aquivo que vai ser criado dentro do scratch onde vai ser colocado a imagem vinda do /go/bin/server
#COPY  --from=builder /go/bin/server /server

#a imagem esta esposta na porta 8080
#EXPOSE 6060

#E quando a acessarem a imagem vai ser chamada a web server (/server) que foi criada no scratch

