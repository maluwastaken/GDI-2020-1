create table Show(
    IDShow varchar(4) primary key,
    meuLocal varchar(20),
    lotacao number(5)
);
create table Album(
    IDAlbum varchar(4) primary key,
    nome varchar(20),
    gravadora varchar(20)
);
create table Playlist(
    nome varchar(20) primary key,
    descricao varchar(40),
    imagem_capa varchar(60)
);
create table Conta(
    IDConta varchar(4) primary key,
    nome varchar(20),
    email varchar(20)
);
create table Usuario(
    IDUsuario varchar(4) primary key,
    ehPremium number(1),
    cartao_cvv varchar(3),
    cartao_numero varchar(20),
    cartao_nome varchar(20),
    cartao_band varchar(20),
    constraint f_key_conta_usuario foreign key (IDUsuario) references Conta(IDConta)
);
create table Artista(
    IDArtista varchar(4) primary key,
    nome_artistico varchar(20),
    biografia varchar(80),
    constraint f_key_conta_artista foreign key (IDArtista) references Conta(IDConta)
);
create table Audio(
    IDAudio varchar(4) primary key,
    nome varchar(20),
    duracao number(10)
);
create table Podcast(
    IDPodcast varchar(4) primary key,
    episodio number(10),
    temporada number(10),
    constraint f_key_audio_podcast foreign key (IDPodcast) references Audio(IDAudio)
);
create table Tema(
    IDTema varchar(4),
    tema varchar(30),
    constraint p_key_tema primary key (IDTema, tema),
    constraint f_key_podcast_tema foreign key (IDTema) references Podcast(IDPodcast)
);
create table Musica(
    IDMusica varchar(4) primary key,
    constraint f_key_audio_musica foreign key (IDMusica) references Audio(IDAudio)
);
create table Genero(
    IDGenero varchar(4),
    genero varchar(30),
    constraint p_key_genero primary key(IDGenero, genero),
    constraint f_key_musica_genero foreign key (IDGenero) references Musica(IDMusica)
);
create table Turnes(
    IDTurnes varchar(4),
    data_inicio date,
    constraint p_key_turnes primary key (IDTurnes, data_inicio),
    constraint f_key_artista_turnes foreign key (IDTurnes) references Artista(IDArtista)
); 
create table Producao(
    IDProdAudio varchar(4),
    IDProdArtista varchar(4),
    constraint p_key_producao primary key  (IDProdAudio, IDProdArtista),
    constraint f_key_audio_producao foreign key (IDProdAudio) references Audio(IDAudio),
    constraint f_key_artista_producao foreign key (IDProdArtista) references Artista(IDArtista)
);
create table Seguir(
    IDSeguidor varchar(4),
    IDSeguido varchar(4),
    CONSTRAINT p_key_seguir primary key (IDSeguidor, IDSeguido),
    CONSTRAINT f_key_usuario_seguir foreign key (IDSeguidor) references Usuario(IDUsuario),
    CONSTRAINT f_key_usuario_seguir2 foreign key (IDSeguido) references Usuario(IDUsuario)
);
create table FazParte(
    IDParteAudio varchar(4),
    IDParteArtista varchar(4),
    IDParteAlbum varchar(4),
    constraint p_key_fazparte primary key (IDParteAudio, IDParteArtista, IDParteAlbum),
    constraint f_key_producao_fazparte foreign key (IDParteAudio, IDParteArtista) references Producao(IDProdAudio, IDProdArtista),
    constraint f_key_album_fazparte foreign key (IDParteAlbum) references Album(IDAlbum)
);
create table Possuem(
    IDPossuem varchar(4),
    data_inicio date,
    IDPossuemShow varchar(4),
    data_show date,
    constraint f_key_turnes_possuem foreign key (IDPossuem, data_inicio) references Turnes(IDTurnes, data_inicio),
    constraint f_key_show_possuem foreign key (IDPossuemShow) references Show(IDShow),
    constraint p_key_possuem primary key (IDPossuem, data_inicio, IDPossuemShow, data_show)
);
create table Contem(
    IDContemMusica varchar(4),
    IDContemShow varchar(4),
    constraint f_key_musica_contem foreign key (IDContemMusica) references Musica(IDMusica),
    constraint f_key_show_contem foreign key (IDContemShow) references Show(IDShow),
    constraint p_key_contem primary key (IDContemMusica, IDContemShow)
);
create table Criar(
    IDCriarUsuario varchar(4),
    IDCriarAudio varchar(4),
    nome varchar(20),
    constraint f_key_usuario_criar foreign key (IDCriarUsuario) references Usuario(IDUsuario),
    constraint f_key_audio_criar foreign key (IDCriarAudio) references Audio(IDAudio),
    constraint f_key_playlist_criar foreign key (nome) references Playlist(nome),
    constraint p_key_criar primary key (IDCriarAudio, nome)
);
