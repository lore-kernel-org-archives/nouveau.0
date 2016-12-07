From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] [NV30/NV40] nouveau/pushbuf.c:238:
 pushbuf_krel: Assertion `bkref` failed.
Date: Wed, 07 Dec 2016 15:26:35 +0000
Message-ID: <bug-94727-8800-Wdqg8l77Eu@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0907528344=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0907528344==
Content-Type: multipart/alternative; boundary="14811243951.AF6142d1.21749";
 charset="UTF-8"


--14811243951.AF6142d1.21749
Date: Wed, 7 Dec 2016 15:26:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #9 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
Created attachment 128368
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128368&action=3Dedit
Backtrace of Xwayland on a G71

Thanks for pointing out that it was on a G71, I have been able to reproduce
using my own old G71 (Dell m1710) with Fedora 25!

Didn't have much luck trying to run Xwayland through apitrace, but I have a
corefile of Xwayland, backtrace attached, if that's of any help...

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14811243951.AF6142d1.21749
Date: Wed, 7 Dec 2016 15:26:35 +0000
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
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128368=
" name=3D"attach_128368" title=3D"Backtrace of Xwayland on a G71">attachmen=
t 128368</a> <a href=3D"attachment.cgi?id=3D128368&amp;action=3Dedit" title=
=3D"Backtrace of Xwayland on a G71">[details]</a></span>
Backtrace of Xwayland on a G71

Thanks for pointing out that it was on a G71, I have been able to reproduce
using my own old G71 (Dell m1710) with Fedora 25!

Didn't have much luck trying to run Xwayland through apitrace, but I have a
corefile of Xwayland, backtrace attached, if that's of any help...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14811243951.AF6142d1.21749--

--===============0907528344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0907528344==--
