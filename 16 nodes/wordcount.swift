
type textfile;
type file;


app (textfile counted) count(textfile tocount,file wordc){
	bash @wordc @filename(tocount) stdout=@counted;
}

app (textfile counted) recount(textfile tocount, int i, file wordc2){
	bash @wordc2 i @filename(tocount) stdout=@counted;
}

(textfile tmerge[]) mergetwo (textfile two[],int p){
	
	file wordc2 <"wordc2.sh">;

	foreach f,i in two{
		if(i%%2!=0){
			if(p==128){
				tmerge[i%/2] = recount(joindata(two[i],two[i-1]),1,wordc2);
			}else{
				tmerge[i%/2] = recount(joindata(two[i],two[i-1]),2,wordc2);			
			}
		}
	}

}

(textfile result[]) mergeall (textfile cfiles[],int p){
	if(p>2){
		textfile inter[] = mergetwo(cfiles,p);
		result = mergeall(inter,p%/2);
	}else{ 
		result = mergetwo(cfiles,p);
	}	
}

app (textfile joined) joindata(textfile mf1, textfile mf2){	
	cat @filename(mf1) @filename(mf2) stdout=@joined;
}


(textfile finalwc[]) wordcount (){
	file wordc <"wordc.sh">;
	textfile texts[] <filesys_mapper; location="./data/", prefix="d_" >;
	textfile tocount[];
	foreach f,i in texts{
		tocount[i] = count(texts[i],wordc); 
	}

	finalwc = mergeall(tocount,128);
}


textfile finalwc[] <simple_mapper; prefix="result", suffix=".txt", padding=1>;

finalwc = wordcount();

