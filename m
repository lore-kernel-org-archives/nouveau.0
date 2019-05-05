From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Sun, 05 May 2019 18:24:39 +0000
Message-ID: <bug-100567-8800-leSaENeknd@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954155295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0954155295==
Content-Type: multipart/alternative; boundary="155708067912.EfaFdb.17567"
Content-Transfer-Encoding: 7bit


--155708067912.EfaFdb.17567
Date: Sun, 5 May 2019 18:24:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #28 from Roy <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org> ---
Somewhat surprised that this particular report hasn't received any attention
from a core dev. Sadly, I'm afraid my response will not be hugely satisfying
eiter.

The message "fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]" is not the result of *a =
bug*
and does not point in the direction of one. Rather it is a symptom of a wide
variety of potential problems with nouveau, (all of) which result in a hang=
 of
the rendering part of the GPU. On itself it doesn't give meaningful informa=
tion
to any developer as to what may be the culprit. It's like measuring a fever=
, it
could be the result of many conditions.

Developers would be helped if there was a reliably reproducible situation in
which this event can be triggered. If there is a list of steps that can be
followed that would result in this message and a hang, that somehow doesn't
involve words like "random" or "wait for possibly a few hours", and that ca=
n be
traced with tools such as APITrace, we could get a step further in analysing
what goes wrong. However, it seems unlikely this is the case, especially si=
nce
we are also aware of multithreading-related issues that make isolating such
problems extremely difficult. Unfortunately, post-mortem syslogs and dmesgs=
 are
unlikely to add any useful information to this or similar bug reports.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--155708067912.EfaFdb.17567
Date: Sun, 5 May 2019 18:24:39 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nouveau&#64;spliet.org" title=3D"Roy &lt;nouveau&#64;spliet.org&gt;"> <span=
 class=3D"fn">Roy</span></a>
</span></b>
        <pre>Somewhat surprised that this particular report hasn't received=
 any attention
from a core dev. Sadly, I'm afraid my response will not be hugely satisfying
eiter.

The message &quot;fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]&quot; is not the res=
ult of *a bug*
and does not point in the direction of one. Rather it is a symptom of a wide
variety of potential problems with nouveau, (all of) which result in a hang=
 of
the rendering part of the GPU. On itself it doesn't give meaningful informa=
tion
to any developer as to what may be the culprit. It's like measuring a fever=
, it
could be the result of many conditions.

Developers would be helped if there was a reliably reproducible situation in
which this event can be triggered. If there is a list of steps that can be
followed that would result in this message and a hang, that somehow doesn't
involve words like &quot;random&quot; or &quot;wait for possibly a few hour=
s&quot;, and that can be
traced with tools such as APITrace, we could get a step further in analysing
what goes wrong. However, it seems unlikely this is the case, especially si=
nce
we are also aware of multithreading-related issues that make isolating such
problems extremely difficult. Unfortunately, post-mortem syslogs and dmesgs=
 are
unlikely to add any useful information to this or similar bug reports.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--155708067912.EfaFdb.17567--

--===============0954155295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0954155295==--
