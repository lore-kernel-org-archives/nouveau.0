From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Fri, 05 Aug 2016 02:18:11 +0000
Message-ID: <bug-31122-8800-osfRQOtYN3@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1663784701=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1663784701==
Content-Type: multipart/alternative; boundary="14703634910.3b12.5842";
 charset="UTF-8"


--14703634910.3b12.5842
Date: Fri, 5 Aug 2016 02:18:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #9 from A. Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> ---
I created a patch for this and it works for me under debian testing on
4.6.4-1-powerpc. I also added a workaround for another bug 31120. So this p=
atch
fixes backlight control and backlight after hibernate.=20=20

I never submitted a patch before. Hopefully this one is ok.  I welcome all
comments and suggestions.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14703634910.3b12.5842
Date: Fri, 5 Aug 2016 02:18:11 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvbugz&#64;sparklabs.me" title=3D"A. Chaud &lt;nvbugz&#64;sparklabs.me&gt;"=
> <span class=3D"fn">A. Chaud</span></a>
</span></b>
        <pre>I created a patch for this and it works for me under debian te=
sting on
4.6.4-1-powerpc. I also added a workaround for another <a class=3D"bz_bug_l=
ink=20
          bz_status_REOPENED "
   title=3D"REOPENED - Backlight off after suspend-to-disk on Powerbook"
   href=3D"show_bug.cgi?id=3D31120">bug 31120</a>. So this patch
fixes backlight control and backlight after hibernate.=20=20

I never submitted a patch before. Hopefully this one is ok.  I welcome all
comments and suggestions.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14703634910.3b12.5842--

--===============1663784701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1663784701==--
