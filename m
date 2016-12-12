From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Mon, 12 Dec 2016 09:22:18 +0000
Message-ID: <bug-98039-8800-SKYS3iuu68@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743638709=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0743638709==
Content-Type: multipart/alternative; boundary="14815345383.10adccA.6972";
 charset="UTF-8"


--14815345383.10adccA.6972
Date: Mon, 12 Dec 2016 09:22:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #14 from Ren=C3=A9 Krell <renda.krell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Sorry, Ren=C3=A9, for all this spam that has been thrust upon you.

This doesn't matter at all, I'm glad when things are moving on and if there=
 is
new information appearing from discussions.
I'm still open to help here, making valgrind reports of components, whatever
help I can provide. Unfortunately, I don't know internals neither of nouveau
nor of QtWebEngine and plasmashell, I'm just using (and testing) them. So I
need a clear announcement what to do.

I'm using OpenSUSE Tumbleweed and I have currently uninstalled the package
Mesa-dri-nouveau you already mentioned to be split off by the OpenSUSE
maintainers. But at the end their patches seemed already no longer to hang =
up
my "cutting edge" plasmashell with KMail system. I have still problems with
plasmashell running into a loop eating the full CPU power unless killed and
restarted. And the (QtWebEngine-based) KMail getting very slow from time to
time when navigating through messages, but both issues happen already with
uninstalled Mesa-dri-nouveau, so this might be a different problem.

Regarding buying a graphics hardware from a different vendor - I just canno=
t do
this, it's built-in to my work notebook I received from my employer :-)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14815345383.10adccA.6972
Date: Mon, 12 Dec 2016 09:22:18 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
renda.krell&#64;gmail.com" title=3D"Ren=C3=A9 Krell &lt;renda.krell&#64;gma=
il.com&gt;"> <span class=3D"fn">Ren=C3=A9 Krell</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Sorry, Ren=C3=A9, for all this spam=
 that has been thrust upon you.</span >

This doesn't matter at all, I'm glad when things are moving on and if there=
 is
new information appearing from discussions.
I'm still open to help here, making valgrind reports of components, whatever
help I can provide. Unfortunately, I don't know internals neither of nouveau
nor of QtWebEngine and plasmashell, I'm just using (and testing) them. So I
need a clear announcement what to do.

I'm using OpenSUSE Tumbleweed and I have currently uninstalled the package
Mesa-dri-nouveau you already mentioned to be split off by the OpenSUSE
maintainers. But at the end their patches seemed already no longer to hang =
up
my &quot;cutting edge&quot; plasmashell with KMail system. I have still pro=
blems with
plasmashell running into a loop eating the full CPU power unless killed and
restarted. And the (QtWebEngine-based) KMail getting very slow from time to
time when navigating through messages, but both issues happen already with
uninstalled Mesa-dri-nouveau, so this might be a different problem.

Regarding buying a graphics hardware from a different vendor - I just canno=
t do
this, it's built-in to my work notebook I received from my employer :-)</pr=
e>
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

--14815345383.10adccA.6972--

--===============0743638709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0743638709==--
