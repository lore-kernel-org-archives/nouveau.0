From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97537] nvc0 occasionally crashes in glDrawArrays in
 a multi-threaded/multi-context app
Date: Thu, 01 Sep 2016 17:05:00 +0000
Message-ID: <bug-97537-8800-YQTeNAwqoG@http.bugs.freedesktop.org/>
References: <bug-97537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1092429384=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1092429384==
Content-Type: multipart/alternative; boundary="14727494990.a7E62fCc1.22775";
 charset="UTF-8"


--14727494990.a7E62fCc1.22775
Date: Thu, 1 Sep 2016 17:04:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97537

--- Comment #3 from shinji.suzuki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I managed to have glxinfo run with newly built libs through the use of
LIBGL_DRIVERS_PATH and LD_LIBRARY_PATH env-vars. But once I copy them to the
system dir (/usr/lib/x86_64_linux_gnu/{|mesa|dri}) and reboot then ibus-ui-=
gtk3
fails to load due to segfault. Since the libs also have an issue that glxin=
fo
shows incorrect values for "Max core profile version" and "Max compat profi=
le
version", "OpenGL shading language version string", I guess I'd give Ubuntu
16.10 a try.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14727494990.a7E62fCc1.22775
Date: Thu, 1 Sep 2016 17:04:59 +0000
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
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded/multi-context app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded/multi-context app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537">bug 97537<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shinji.suzuki&#64;gmail.com" title=3D"shinji.suzuki&#64;gmail.com">shinji.s=
uzuki&#64;gmail.com</a>
</span></b>
        <pre>I managed to have glxinfo run with newly built libs through th=
e use of
LIBGL_DRIVERS_PATH and LD_LIBRARY_PATH env-vars. But once I copy them to the
system dir (/usr/lib/x86_64_linux_gnu/{|mesa|dri}) and reboot then ibus-ui-=
gtk3
fails to load due to segfault. Since the libs also have an issue that glxin=
fo
shows incorrect values for &quot;Max core profile version&quot; and &quot;M=
ax compat profile
version&quot;, &quot;OpenGL shading language version string&quot;, I guess =
I'd give Ubuntu
16.10 a try.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14727494990.a7E62fCc1.22775--

--===============1092429384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1092429384==--
