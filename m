From: Jan Kiszka <jan.kiszka-S0/GAf8tV78@public.gmane.org>
Subject: Re: Low power operational mode of nv50
Date: Sat, 22 Jan 2011 13:38:40 +0100
Message-ID: <4D3ACFD0.6000000@web.de>
References: <4D3ABBD6.1070509@web.de> <4D3AC448.5040200@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1660535414=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D3AC448.5040200-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1660535414==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig0F082D0F56E9B8356D36B322"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig0F082D0F56E9B8356D36B322
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

[please keep me on CC]

On 2011-01-22 12:49, Martin Peres wrote:
> Le 22/01/2011 12:13, Jan Kiszka a =E9crit :
>> Hi,
>>
>> what are the missing bits to get nv50-class hardware into lowest power=

>> mode? Even when clocking down to perflvl 0, the GPU temperature of my
>> Quadro FX 880M is still quickly climbing until it reaches 60 =B0C and =
the
>> fan goes on for a while (I tried up to 2.6.38-rc1 so far - any progres=
s
>> in nouveau-next?). This is not only annoying but also sucking several
>> watts more than what is feasible - unfortunate for mobile operation.
>>
>> The benchmark is still the blob which runs the card at level 0 around =
54
>> =B0C, and that means fan-less. But as the blob is causing increasing
>> troubles across suspend/resume, not to speak of all its other
>> limitations. So I'd rather like to switch ASAP now.
>>
>> What may cause this different power consumption? As the clocking is
>> apparently the same (the blob even claims to use a few more MHz), I wa=
s
>> wondering if the less sophisticated firmware of nouveau could be the
>> reason. Or is the host driver keeping the GPU too busy even in idle
>> state?
>>
>> Is there anything I could do to help analyzing or even resolving this
>> issue?
>>
>> Thanks,
>> Jan
> Hi,
>=20
> To put it simply, I have no idea :s I spotted some strange behaviour
> (that could indicate some power management) when tracing the kernel but=

> my attempts to mimic it led to ..... 0.1W less (I guess it's just noise=
).

Yeah, I think we are looking something like 3-5 Watt.

>=20
> I must admit I'm not working enough on it yet, this is because I would
> like to get safe recloking and fan management out of the door before
> looking at real power management,

I agree that being able to safely switch between power modes is
important. But, at least for the rather common mobile scenarios, it is
first of all important to have acceptable 2D support (I think that's
already the case) which does not suck your battery and steal your nerves
via noisy fans. And that's still preventing me to switch.

> but if you have some knowledge in the
> field, I would love if you could give me a hand on this :)

Yet I do not know much about the nouveau or the hardware it drives. But
I'm not really unfamiliar with messing around in drivers and kernels. So
if you tell me what might be worth looking at or trying out...

>=20
> I'm pretty sure the difference in power consumption is due to un-needed=

> engines running. I may have a look at it this week as I'll be away from=

> my desktop computer.
>=20
> Anyway, I'll be in Germany next week, are you living close to Bochum? W=
e
> could talk about this if you want/can.

Not really close: Munich. Guess we have to stick with email or chat. :)

Thanks,
Jan



--------------enig0F082D0F56E9B8356D36B322
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk06z9UACgkQitSsb3rl5xQGiwCfSxEkMGOU4lzT/k0ZWkskSipa
E5gAoJxBcn3YhBUAhR+w1e3ZdfOz088P
=nQap
-----END PGP SIGNATURE-----

--------------enig0F082D0F56E9B8356D36B322--

--===============1660535414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1660535414==--
