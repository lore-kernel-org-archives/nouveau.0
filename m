From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Thu, 13 Apr 2017 18:56:34 +0000
Message-ID: <bug-100567-8800-p71BA1pRf0@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1279159127=="
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


--===============1279159127==
Content-Type: multipart/alternative; boundary="14921097941.99C29AEe.30799";
 charset="UTF-8"


--14921097941.99C29AEe.30799
Date: Thu, 13 Apr 2017 18:56:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #4 from kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org ---
Created attachment 130834
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130834&action=3Dedit
dmesg with SCHED_ERROR (starting at 73576 sec)

It happened again! I believe the monitors were turned off when the problem
occurred (I wasn't there at the time), but when I returned the monitors wer=
e on
and frozen. I could move the mouse around, but nothing else responded.

The errors start at [73576].

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14921097941.99C29AEe.30799
Date: Thu, 13 Apr 2017 18:56:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin&#64;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;=
potatofrom.space</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130834=
" name=3D"attach_130834" title=3D"dmesg with SCHED_ERROR (starting at 73576=
 sec)">attachment 130834</a> <a href=3D"attachment.cgi?id=3D130834&amp;acti=
on=3Dedit" title=3D"dmesg with SCHED_ERROR (starting at 73576 sec)">[detail=
s]</a></span>
dmesg with SCHED_ERROR (starting at 73576 sec)

It happened again! I believe the monitors were turned off when the problem
occurred (I wasn't there at the time), but when I returned the monitors wer=
e on
and frozen. I could move the mouse around, but nothing else responded.

The errors start at [73576].</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14921097941.99C29AEe.30799--

--===============1279159127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1279159127==--
