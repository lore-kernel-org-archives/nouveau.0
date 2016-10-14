From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97438] Running a lot of Firefox instances causes
 kernel page fault.
Date: Fri, 14 Oct 2016 06:51:55 +0000
Message-ID: <bug-97438-8800-Ap4V8SGh3Q@http.bugs.freedesktop.org/>
References: <bug-97438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1552119495=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1552119495==
Content-Type: multipart/alternative; boundary="14764279150.11a76dfeA.13421";
 charset="UTF-8"


--14764279150.11a76dfeA.13421
Date: Fri, 14 Oct 2016 06:51:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97438

--- Comment #9 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to freedesktop.loser137 from comment #8)
> I applied the patch from comment 7 to kernel 4.8.1 and the crashes are go=
ne.
> There are new messages in dmesg:
> [  230.257319] nouveau 0000:01:00.0: imem: PRAMIN exhausted
> [  239.329904] nouveau 0000:01:00.0: imem: PRAMIN exhausted

Yep, that's expected.  It's a limited resource, and it's all been used.  The
driver will fall back to another (slower) method of accessing the data that=
 it
needs to map there.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764279150.11a76dfeA.13421
Date: Fri, 14 Oct 2016 06:51:55 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438">bug 97438<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to freedesktop.loser137 from <a href=3D"show_bug.cgi=
?id=3D97438#c8">comment #8</a>)
<span class=3D"quote">&gt; I applied the patch from <a href=3D"show_bug.cgi=
?id=3D97438#c7">comment 7</a> to kernel 4.8.1 and the crashes are gone.
&gt; There are new messages in dmesg:
&gt; [  230.257319] nouveau 0000:01:00.0: imem: PRAMIN exhausted
&gt; [  239.329904] nouveau 0000:01:00.0: imem: PRAMIN exhausted</span >

Yep, that's expected.  It's a limited resource, and it's all been used.  The
driver will fall back to another (slower) method of accessing the data that=
 it
needs to map there.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764279150.11a76dfeA.13421--

--===============1552119495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1552119495==--
