jokeaday () 
{ 
    jokedir=$HOME/.config/jokes;
    lastdate=$jokedir/lastdate;
    lastjoke=$jokedir/lastjoke;
    jokebase=$jokedir/jokes;
    mkdir -p $jokebase;

    url=http://www.jokeswarehouse.com/cgi-bin/viewjoke2.cgi;

    date=$(cat $lastdate) || date=20011130;
    date=$(date +%Y%m%d --date="$date +1 day");
    links2 -dump $url?id=$date | head -n -5 > $lastjoke
    less -X --QUIT-AT-EOF $lastjoke
    echo $date > $lastdate
}

savejoke () {
    jokedir=$HOME/.config/jokes;
    lastdate=$jokedir/lastdate;
    lastjoke=$jokedir/lastjoke;
    jokebase=$jokedir/jokes;
    mkdir -p $jokebase;

    cp $lastjoke $jokebase/`cat $lastdate`
}

showjokes () {
    jokedir=$HOME/.config/jokes;
    jokebase=$jokedir/jokes;

    for f in $jokebase/*; do
    	head -n 3 $f
    done 
}