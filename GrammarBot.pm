package GrammarBot;
use Bot::BasicBot;
use Moose;
use MooseX::NonMoose;
use IPC::Open2;
extends 'Bot::BasicBot';

override 'said', sub
{
	my $self = shift;
	my $input = shift;
	open2(my $in, my $out, "diction", "-sb");
	print $out ucfirst($input->{body}).".\n"; # Capitalize/punctuate so that diction recognizes this as a sentence.
	close($out);

	my $response;
	while (<$in>)
	{
		$response .= $_ if(s/\(stdin\):\d+: //);
	}
	close($in);

	if($response)
	{
		$self->say(who => $input->{who},
		           channel => 'msg',
		           body => $response)
	}
	return;
};

1;
