From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110714] Xorg crashes randomly because of memory leak
Date: Thu, 11 Jul 2019 17:18:05 +0000
Message-ID: <bug-110714-8800-doG7zLPlYc@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1506835889=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1506835889==
Content-Type: multipart/alternative; boundary="15628654853.EFFAbE.14907"
Content-Transfer-Encoding: 7bit


--15628654853.EFFAbE.14907
Date: Thu, 11 Jul 2019 17:18:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #10 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Peter Draganov from comment #9)
>  - What clients were running at the time the issue occurred
> Skype, System Monitor, Firefox, Mate Terminal, Libre Office, Caja, TigerV=
NC,
> Virtualbox, Pluma
>  - Any special x11 client that can reproduce?
> have no idea
>  - Any particular action that triggers the issue?
> Usually crashes during the night, when a black screen saver is running, b=
ut
> it happened several times during the day, when I worked
>  - which desktop environment/window manager?
> LightDM/MATE
>=20
> Basically, anything that could help reproducing...
> Just leave X running long enough time - usually after 2-3 days without
> restart

what GPU do you have? I am especially interested in the amount of VRAM it h=
as.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15628654853.EFFAbE.14907
Date: Thu, 11 Jul 2019 17:18:05 +0000
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
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Peter Draganov from <a href=3D"show_bug.cgi?id=3D=
110714#c9">comment #9</a>)
<span class=3D"quote">&gt;  - What clients were running at the time the iss=
ue occurred
&gt; Skype, System Monitor, Firefox, Mate Terminal, Libre Office, Caja, Tig=
erVNC,
&gt; Virtualbox, Pluma
&gt;  - Any special x11 client that can reproduce?
&gt; have no idea
&gt;  - Any particular action that triggers the issue?
&gt; Usually crashes during the night, when a black screen saver is running=
, but
&gt; it happened several times during the day, when I worked
&gt;  - which desktop environment/window manager?
&gt; LightDM/MATE
&gt;=20
&gt; Basically, anything that could help reproducing...
&gt; Just leave X running long enough time - usually after 2-3 days without
&gt; restart</span >

what GPU do you have? I am especially interested in the amount of VRAM it h=
as.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15628654853.EFFAbE.14907--

--===============1506835889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1506835889==--
