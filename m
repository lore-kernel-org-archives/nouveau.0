From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97065] memory leak under Xwayland with old sdl1
	applications
Date: Sun, 24 Jul 2016 13:02:08 +0000
Message-ID: <bug-97065-8800-UgzxnJuLhg@http.bugs.freedesktop.org/>
References: <bug-97065-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2066026593=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97065-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2066026593==
Content-Type: multipart/alternative; boundary="14693653282.cFeCc5.24265";
 charset="UTF-8"


--14693653282.cFeCc5.24265
Date: Sun, 24 Jul 2016 13:02:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97065

--- Comment #3 from Hussam Al-Tayeb <me-rYJ0iO+mrgIiq3RsQ1AnAw@public.gmane.org> ---
Created attachment 125289
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125289&action=3Dedit
forth memory map of xwayland process

Note that after exiting eveything, memory is not recovered.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693653282.cFeCc5.24265
Date: Sun, 24 Jul 2016 13:02:08 +0000
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
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065">bug 97065<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;hussam.eu.org" title=3D"Hussam Al-Tayeb &lt;me&#64;hussam.eu.org&gt;=
"> <span class=3D"fn">Hussam Al-Tayeb</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125289=
" name=3D"attach_125289" title=3D"forth memory map of xwayland process">att=
achment 125289</a> <a href=3D"attachment.cgi?id=3D125289&amp;action=3Dedit"=
 title=3D"forth memory map of xwayland process">[details]</a></span>
forth memory map of xwayland process

Note that after exiting eveything, memory is not recovered.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693653282.cFeCc5.24265--

--===============2066026593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2066026593==--
