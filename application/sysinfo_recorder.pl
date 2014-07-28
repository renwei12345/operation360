#!/usr/bin/perl -w

while(1){
	my %result;					#键为系统时间，值为cpu状态字符串
	my $t=time();
	($sec,$min,$hour,$day,$mon,$year,$wday,$yday,$isdst)=localtime(time());
	$mon += 1;
	$year += 1900;
	my @list =`top -bcn 1`;
	print @list;
	my $cpuinfo;
	foreach my $listfile (@list){
    	if($listfile =~ /Cpu/g){
    		chomp $listfile;
     		$cpuinfo = $listfile;			#$cpuinfo 即是所要行
  			#print "cpu :",$cpuinfo, "\n";
 		}
	}
	print "cpu :",$cpuinfo, "\n";
	$result{$t} = $cpuinfo;
	my $filename = "$day,$mon,$year.txt";				#配置日志文件名，设置为每天一个文件，以日期作为文件名
	open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
	say $fh %result;
	close $fh;
	
	sleep(5);									#设定时间间隔
}
