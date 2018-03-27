From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Tue, 27 Mar 2018 02:26:44 +0000
Message-ID: <bug-91954-8800-YnxEOMHZHH@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618074550=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0618074550==
Content-Type: multipart/alternative; boundary="15221176041.40dd.643"
Content-Transfer-Encoding: 7bit


--15221176041.40dd.643
Date: Tue, 27 Mar 2018 02:26:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91954

--- Comment #12 from Dan Callaghan <djc-vNUPr3c+39GHXe+LvDLADg@public.gmane.org> ---
I'm no longer seeing this issue with the 4.15.10-200.fc26 kernel in Fedora.

When the monitor goes to sleep, and I wake it back up, I still see two kern=
el
messages like this:

nouveau 0000:03:00.0: disp: outp 02:0006:0f42: training failed
nouveau 0000:03:00.0: disp: outp 02:0006:0f42: training failed

but it seems that nouveau recovers regardless. My X display comes back and
everything keeps working.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15221176041.40dd.643
Date: Tue, 27 Mar 2018 02:26:44 +0000
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
   title=3D"NEW - &quot;link training failed&quot;: nouveau does not recove=
r from monitor suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91954#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;link training failed&quot;: nouveau does not recove=
r from monitor suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91954">bug 91954<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
djc&#64;djc.id.au" title=3D"Dan Callaghan &lt;djc&#64;djc.id.au&gt;"> <span=
 class=3D"fn">Dan Callaghan</span></a>
</span></b>
        <pre>I'm no longer seeing this issue with the 4.15.10-200.fc26 kern=
el in Fedora.

When the monitor goes to sleep, and I wake it back up, I still see two kern=
el
messages like this:

nouveau 0000:03:00.0: disp: outp 02:0006:0f42: training failed
nouveau 0000:03:00.0: disp: outp 02:0006:0f42: training failed

but it seems that nouveau recovers regardless. My X display comes back and
everything keeps working.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15221176041.40dd.643--

--===============0618074550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0618074550==--
