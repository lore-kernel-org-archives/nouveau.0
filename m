From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111371] [NV04] bios OOB on kernel driver
 initialization
Date: Mon, 12 Aug 2019 03:40:13 +0000
Message-ID: <bug-111371-8800-WWp72hyeQv@http.bugs.freedesktop.org/>
References: <bug-111371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196482926=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0196482926==
Content-Type: multipart/alternative; boundary="15655812130.DC97BC.23488"
Content-Transfer-Encoding: 7bit


--15655812130.DC97BC.23488
Date: Mon, 12 Aug 2019 03:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #12 from Jorge Natz <jorgenatzdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Actually, please ask if you would like another VBIOS dump. Sorry about that.

With the workaround-compiled module, the screen turns black, then a series =
of
messages appear on the console, seeming to be the lines in dmesg that start
with "BUG: unable to handle kernel NULL pointer dereference at 00000004" and
end with "CR0: 80050033 CR2: 00000004 CR3: 03304000 CR4: 000006d0". The scr=
een
then turns black again when X is started and does not revert back to consol=
e,
although this may just be an incorrect X configuration on my part.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655812130.DC97BC.23488
Date: Mon, 12 Aug 2019 03:40:13 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jorgenatzdev&#64;gmail.com" title=3D"Jorge Natz &lt;jorgenatzdev&#64;gmail.=
com&gt;"> <span class=3D"fn">Jorge Natz</span></a>
</span></b>
        <pre>Actually, please ask if you would like another VBIOS dump. Sor=
ry about that.

With the workaround-compiled module, the screen turns black, then a series =
of
messages appear on the console, seeming to be the lines in dmesg that start
with &quot;BUG: unable to handle kernel NULL pointer dereference at 0000000=
4&quot; and
end with &quot;CR0: 80050033 CR2: 00000004 CR3: 03304000 CR4: 000006d0&quot=
;. The screen
then turns black again when X is started and does not revert back to consol=
e,
although this may just be an incorrect X configuration on my part.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655812130.DC97BC.23488--

--===============0196482926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0196482926==--
