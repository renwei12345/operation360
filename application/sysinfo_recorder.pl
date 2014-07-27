#!/usr/bin/perl -w

while(1){
	my %result;					#键为系统时间，值为cpu状态字符串
	my $t=time();
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
	$index ++;
	my $filename = 'report.txt';
	open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
	say $fh %result;
	close $fh;
	
	sleep(5);									#设定时间间隔
}
