From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] [NVC0/GF108] fifo: read fault at cd90f4d000
 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on
 channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 15:40:27 +0000
Message-ID: <bug-103467-8800-eGpWI87J7O@http.bugs.freedesktop.org/>
References: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1920215371=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103467-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1920215371==
Content-Type: multipart/alternative; boundary="15090324270.4C450B4C.3998";
 charset="UTF-8"


--15090324270.4C450B4C.3998
Date: Thu, 26 Oct 2017 15:40:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to erhard_f from comment #6)
> Created attachment 135072 [details]
> dmesg output with nouveau.debug=3Dtrace

And this one appears to *only* have logs at the debug level or something el=
se
odd. I'm not sure what you're doing ... but I just want the same output that
'dmesg' might output. I think you're fighting some logging system which thi=
nks
it knows better... I wish you the best of luck with that.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090324270.4C450B4C.3998
Date: Thu, 26 Oct 2017 15:40:27 +0000
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
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">bug 10346=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to erhard_f from <a href=3D"show_bug.cgi?id=3D103467=
#c6">comment #6</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D135072" name=3D"attach_135072" title=3D"dmesg output with nouveau.d=
ebug=3Dtrace">attachment 135072</a> <a href=3D"attachment.cgi?id=3D135072&a=
mp;action=3Dedit" title=3D"dmesg output with nouveau.debug=3Dtrace">[detail=
s]</a></span>
&gt; dmesg output with nouveau.debug=3Dtrace</span >

And this one appears to *only* have logs at the debug level or something el=
se
odd. I'm not sure what you're doing ... but I just want the same output that
'dmesg' might output. I think you're fighting some logging system which thi=
nks
it knows better... I wish you the best of luck with that.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090324270.4C450B4C.3998--

--===============1920215371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1920215371==--
