#!/usr/bin/perl
#! 
sub LineFeed
{
  my($LineFeedLenth, $BeforeLine) = @_;
  my $BeforeLineLenth = length($BeforeLine);
  if($BeforeLineLenth >$LineFeedLenth)
  {
		my @values = split(' ', $BeforeLine);  
		my $keyvalue='';
		my $fristkey=$values[0];
		my $returnline='';
		foreach my $val (@values) {  
			if(index($BeforeLine,$val)+length($val)>$LineFeedLenth)
			{
			$keyvalue=$val;
			last;
			}
		}  
		my $tmpline=substr $BeforeLine,0, index($BeforeLine,$keyvalue); 
		$returnline = $tmpline."\n";
		$tmpline=substr $BeforeLine, index($BeforeLine,$keyvalue); 
		$tmpline=sprintf "%".index($BeforeLine,$fristkey)."s%s","", $tmpline;
		$returnline = $returnline.&LineFeed($LineFeedLenth, $tmpline)."\n";
		return ($returnline);
  }
  else
  {
		return ($BeforeLine);
  }
}


my $LineFeedLenth = 10;
my $BeforeLine = ' 234 67 890 2 345 7';
my $AfterLine = ' ';
$AfterLine = &LineFeed($LineFeedLenth, $BeforeLine);
print "$AfterLine";
