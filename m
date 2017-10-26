From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] [NVC0/GF108] fifo: read fault at cd90f4d000
 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on
 channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 17:13:59 +0000
Message-ID: <bug-103467-8800-5pWoOdyd8x@http.bugs.freedesktop.org/>
References: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0545575973=="
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


--===============0545575973==
Content-Type: multipart/alternative; boundary="15090380391.c775.26224";
 charset="UTF-8"


--15090380391.c775.26224
Date: Thu, 26 Oct 2017 17:13:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

--- Comment #11 from erhard_f-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org ---
Created attachment 135083
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135083&action=3Dedit
journalctl -b output with nouveau.debug=3Dtrace

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090380391.c775.26224
Date: Thu, 26 Oct 2017 17:13:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">bug 10346=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135083=
" name=3D"attach_135083" title=3D"journalctl -b output with nouveau.debug=
=3Dtrace">attachment 135083</a> <a href=3D"attachment.cgi?id=3D135083&amp;a=
ction=3Dedit" title=3D"journalctl -b output with nouveau.debug=3Dtrace">[de=
tails]</a></span>
journalctl -b output with nouveau.debug=3Dtrace</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090380391.c775.26224--

--===============0545575973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0545575973==--
