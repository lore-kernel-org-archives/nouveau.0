From: Marko Schuetz-Schmuck <MarkoSchuetz-S0/GAf8tV78@public.gmane.org>
Subject: Re: trouble connecting to Panduit VGA adapter
Date: Tue, 12 Sep 2017 10:47:30 -0400
Message-ID: <87377sc6t9.fsf@tpad-m.i-did-not-set--mail-host-address--so-tickle-me>
References: <8760d2l5wb.fsf@tpad-m.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKb7Uvg37iJGwzCZZyJHzSRNb=KHAtDjHutzdWB=gjr0JTe9bQ@mail.gmail.com>
 <87tw0ik2um.fsf@tpad-m.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKb7Uvi62si1di1WCKCM0b9hD_yHBSvQsQKsPiOfAjX2gV3Ytw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647245326=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi62si1di1WCKCM0b9hD_yHBSvQsQKsPiOfAjX2gV3Ytw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1647245326==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:

> Does v4.13 fix your issues? v4.10 also included significant rework
> related to DP-MST, and I wouldn't be surprised if it fixed a few DP
> issues along the way. (Also, please don't drop the list from your
> replies.)

With v4.13 the laptop screen goes black after modprobe nouveau

> On Mon, Sep 4, 2017 at 9:30 AM, Marko Schuetz-Schmuck
> <MarkoSchuetz-S0/GAf8tV78@public.gmane.org> wrote:
>> I'm running 4.9.43-1-MANJARO
>>
>> Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:
>>
>>> Are you running a v4.12-based kernel? If so, update to v4.13-rcN or
>>> integrate https://github.com/skeggsb/linux/commit/13a86519202c5d119d836=
40d6f781f3181205d2c
>>> into your kernel build.
>>>
>>> On Fri, Sep 1, 2017 at 12:50 PM, Marko Schuetz-Schmuck
>>> <MarkoSchuetz-S0/GAf8tV78@public.gmane.org> wrote:
>>>> I want to connect to an InFocus projector that sits behind a Panduit V=
GA
>>>> adapter. I use a Thinkpad P51 with a mini display-port to VGA
>>>> converter. The laptop runs Manjaro and has the
>>>> video-hybrid-intel-nouveau-prime installed and it works with other
>>>> monitors. For some reason it does not detect the projector that is
>>>> connected through the Panduit. The keyboard shortcut to switch monitor
>>>> configuration says "No External Display". xrandr reports only the
>>>> built-in screen.
>>>>
>>>> I talked to the technician for the room installation and he told me th=
at
>>>> he had seen this before on a Ubuntu machine and that switching to the
>>>> proprietary nvidia driver solved that problem. For various reasons I'd
>>>> rather not switch to that driver.
>>>>
>>>> I also found some lines with "DRM: DDC responded, but no EDID for DP-1"
>>>> in them from around the time I tried connecting to the projector. Could
>>>> they be related?
>>>>
>>>> Is there some setting or configuration that can help in this case?
>>>>
>>>> Best regards,
>>>>
>>>> Marko
>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>>
>>
>> --
>> Prof. Dr. Marko Sch=C3=BCtz-Schmuck
>> Department of Mathematical Sciences
>> University of Puerto Rico at Mayag=C3=BCez
>> Mayag=C3=BCez, PR 00681

=2D-=20
Prof. Dr. Marko Sch=C3=BCtz-Schmuck
Department of Mathematical Sciences
University of Puerto Rico at Mayag=C3=BCez
Mayag=C3=BCez, PR 00681

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTovfrETQc10zr+ME0PTg+AoZH0KgUCWbfzggAKCRAPTg+AoZH0
KtHiAKCJwwb2sk4rGVwIEHWPqHz7Hb3ULQCeN154giAqQA14hCYxm5e1H+1FtfI=
=/Hxl
-----END PGP SIGNATURE-----
--=-=-=--

--===============1647245326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1647245326==--
