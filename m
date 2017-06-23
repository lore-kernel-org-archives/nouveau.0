From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101368] Nouveau regression GT218M in Kernel 4.11
	Won't Boot
Date: Fri, 23 Jun 2017 01:11:20 +0000
Message-ID: <bug-101368-8800-osQxf6AVpT@http.bugs.freedesktop.org/>
References: <bug-101368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1123106369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101368-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1123106369==
Content-Type: multipart/alternative; boundary="14981802793.cb5C14D98.20424";
 charset="UTF-8"


--14981802793.cb5C14D98.20424
Date: Fri, 23 Jun 2017 01:11:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101368

--- Comment #11 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Steel from comment #10)
> Thank you Mr. Coenen. I agree. Kernel 4.12.0-rc6 does not exhibit the
> problem on a Lenovo T510 either.
> Between a fix already in the pipeline and a modeset workaround in the
> meantime, I'm happy. Does anyone still need the bisection completed?

I, personally, wouldn't mind knowing what the cause was exactly, and what f=
ixed
it.  It could be important down the line if it ever reappears.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981802793.cb5C14D98.20424
Date: Fri, 23 Jun 2017 01:11:19 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Nouveau regression GT218M in Kernel 4.11 Won't=
 Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Nouveau regression GT218M in Kernel 4.11 Won't=
 Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368">bug 10136=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Ben Steel from <a href=3D"show_bug.cgi?id=3D10136=
8#c10">comment #10</a>)
<span class=3D"quote">&gt; Thank you Mr. Coenen. I agree. Kernel 4.12.0-rc6=
 does not exhibit the
&gt; problem on a Lenovo T510 either.
&gt; Between a fix already in the pipeline and a modeset workaround in the
&gt; meantime, I'm happy. Does anyone still need the bisection completed?</=
span >

I, personally, wouldn't mind knowing what the cause was exactly, and what f=
ixed
it.  It could be important down the line if it ever reappears.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14981802793.cb5C14D98.20424--

--===============1123106369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1123106369==--
