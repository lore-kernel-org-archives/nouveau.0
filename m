From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101273] [NV108] Random kernel panic
Date: Mon, 05 Jun 2017 10:18:12 +0000
Message-ID: <bug-101273-8800-5BqEIP1CYH@http.bugs.freedesktop.org/>
References: <bug-101273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372035345=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0372035345==
Content-Type: multipart/alternative; boundary="14966578920.d9d14.21750";
 charset="UTF-8"


--14966578920.d9d14.21750
Date: Mon, 5 Jun 2017 10:18:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101273

--- Comment #3 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think on the 4.11 kernel tree it is triggered by this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/com=
mit/?h=3Dv4.11.3&id=3D2138faf017517acf837816101f778d5c9cda37ef

could you verify that linux 4.11.2 works?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14966578920.d9d14.21750
Date: Mon, 5 Jun 2017 10:18:12 +0000
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
   title=3D"NEW - [NV108] Random kernel panic"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101273#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV108] Random kernel panic"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101273">bug 10127=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>I think on the 4.11 kernel tree it is triggered by this commit:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-sta=
ble.git/commit/?h=3Dv4.11.3&amp;id=3D2138faf017517acf837816101f778d5c9cda37=
ef">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git=
/commit/?h=3Dv4.11.3&amp;id=3D2138faf017517acf837816101f778d5c9cda37ef</a>

could you verify that linux 4.11.2 works?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14966578920.d9d14.21750--

--===============0372035345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0372035345==--
