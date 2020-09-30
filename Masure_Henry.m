clear variables;
close all;
clc;

%%/////////Question 1////////////////

Video=VideoReader('video6.mov');
Temps=Video.Duration;
Frequence=Video.FrameRate;
nbFrames=Video.Duration*Video.FrameRate; %3*30=90
figure;
for i=1:2:90
    I=read(Video,i);
    imshow(I);
    title(['Image n°' num2str(i)]);
    pause(1);
end


%%/////////Question 2////////////////
%Voir feuille annexe


%%/////////Question 3////////////////
%Phase 1 : ouverture de l'image 1 à 19
%Phase 2 : stationnaire de l'image 20 à 65
%Phase 3 : fermeture de l'image 66 à 90


%Phase 1
Video=VideoReader('video6.mov');
subplot (2,3,1);
j=13:1:18;
imshow(read(Video,j(1)));
subplot (2,3,2);
imshow(read(Video,j(2)));
subplot (2,3,3);
imshow(read(Video,j(3)));
subplot (2,3,4);
imshow(read(Video,j(4)));
subplot (2,3,5);
imshow(read(Video,j(5)));
subplot (2,3,6);
imshow(read(Video,j(6)));

%Phase 2
Video=VideoReader('video6.mov');
subplot (2,3,1);
j=19:9:64;
imshow(read(Video,j(1)));
subplot (2,3,2);
imshow(read(Video,j(2)));
subplot (2,3,3);
imshow(read(Video,j(3)));
subplot (2,3,4);
imshow(read(Video,j(4)));
subplot (2,3,5);
imshow(read(Video,j(5)));
subplot (2,3,6);
imshow(read(Video,j(6)));

%Phase 3
Video=VideoReader('video6.mov');
subplot (2,3,1);
j=65:5:90;
imshow(read(Video,j(1)));
subplot (2,3,2);
imshow(read(Video,j(2)));
subplot (2,3,3);
imshow(read(Video,j(3)));
subplot (2,3,4);
imshow(read(Video,j(4)));
subplot (2,3,5);
imshow(read(Video,j(5)));
subplot (2,3,6);
imshow(read(Video,j(6)));


%%/////////Question 4////////////////
%On va decouper un rectangle afin d'isoler la valve
%Puis on va calculer l'aire en comptant le nombre de pixels noirs

Video=VideoReader('video6.mov');

%On calcule l'aire géométrique d'ouverture de la valve lors de l'ouverture
aire_ouverture=ones(1,6);
compteur=1;

for i=13:1:18
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    ouverture=bwselect(~binaire,l/2,c/2,8);
    aire_ouverture(compteur) = bwarea(ouverture); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur=compteur+1;
end
aire_ouverture(1,:)

%On calcule l'aire géométrique d'ouverture de la valve lors de la phase
%stationnaire
aire_stationnaire=ones(1,6);
compteur2=1;

for i=19:9:64
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    stationnaire=bwselect(~binaire,l/2,c/2,8);
    aire_stationnaire(compteur2) = bwarea(stationnaire); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur2=compteur2+1;
end
aire_stationnaire(1,:)

%On calcule l'aire géométrique d'ouverture de la valve lors de fermeture
aire_fermeture=ones(1,6);
compteur3=1;

for i=65:5:90
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    fermeture=bwselect(~binaire,l/2,c/2,8);
    aire_fermeture(compteur3) = bwarea(fermeture); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur3=compteur3+1;
end
aire_fermeture(1,:)


%%/////////Question 5////////////////

%Représentation graphique de Aire=f(t)

Video=VideoReader('video6.mov');

%On calcule l'aire géométrique d'ouverture de la valve lors de l'ouverture
aire_ouverture=ones(1,6);
compteur=1;

for i=13:1:18
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    ouverture=bwselect(~binaire,l/2,c/2,8);
    aire_ouverture(compteur) = bwarea(ouverture); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur=compteur+1;
end
aire_ouverture(1,:);

%On calcule l'aire géométrique d'ouverture de la valve lors de la phase
%stationnaire
aire_stationnaire=ones(1,6);
compteur2=1;

for i=19:9:64
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    stationnaire=bwselect(~binaire,l/2,c/2,8);
    aire_stationnaire(compteur2) = bwarea(stationnaire); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur2=compteur2+1;
end
aire_stationnaire(1,:);

%On calcule l'aire géométrique d'ouverture de la valve lors de fermeture
aire_fermeture=ones(1,6);
compteur3=1;

for i=65:5:90
    I=read(Video,i);
    J=imcrop(I,[120 140 250 270]);
    binaire=im2bw(J,0.18);
    [l,c,d]=size(binaire);
    fermeture=bwselect(~binaire,l/2,c/2,8);
    aire_fermeture(compteur3) = bwarea(fermeture); %le bwarea compte les pixels blancs donc on met le ~ pour compter les noirs
    compteur3=compteur3+1;
end
aire_fermeture(1,:);


t1=(3/90)*(13:1:18);
t2=(3/90)*(19:9:64);
t3=(3/90)*(65:5:90);
plot(t1,aire_ouverture,'r');
hold on;
plot(t2,aire_stationnaire,'r');
hold on;
plot(t3,aire_fermeture,'r');
title('Aire ouverture de la valve en fonction du temps');
xlabel('Temps (s)');
ylabel('Aire ouverture (en pixels)');


