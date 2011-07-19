From: Francisco Jerez <currojerez@riseup.net>
Subject: Re: [Nouveau] RFC: ctx->Driver.Map/UnmapTextureImage()
	hooks
Date: Tue, 19 Jul 2011 17:12:50 +0200
Message-ID: <87oc0qz4lp.fsf@riseup.net>
References: <4E03E3A3.8060903@vmware.com>
	<CAEUUzO-6YH3YmtzWxfM=Sn3YT+ndDHJxy1bjff0+f_qd8yj_jA@mail.gmail.com>
	<CAPM=9twbNrhH+5CFO38UvVOTgMHzMHEfBfRosPGo0=NCN-HaOg@mail.gmail.com>
	<4E208571.90805@vmware.com> <20110715235911.6d2ff4f0@farn.lan>
	<4E243E8D.2030605@vmware.com> <20110718220022.4231f6ac@farn>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737791750=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <20110718220022.4231f6ac@farn> (Pekka Paalanen's message of "Mon,
	18 Jul 2011 22:00:22 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Brian Paul <brianp@vmware.com>
Cc: mesa-dev <mesa-dev@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1737791750==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Pekka Paalanen <pq@iki.fi> writes:

> On Mon, 18 Jul 2011 08:09:17 -0600
> Brian Paul <brianp@vmware.com> wrote:
>
>> On 07/15/2011 02:59 PM, Pekka Paalanen wrote:
>> > On Fri, 15 Jul 2011 12:22:41 -0600
>> > Brian Paul<brianp@vmware.com>  wrote:
>> >
>> >> On 07/15/2011 10:07 AM, Dave Airlie wrote:
>> >>> On Fri, Jul 15, 2011 at 4:10 AM, Brian
>> >>> Paul<brian.e.paul@gmail.com>   wrote:
>> >>>>
>> >>>>
>> >>>> The map-texture-image-v4 branch that I just pushed implements
>> >>>> this change.  It really cleaned things up for the better and
>> >>>> will lead to a few more follow-on improvements.
>> >>>>
>> >>>> There's no obvious regressions with swrast or the gallium
>> >>>> drivers.  I updated the intel driver code and tested i915 and
>> >>>> it seems OK too, but I didn't do a full piglit run on it.  I
>> >>>> also updated the legacy r600 driver in case anyone cares but
>> >>>> didn't do any testing of it.
>> >>>>
>> >>>> I didn't update any of the other legacy DRI drivers.  Would
>> >>>> anyone object if we simply stop building mach64, r128,
>> >>>> unichrome, sis, etc? I'd be happy to remove those drivers
>> >>>> altogether for that matter.
>> >>>
>> >>> we could EOL those in 7.11, and if anyone wants to ship them,
>> >>> they can just build 7.11 for them.
>> >>
>> >> Sounds good to me.  I think we'd only keep the swrast, intel
>> >> and maybe r300/r600 drivers.  Opinions?
>> >
>> > Um, don't kill nouveau_vieux, please.
>>=20
>> Does the old nouveau driver support some GPUs that the gallium=20
>> nv50/nvc0 drivers don't support?
>
> Yes. Like Corbin said, 'nouveau_vieux' is for NV04-NV2x, while
> the gallium driver 'nouveau' supports NV30 and later.
> http://nouveau.freedesktop.org/wiki/MesaDrivers
>
I run a couple of machines with that driver and have to disagree with
that decision as well.

>> If we want to keep the older driver someone will need to
>> volunteer to update the code to support the new driver hooks.
>
> Sorry, I cannot promise that.
> Nouveau_vieux seems to have been missing a maintainer for
> some time now.
>
That would be me. I admit that because of personal/work reasons I've had
to keep myself somewhat out of the loop during the last couple of
months, that doesn't mean that I've disappeared or stopped answering my
mail.

Coincidentally nouveau's texture handling has always been structured
around two teximage map/unmap hooks (e.g. compare nouveau_teximage() and
the look of _mesa_store_teximage2d() after the API change), and AFAICT
the changes would be for the most part trivial, but still, if no-one
else wants or knows how to do it (isn't fixing up the drivers the
responsibility of whoever changes the API?), I'll get back to it as soon
as I can.

>
> Thanks.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk4lnvMACgkQg5k4nX1Sv1tCzgD/eu3wxgo46nt8qOuxgDOHj0li
S78KMe9Pu/ScEvkGPKUA/jyXuDbvareq2DMIB7SBRBsJyhzSbBfbCG51i0o97pr/
=pTCc
-----END PGP SIGNATURE-----
--==-=-=--

--===============1737791750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1737791750==--
