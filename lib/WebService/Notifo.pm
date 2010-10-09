package WebService::Notifo;
BEGIN {
  $WebService::Notifo::VERSION = '0.001';
}

# ABSTRACT: client for the Notifo.com API

use strict;
use warnings;
use parent 'Protocol::Notifo';
use LWP::UserAgent;

sub send_notification {
  my $self = shift;
  
  my $req = $self->SUPER::send_notification(@_);
  my $res = $self->_do_request($req);
  return $res if delete $res->{connection_error};
  
  return $self->parse_response($res);
}

sub _do_request {
  my ($self, $req) = @_;
  my $ua;
  
  unless ($ua = $self->{ua}) {
    $self->{ua} = $ua = LWP::UserAgent->new;
    $ua->env_proxy;
    $ua->agent("WebService::Notifo $VERSION");
  }
  
  return ...;
}

1;

__END__
=pod

=head1 NAME

WebService::Notifo - client for the Notifo.com API

=head1 VERSION

version 0.001

=head1 AUTHOR

Pedro Melo <melo@simplicidade.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Pedro Melo.

This is free software, licensed under:

  The Artistic License 2.0

=cut

