From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105629] WebGL shader regular update crashes nouveau
 driver 17.3.3
Date: Fri, 23 Mar 2018 10:30:40 +0000
Message-ID: <bug-105629-8800-JNP4O5QSZd@http.bugs.freedesktop.org/>
References: <bug-105629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187234887=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1187234887==
Content-Type: multipart/alternative; boundary="15218010400.2F4f3f4.1676"
Content-Transfer-Encoding: 7bit


--15218010400.2F4f3f4.1676
Date: Fri, 23 Mar 2018 10:30:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105629

--- Comment #5 from Hugues Evrard <hugues.evrard-/thXhF8rKSFInJN2fRTu8g@public.gmane.org> ---
Created attachment 138308
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138308&action=3Dedit
Longer dmesg log showing chrome errors

Add a new attachment: longer dmesg trace which shows many duplicate of this
Chrome error just before reporting the segfault in nouveau:

[ 5188.843931] nouveau 0000:01:00.0: chromium-browse[8083]: Unknown handle
0x00000000
[ 5188.843935] nouveau 0000:01:00.0: chromium-browse[8083]: validate_init
[ 5188.843936] nouveau 0000:01:00.0: chromium-browse[8083]: validate: -2
[... the above repeated many times ...]
[ 5195.280913] chromium-browse[8083]: segfault at 4b0 ip 00007f9620a5fd73 sp
00007fffb5af7bc0 error 4 in libdrm_nouveau.so.2.0.0[7f9620a5d000+7000]

Given that I cannot reproduce on Firefox, could it be the case that it is a
Chrome issue?

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15218010400.2F4f3f4.1676
Date: Fri, 23 Mar 2018 10:30:40 +0000
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
   title=3D"NEW - WebGL shader regular update crashes nouveau driver 17.3.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105629#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WebGL shader regular update crashes nouveau driver 17.3.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105629">bug 10562=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hugues.evrard&#64;graphicsfuzz.com" title=3D"Hugues Evrard &lt;hugues.evrar=
d&#64;graphicsfuzz.com&gt;"> <span class=3D"fn">Hugues Evrard</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138308=
" name=3D"attach_138308" title=3D"Longer dmesg log showing chrome errors">a=
ttachment 138308</a> <a href=3D"attachment.cgi?id=3D138308&amp;action=3Dedi=
t" title=3D"Longer dmesg log showing chrome errors">[details]</a></span>
Longer dmesg log showing chrome errors

Add a new attachment: longer dmesg trace which shows many duplicate of this
Chrome error just before reporting the segfault in nouveau:

[ 5188.843931] nouveau 0000:01:00.0: chromium-browse[8083]: Unknown handle
0x00000000
[ 5188.843935] nouveau 0000:01:00.0: chromium-browse[8083]: validate_init
[ 5188.843936] nouveau 0000:01:00.0: chromium-browse[8083]: validate: -2
[... the above repeated many times ...]
[ 5195.280913] chromium-browse[8083]: segfault at 4b0 ip 00007f9620a5fd73 sp
00007fffb5af7bc0 error 4 in libdrm_nouveau.so.2.0.0[7f9620a5d000+7000]

Given that I cannot reproduce on Firefox, could it be the case that it is a
Chrome issue?</pre>
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

--15218010400.2F4f3f4.1676--

--===============1187234887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1187234887==--
