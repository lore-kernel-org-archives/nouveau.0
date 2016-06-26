From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Sun, 26 Jun 2016 11:00:32 +0000
Message-ID: <bug-94990-8800-qzCXVrqWh9@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1070190698=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1070190698==
Content-Type: multipart/alternative; boundary="14669388332.A12C72.28360";
 charset="UTF-8"


--14669388332.A12C72.28360
Date: Sun, 26 Jun 2016 11:00:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #34 from h.habighorst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org <h.habighorst@googlemail.c=
om> ---
Created attachment 124724
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124724&action=3Dedit
dmesg for latest linux-next + patches for secboot

Found these patches on the mailing list, thought I could try it out, but no
luck.

https://lists.freedesktop.org/archives/nouveau/2016-June/025336.html

I've appended the dmesg, the kernel source was linux-next as of 2016-06-24 =
with
the patches mentioned applied.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14669388332.A12C72.28360
Date: Sun, 26 Jun 2016 11:00:33 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c34">Commen=
t # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
h.habighorst&#64;googlemail.com" title=3D"h.habighorst&#64;googlemail.com &=
lt;h.habighorst&#64;googlemail.com&gt;"> <span class=3D"fn">h.habighorst&#6=
4;googlemail.com</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124724=
" name=3D"attach_124724" title=3D"dmesg for latest linux-next + patches for=
 secboot">attachment 124724</a> <a href=3D"attachment.cgi?id=3D124724&amp;a=
ction=3Dedit" title=3D"dmesg for latest linux-next + patches for secboot">[=
details]</a></span>
dmesg for latest linux-next + patches for secboot

Found these patches on the mailing list, thought I could try it out, but no
luck.

<a href=3D"https://lists.freedesktop.org/archives/nouveau/2016-June/025336.=
html">https://lists.freedesktop.org/archives/nouveau/2016-June/025336.html<=
/a>

I've appended the dmesg, the kernel source was linux-next as of 2016-06-24 =
with
the patches mentioned applied.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14669388332.A12C72.28360--

--===============1070190698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1070190698==--
