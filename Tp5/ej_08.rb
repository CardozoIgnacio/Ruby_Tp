def dados(veces)
    arry=Array.new
    begin
        arry[arry.size]=rand(1..6)
    end until(arry.size==veces)
    return arry
end
def veces_dados(arry)
    veces=[0,0,0,0,0,0,0]
    i=0
    begin
        veces[arry[i]]=veces[arry[i]]+1
        i=i+1
    end until(arry.size==i)
    return veces
end

#main
d=dados(10)
print d
print veces_dados(d)