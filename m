From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Thu, 18 Aug 2016 19:05:21 +0000
Message-ID: <bug-93887-8800-pgyX3O1png@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1785223424=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1785223424==
Content-Type: multipart/alternative; boundary="14715471212.1235dE7bF.25993";
 charset="UTF-8"


--14715471212.1235dE7bF.25993
Date: Thu, 18 Aug 2016 19:05:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93887

--- Comment #51 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 125886
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125886&action=3Dedit
nvapeek 0x610000 0x20000 - after plain blackscreening s2ram - without nouve=
au
module loaded

I just forgot about https://bugzilla.kernel.org/show_bug.cgi?id=3D117581. It
appears to have stayed the same (blackscreening unless no_console_suspend is
given). Perhaps that parameter would also have saved me from changing my
H265/H270 with nouveau; gonna re-test with no_console_suspend now ...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14715471212.1235dE7bF.25993
Date: Thu, 18 Aug 2016 19:05:21 +0000
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
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887#c51">Commen=
t # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887">bug 93887<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125886=
" name=3D"attach_125886" title=3D"nvapeek 0x610000 0x20000 - after plain bl=
ackscreening s2ram - without nouveau module loaded">attachment 125886</a> <=
a href=3D"attachment.cgi?id=3D125886&amp;action=3Dedit" title=3D"nvapeek 0x=
610000 0x20000 - after plain blackscreening s2ram - without nouveau module =
loaded">[details]</a></span>
nvapeek 0x610000 0x20000 - after plain blackscreening s2ram - without nouve=
au
module loaded

I just forgot about <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D117581">https://bugzilla.kernel.org/show_bug.cgi?id=3D117581</a>. It
appears to have stayed the same (blackscreening unless no_console_suspend is
given). Perhaps that parameter would also have saved me from changing my
H265/H270 with nouveau; gonna re-test with no_console_suspend now ...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14715471212.1235dE7bF.25993--

--===============1785223424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1785223424==--
