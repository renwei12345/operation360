#!/usr/bin/perl -w
sub get_ip()
{
	my @result = `ifconfig`;
	my @keys;
	my @values;
	my %hash;
	foreach $item (@result){ 							#每行是一个item
	 	if($item =~ m/^[a-z]/g){						#判断该行是否为空格开始
			$char1 = " ";
			$pos = index($item,$char1);
			push @keys,substr($item,0,$pos+1) ;
			#print substr($item,0,$pos+1) ; 
	 	}

	 	if($item =~ m/inet addr:/g){ 					#模式匹配查找ip ,注：终端环境为英语
			 $lenght1 = length($item);
			 $pos1 = pos($item); 						#存ip地址的起始位置

			 $item1 = substr($item,$pos1,$lenght1-$pos1); #截取ip之后的字符串
			 $char = " ";
			 $pos2 = index($item1,$char);

			 push @values,substr($item1,0,$pos2+1);			#取出ip
		}
	}

	for($i=0; $i< @keys;$i++){
		$hash{$keys[$i]} = $values[$i];	
	}
	return %hash;
}
%result1 =get_ip();
print %result1;



