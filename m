From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101368] Nouveau regression GT218M in Kernel 4.11
	Won't Boot
Date: Tue, 20 Jun 2017 13:17:05 +0000
Message-ID: <bug-101368-8800-S97LmHEiMt@http.bugs.freedesktop.org/>
References: <bug-101368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0391559473=="
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


--===============0391559473==
Content-Type: multipart/alternative; boundary="14979646242.ab9F.10772";
 charset="UTF-8"


--14979646242.ab9F.10772
Date: Tue, 20 Jun 2017 13:17:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101368

--- Comment #9 from wilrikerDE+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have the same issue on an Asus PL80Jt which has the same Nvidia Chip built
in. Using modprobe.blacklist=3Dnouveau let's me but just fine (except that =
PRIME
won't be enabled and the card will not be disabled by vgaswitcheroo). Other=
wise
I experience what has been described here.

I compiled kernel 4.12-rc6 this morning and it boots fine again. So this wi=
ll
be fixed in 4.12. My machine is too slow to do a bisect (kernel compiles
several hours) so I cannot provide you with the information what broke it
originally.

Best regards
Manuel

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14979646242.ab9F.10772
Date: Tue, 20 Jun 2017 13:17:04 +0000
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
   title=3D"NEW - Nouveau regression GT218M in Kernel 4.11 Won't Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau regression GT218M in Kernel 4.11 Won't Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368">bug 10136=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wilrikerDE+freedesktop&#64;gmail.com" title=3D"wilrikerDE+freedesktop&#64;g=
mail.com">wilrikerDE+freedesktop&#64;gmail.com</a>
</span></b>
        <pre>I have the same issue on an Asus PL80Jt which has the same Nvi=
dia Chip built
in. Using modprobe.blacklist=3Dnouveau let's me but just fine (except that =
PRIME
won't be enabled and the card will not be disabled by vgaswitcheroo). Other=
wise
I experience what has been described here.

I compiled kernel 4.12-rc6 this morning and it boots fine again. So this wi=
ll
be fixed in 4.12. My machine is too slow to do a bisect (kernel compiles
several hours) so I cannot provide you with the information what broke it
originally.

Best regards
Manuel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14979646242.ab9F.10772--

--===============0391559473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0391559473==--
