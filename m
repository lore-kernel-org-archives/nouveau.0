From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108651] Screen flickering when using compositor with
 OpenGL backend
Date: Mon, 05 Nov 2018 14:21:00 +0000
Message-ID: <bug-108651-8800-KxLbX0jVuO@http.bugs.freedesktop.org/>
References: <bug-108651-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2003917996=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108651-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2003917996==
Content-Type: multipart/alternative; boundary="15414276590.C3Dbc.22831"
Content-Transfer-Encoding: 7bit


--15414276590.C3Dbc.22831
Date: Mon, 5 Nov 2018 14:20:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108651

--- Comment #3 from cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
unsubscribe
On Mon, Nov 5, 2018 at 1:06 PM <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
>
> Comment # 2 on bug 108651 from Yuxuan Shui
>
> compton itself does not have lots of dependencies. Right now all the users
> experienced this problem seems to be using the i3 window manager, I don't=
 know
> if this is reproducible with windowmaker.
>
> I don't know the mesa version they use, I will ask. But judging that they=
 are
> all archlinux users, they are probably using mesa 18.2.4.
>
> They started experiencing this issue when they upgraded their compton. On=
e of
> the reporters did a bisect (though he cannot reliably reproduce this prob=
lem)
> and find out the bad commit seems to be
> https://github.com/yshui/compton/commit/7af815a0aaaffc02e114e1d0adccb5f87=
dcc3548,
> which touches nothing OpenGL related.
>
> ________________________________
> You are receiving this mail because:
>
> You are the QA Contact for the bug.
> You are the assignee for the bug.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15414276590.C3Dbc.22831
Date: Mon, 5 Nov 2018 14:20:59 +0000
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
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651">bug 10865=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cj.wijtmans&#64;gmail.com" title=3D"cj.wijtmans&#64;gmail.com">cj.wijtmans&=
#64;gmail.com</a>
</span></b>
        <pre>unsubscribe
On Mon, Nov 5, 2018 at 1:06 PM &lt;<a href=3D"mailto:bugzilla-daemon&#64;fr=
eedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:
&gt;
<span class=3D"quote">&gt; <a href=3D"show_bug.cgi?id=3D108651#c2">Comment =
# 2</a> on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"show_bug.cgi?id=3D108651">bug 108651</a> from Yuxuan Shui</span >
&gt;
<span class=3D"quote">&gt; compton itself does not have lots of dependencie=
s. Right now all the users
&gt; experienced this problem seems to be using the i3 window manager, I do=
n't know
&gt; if this is reproducible with windowmaker.</span >
&gt;
<span class=3D"quote">&gt; I don't know the mesa version they use, I will a=
sk. But judging that they are
&gt; all archlinux users, they are probably using mesa 18.2.4.</span >
&gt;
<span class=3D"quote">&gt; They started experiencing this issue when they u=
pgraded their compton. One of
&gt; the reporters did a bisect (though he cannot reliably reproduce this p=
roblem)
&gt; and find out the bad commit seems to be
&gt; <a href=3D"https://github.com/yshui/compton/commit/7af815a0aaaffc02e11=
4e1d0adccb5f87dcc3548">https://github.com/yshui/compton/commit/7af815a0aaaf=
fc02e114e1d0adccb5f87dcc3548</a>,
&gt; which touches nothing OpenGL related.</span >
&gt;
<span class=3D"quote">&gt; ________________________________
&gt; You are receiving this mail because:</span >
&gt;
<span class=3D"quote">&gt; You are the QA Contact for the bug.
&gt; You are the assignee for the bug.</span >
&gt;
<span class=3D"quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href=3D"mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists=
.freedesktop.org</a>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a></span ></pre>
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

--15414276590.C3Dbc.22831--

--===============2003917996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2003917996==--
