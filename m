From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107003] secboot: HS load failed
Date: Fri, 13 Jul 2018 19:01:48 +0000
Message-ID: <bug-107003-8800-PjTh0CuDNa@http.bugs.freedesktop.org/>
References: <bug-107003-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0530983436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107003-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0530983436==
Content-Type: multipart/alternative; boundary="15315085080.183adF42.5629"
Content-Transfer-Encoding: 7bit


--15315085080.183adF42.5629
Date: Fri, 13 Jul 2018 19:01:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107003

--- Comment #2 from Emil Andersen Lauridsen <mine809-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So, digging further into the log, and looking at some mmiotraces, it appears
the timeout was merely a symptom, not the root problem. The secboot HS
bootloader gets loaded to the card without much issue, but returns an error
code instead of executing succefully.

On a maybe related note: The HS bootloader blob the nvidia driver sends is
quite different from the one nouveau sends, so I assume it could be a probl=
em
with the released firmware blob simply not supporting the card.

Given that the card is a 1070 Ti, released in november 2017, and the firmwa=
re
blob being from february 2017, it wouldn't seem too far fetched.

I'd be interested to hear if any other 1070 Ti users are able to run with
nouveau.

Also, does any of the nouveau developers have the ability to contact nvidia
about such an issue? It would be much appreciated.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15315085080.183adF42.5629
Date: Fri, 13 Jul 2018 19:01:48 +0000
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
   title=3D"NEW - secboot: HS load failed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107003#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - secboot: HS load failed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107003">bug 10700=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mine809&#64;gmail.com" title=3D"Emil Andersen Lauridsen &lt;mine809&#64;gma=
il.com&gt;"> <span class=3D"fn">Emil Andersen Lauridsen</span></a>
</span></b>
        <pre>So, digging further into the log, and looking at some mmiotrac=
es, it appears
the timeout was merely a symptom, not the root problem. The secboot HS
bootloader gets loaded to the card without much issue, but returns an error
code instead of executing succefully.

On a maybe related note: The HS bootloader blob the nvidia driver sends is
quite different from the one nouveau sends, so I assume it could be a probl=
em
with the released firmware blob simply not supporting the card.

Given that the card is a 1070 Ti, released in november 2017, and the firmwa=
re
blob being from february 2017, it wouldn't seem too far fetched.

I'd be interested to hear if any other 1070 Ti users are able to run with
nouveau.

Also, does any of the nouveau developers have the ability to contact nvidia
about such an issue? It would be much appreciated.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15315085080.183adF42.5629--

--===============0530983436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0530983436==--
