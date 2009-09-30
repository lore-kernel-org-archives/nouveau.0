From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: fd.o services outage, annarchy $HOME lost
Date: Wed, 30 Sep 2009 15:34:47 -0700
Message-ID: <20090930223447.GA2488@tempa.pdx.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0754845049=="
Return-path: <xorg-devel-bounces-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/listinfo/xorg-devel>,
	<mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-devel>
List-Post: <mailto:xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-devel>,
	<mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: xorg-devel-bounces-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-devel-bounces-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: geoclue-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dbus-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, poppler-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xdg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devkit-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xorg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, telepathy-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, packagekit-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0754845049==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
Cutting and pasting from my blog entry[0] because I'm lazy:

> As ajax quite elegantly summed up[1], due to a series of catastrophic
> power failures at PSU, where fd.o is hosted, we were down for a good
> chunk of yesterday. Despite the machines having redundant power
> supplies, being connected to separate power rails in the rack, which
> were hooked up to independent, UPS-backed, power supplies, we still
> (like a good chunk of Portland, and certainly everyone in the PSU
> machine room) lost our power.
>=20
> As far as we can tell, when annarchy.fd.o (websites, people.fd.o, cgit,
> anongit, et al) came back up, power was again interrupted while the
> ext3 journal was being replayed. When it came up the n'th time, fsck
> dumped almost the entire filesystem in lost+found, then started saying
> increasingly unhappy things about the state of the filesystem on its
> second pass. In the end, we just went with mkfs, and now we have a
> brand new and shiny filesystem.
>=20
> It's worth pointing out that even if this was another filesystem, such
> as /srv, which hosts all project data, we would've been fine, as
> they're all backed up. But, unfortunately for some, we made a decision
> a while ago to not back /home up, and didn't advertise that as widely as
> we should have. So, if you had stuff in annarchy:/home, it's now gone,
> and I hope you have backups.
>=20
> Sorry about that. On the upside, I got to see PSU's new and really very
> nice machine room this morning, thanks to XDC being about 250m away
> from the PSU machine room, and fd.o is otherwise running fine. We've
> been talking this week about replacing our ageing hardware, which would
> also allow for more redundancy as well as better performance from those
> machines. But we still have no plans to back up /home, so if you put
> stuff there, please, please keep your own backups (or make sure the
> Wayback Machine knows about it).=20

Again, please accept our apologies.  The decision was made a long time
ago to not back up $HOME, and it was mentioned a few times, but
certainly not documented nearly as widely as it should've been (i.e.
shouted from the rooftops), given that a few people have lost data and
been upset about it.

The plan for when we get new hardware is to run the old hardware as
redundant backups, with regular rsyncs, so we can fail over and have
less downtime, as well as have a backup (of sorts) of $HOME.

Hopefully this doesn't put you guys out too much, and thanks for your
understanding.

Cheers,
Daniel

[1]: http://ajaxxx.livejournal.com/62015.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrD3QcACgkQUVYB1rKAgJQ0lQCfaHS2i2NSrbbxHN03QMf6+c2Q
2swAnRIlzhG64kn7sGyYd5iD25ZTwAXh
=hMch
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============0754845049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
xorg-devel mailing list
xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
http://lists.x.org/mailman/listinfo/xorg-devel

--===============0754845049==--
