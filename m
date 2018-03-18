From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER 0x00406040 and lots of E[PGRAPH]
Date: Sun, 18 Mar 2018 20:25:10 +0000
Message-ID: <bug-70390-8800-IALxGZP4BU@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0646245192=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0646245192==
Content-Type: multipart/alternative; boundary="15214047100.4A6FF17.23320"
Content-Transfer-Encoding: 7bit


--15214047100.4A6FF17.23320
Date: Sun, 18 Mar 2018 20:25:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

--- Comment #24 from Carsten Pfeiffer <pfeiffer-RoXCvvDuEio@public.gmane.org> ---
Not sure if this is the same issue, since my system stays alive (only the j=
ava
process terminates) and the command is 00400040 in my case:

nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d [BEGIN_END_ACTIVE]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 12e4 data 00000000
[...]
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d [BEGIN_END_ACTIVE]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 1510 data 00000000
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 0020198ff8 =
put
0020213390 ib_get 000002ae ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 002001aff4 =
put
0020094fd4 ib_get 000002b1 ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 002001aff4 =
put
0020094fd4 ib_get 000002b4 ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 0020115b4c =
put
0020193068 ib_get 000002b7 ib_put 000002b8 state 80007ac8 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 1ac4 data 06360150
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 00201c0fa8 =
put
0020214e24 ib_get 000002b9 ib_put 000002ba state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: java[27397]: failed to idle channel 7 [java[27397]]

Very easily reproduceable with sweethome3d.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15214047100.4A6FF17.23320
Date: Sun, 18 Mar 2018 20:25:10 +0000
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
   title=3D"NEW - [NV84] Repeated system crashes under graphics load, E[PFI=
FO] DMA_PUSHER 0x00406040 and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] Repeated system crashes under graphics load, E[PFI=
FO] DMA_PUSHER 0x00406040 and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390">bug 70390<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pfeiffer&#64;kde.org" title=3D"Carsten Pfeiffer &lt;pfeiffer&#64;kde.org&gt=
;"> <span class=3D"fn">Carsten Pfeiffer</span></a>
</span></b>
        <pre>Not sure if this is the same issue, since my system stays aliv=
e (only the java
process terminates) and the command is 00400040 in my case:

nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d [BEGIN_END_ACTIVE]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 12e4 data 00000000
[...]
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d [BEGIN_END_ACTIVE]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 1510 data 00000000
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 0020198ff8 =
put
0020213390 ib_get 000002ae ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 002001aff4 =
put
0020094fd4 ib_get 000002b1 ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 002001aff4 =
put
0020094fd4 ib_get 000002b4 ib_put 000002b5 state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 0020115b4c =
put
0020193068 ib_get 000002b7 ib_put 000002b8 state 80007ac8 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
nouveau 0000:01:00.0: gr: 00100000 [] ch 7 [003f7c3000 java[27397]] subc 3
class 8597 mthd 1ac4 data 06360150
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [java[27397]] get 00201c0fa8 =
put
0020214e24 ib_get 000002b9 ib_put 000002ba state 80007641 (err: INVALID_CMD)
push 00400040
nouveau 0000:01:00.0: java[27397]: failed to idle channel 7 [java[27397]]

Very easily reproduceable with sweethome3d.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15214047100.4A6FF17.23320--

--===============0646245192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0646245192==--
