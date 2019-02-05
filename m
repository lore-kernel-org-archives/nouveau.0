From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107919] RandR unable to set Screen Size when using
 Intel+nouveau
Date: Tue, 05 Feb 2019 13:13:58 +0000
Message-ID: <bug-107919-8800-Tggug9jz7I@http.bugs.freedesktop.org/>
References: <bug-107919-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0951538692=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107919-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0951538692==
Content-Type: multipart/alternative; boundary="15493724381.5809c61.5720"
Content-Transfer-Encoding: 7bit


--15493724381.5809c61.5720
Date: Tue, 5 Feb 2019 13:13:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107919

--- Comment #4 from main.haarp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Thanks for your reply, Ilia.

(In reply to Ilia Mirkin from comment #3)
> The intel max
> on IVB is most likely 8k, but having trouble confirming it.

This is correct, xrandr reports a maximum of 8192x8192.

However, when not using nouveau (i.e. this bug is not triggered), I'm getti=
ng
the error message

xrandr: screen cannot be larger than 8192x8192 (desired size 9999x9999)

While the error I'm getting when this bug is triggered is different:

X Error of failed request:  BadValue (integer parameter out of range for
operation)
  Major opcode of failed request:  139 (RANDR)
  Minor opcode of failed request:  7 (RRSetScreenSize)
  Value in failed request:  0x0
  Serial number of failed request:  57
  Current serial number in output stream:  58

It's also weird that something that shouldn't touch the FB, such as setting=
 a
primary output, also fails with this.


Another note: Before Nouveau, I ran the Nvidia card with the propietary dri=
ver
on a separate X server together with intel-virtual-output. i-v-o provides
virtual outputs on the Intel side and proxies them to the second X server.

While the performance was terrible (which is why I switched to
nouveau+provideroutputsource, thanks so much for creating Nouveau!), there =
were
no problems setting screen sizes. But maybe i-v-o also used some sort of ma=
gic.


> There's no real benefit to using nouveau ddx for the secondary screens, so
> you should also experiment with using modesetting for those.

Ah, I didn't know this was possible. I will of course lose the last remnant=
s of
rendering performance from the Nvidia, but if it allows monitors to work we=
ll,
that's worth it. I will try that once I have the time. I assume this will n=
ot
help with IVB's small FB, correct?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15493724381.5809c61.5720
Date: Tue, 5 Feb 2019 13:13:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RandR unable to set Screen Size when using Intel+nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107919#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RandR unable to set Screen Size when using Intel+nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107919">bug 10791=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
main.haarp&#64;gmail.com" title=3D"main.haarp&#64;gmail.com">main.haarp&#64=
;gmail.com</a>
</span></b>
        <pre>Thanks for your reply, Ilia.

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D107919#c3">comme=
nt #3</a>)
<span class=3D"quote">&gt; The intel max
&gt; on IVB is most likely 8k, but having trouble confirming it.</span >

This is correct, xrandr reports a maximum of 8192x8192.

However, when not using nouveau (i.e. this bug is not triggered), I'm getti=
ng
the error message

xrandr: screen cannot be larger than 8192x8192 (desired size 9999x9999)

While the error I'm getting when this bug is triggered is different:

X Error of failed request:  BadValue (integer parameter out of range for
operation)
  Major opcode of failed request:  139 (RANDR)
  Minor opcode of failed request:  7 (RRSetScreenSize)
  Value in failed request:  0x0
  Serial number of failed request:  57
  Current serial number in output stream:  58

It's also weird that something that shouldn't touch the FB, such as setting=
 a
primary output, also fails with this.


Another note: Before Nouveau, I ran the Nvidia card with the propietary dri=
ver
on a separate X server together with intel-virtual-output. i-v-o provides
virtual outputs on the Intel side and proxies them to the second X server.

While the performance was terrible (which is why I switched to
nouveau+provideroutputsource, thanks so much for creating Nouveau!), there =
were
no problems setting screen sizes. But maybe i-v-o also used some sort of ma=
gic.


<span class=3D"quote">&gt; There's no real benefit to using nouveau ddx for=
 the secondary screens, so
&gt; you should also experiment with using modesetting for those.</span >

Ah, I didn't know this was possible. I will of course lose the last remnant=
s of
rendering performance from the Nvidia, but if it allows monitors to work we=
ll,
that's worth it. I will try that once I have the time. I assume this will n=
ot
help with IVB's small FB, correct?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15493724381.5809c61.5720--

--===============0951538692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0951538692==--
