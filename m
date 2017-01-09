From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] fan alarm timer/update called from interrupt
 in an infinite loop
Date: Mon, 09 Jan 2017 22:36:31 +0000
Message-ID: <bug-91413-8800-rx8Cb2PTC7@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1488127371=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1488127371==
Content-Type: multipart/alternative; boundary="14840013911.752c.3493";
 charset="UTF-8"


--14840013911.752c.3493
Date: Mon, 9 Jan 2017 22:36:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91413

--- Comment #14 from David Hampton <bugzilla-1SViGS9jIagqcZcGjlUOXw@public.gmane.org> ---
Created attachment 128843
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128843&action=3Dedit
Prevent recursion while processing timers

I was having similar problem with daily crashes showing recursive calls to
nvkm_timer_alarm_trigger. I've been stable for the last three weeks with the
attached patch. It prevents the recursion by only processing the list when =
the
timer expires, and not also processing it each time an item is updated.

This patch is based off the Fedora 25 kernel 4.8.14 sources but should apply
elsewhere.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14840013911.752c.3493
Date: Mon, 9 Jan 2017 22:36:31 +0000
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
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413">bug 91413<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugzilla&#64;love2code.net" title=3D"David Hampton &lt;bugzilla&#64;love2co=
de.net&gt;"> <span class=3D"fn">David Hampton</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128843=
" name=3D"attach_128843" title=3D"Prevent recursion while processing timers=
">attachment 128843</a> <a href=3D"attachment.cgi?id=3D128843&amp;action=3D=
edit" title=3D"Prevent recursion while processing timers">[details]</a></sp=
an> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D91413&amp;attachment=
=3D128843'>[review]</a>
Prevent recursion while processing timers

I was having similar problem with daily crashes showing recursive calls to
nvkm_timer_alarm_trigger. I've been stable for the last three weeks with the
attached patch. It prevents the recursion by only processing the list when =
the
timer expires, and not also processing it each time an item is updated.

This patch is based off the Fedora 25 kernel 4.8.14 sources but should apply
elsewhere.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14840013911.752c.3493--

--===============1488127371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1488127371==--
