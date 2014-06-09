From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79820] [NVE6] Strange readout on fan1_input when
	pwm1_min < 33
Date: Mon, 09 Jun 2014 17:15:24 +0000
Message-ID: <bug-79820-8800-vpPUT9KNsW@http.bugs.freedesktop.org/>
References: <bug-79820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848736305=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1848736305==
Content-Type: multipart/alternative; boundary="1402334124.34De17531.21880"; charset="us-ascii"


--1402334124.34De17531.21880
Date: Mon, 9 Jun 2014 17:15:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79820

--- Comment #5 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #2)
> With nouveau loaded, can you grab vbios from
> /sys/kernel/debug/dri/0/vbios.rom? Or use -s prom with nvagetbios?

I just pushed a patch to nvagetbios to suggest to use -s prom when the
signature is invalid. Let's stop wasting time suggesting this.

>=20
> It's moderately likely that the reported fan rpm is just 2x what it should
> be -- did the fan sound louder with nouveau than with the blob? See
> http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=3De3601d0869a18acc19e58f2d1216b810632d75f0 (which will be in 3.16-rc1=
).

Yes, this is likely the problem here.

>=20
> Martin -- any idea about the weird RPMs reported for the lower values?

It probably is a bouncing problem of the Hall effect sensor. This one may n=
ot
have a proper hysteresis cycle which leads to an unstable signal during the
transition phases. The longer the transition takes, the more un-wanted
oscillation is introduced. It is possible that the fan manufacturer added a
low-pass filter on the fan that only works down to the minimum speed (35%) =
and
fails to clean up the signal after that.

In any case, this is not our bug unless nvidia is able to cope with it (whi=
ch
is impossible to test with the coolbits since they don't allow a fan speed
lower than the minimum speed). I could edit the vbios to change the minimum
speed limit and ask you to re-upload it and check if nvidia yields the same
result. Would you be interested in doing that?

(In reply to comment #3)
> The noise didn=E2=80=99t really noticeably increase. And I just checked t=
he values
> reported by nvidia-settings. When idle, these always seem to jump in
> increments of 30 RPM (usually between 1050 and 1080). With nouveau, the
> output value jumps in increments of 60 RPM, so you are probably right and
> the difference is only nominal.

Perfect! Thank you :)

>=20
> In any case, I=E2=80=99m attaching the BIOS file obtained from nvagetbios=
 -s prom.
> No warnings were reported this time.

Thanks, but I don't think it will be necessary...

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402334124.34De17531.21880
Date: Mon, 9 Jun 2014 17:15:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &l=
t; 33"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79820#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &l=
t; 33"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79820">bug 79820<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;ensi-bourges.fr" title=3D"Martin Peres &lt;martin.peres&#6=
4;ensi-bourges.fr&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D79820#c2">comment #2=
</a>)
<span class=3D"quote">&gt; With nouveau loaded, can you grab vbios from
&gt; /sys/kernel/debug/dri/0/vbios.rom? Or use -s prom with nvagetbios?</sp=
an >

I just pushed a patch to nvagetbios to suggest to use -s prom when the
signature is invalid. Let's stop wasting time suggesting this.

<span class=3D"quote">&gt;=20
&gt; It's moderately likely that the reported fan rpm is just 2x what it sh=
ould
&gt; be -- did the fan sound louder with nouveau than with the blob? See
&gt; <a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/">http=
://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=3De3601d0869a18acc19e58f2d1216b810632d75f0 (which will be in 3.16-=
rc1).</span >

Yes, this is likely the problem here.

<span class=3D"quote">&gt;=20
&gt; Martin -- any idea about the weird RPMs reported for the lower values?=
</span >

It probably is a bouncing problem of the Hall effect sensor. This one may n=
ot
have a proper hysteresis cycle which leads to an unstable signal during the
transition phases. The longer the transition takes, the more un-wanted
oscillation is introduced. It is possible that the fan manufacturer added a
low-pass filter on the fan that only works down to the minimum speed (35%) =
and
fails to clean up the signal after that.

In any case, this is not our bug unless nvidia is able to cope with it (whi=
ch
is impossible to test with the coolbits since they don't allow a fan speed
lower than the minimum speed). I could edit the vbios to change the minimum
speed limit and ask you to re-upload it and check if nvidia yields the same
result. Would you be interested in doing that?

(In reply to <a href=3D"show_bug.cgi?id=3D79820#c3">comment #3</a>)
<span class=3D"quote">&gt; The noise didn=E2=80=99t really noticeably incre=
ase. And I just checked the values
&gt; reported by nvidia-settings. When idle, these always seem to jump in
&gt; increments of 30 RPM (usually between 1050 and 1080). With nouveau, the
&gt; output value jumps in increments of 60 RPM, so you are probably right =
and
&gt; the difference is only nominal.</span >

Perfect! Thank you :)

<span class=3D"quote">&gt;=20
&gt; In any case, I=E2=80=99m attaching the BIOS file obtained from nvagetb=
ios -s prom.
&gt; No warnings were reported this time.</span >

Thanks, but I don't think it will be necessary...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402334124.34De17531.21880--

--===============1848736305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1848736305==--
