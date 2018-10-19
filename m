From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER 0x00406040 and lots of E[PGRAPH]
Date: Fri, 19 Oct 2018 09:09:56 +0000
Message-ID: <bug-70390-8800-6lLp3uWfCW@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0837443673=="
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


--===============0837443673==
Content-Type: multipart/alternative; boundary="15399401963.4C21C1E43.21531"
Content-Transfer-Encoding: 7bit


--15399401963.4C21C1E43.21531
Date: Fri, 19 Oct 2018 09:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

--- Comment #26 from Gergely M=C3=A9sz=C3=A1ros <meszaros.gergely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> ---
Similar problem and symptoms here, X and keyboard freeze ssh is working @
NVIDIA GT218 (GeForce 210). I have two invalid commands however (00502031 a=
nd
00400040)

nouveau 0000:03:00.0: fifo: DMA_PUSHER - ch 3 [systemd-logind[5633]] get
0020026b94 put 002002accc ib_get 000002fd ib_put 000002fe state 80004861 (e=
rr:
INVALID_CMD) push 00502031

nouveau 0000:03:00.0: fifo: DMA_PUSHER - ch 3 [systemd-logind[5633]] get
002002accc put 002002accc ib_get 000002fd ib_put 000002fe state 80000000 (e=
rr:
INVALID_CMD) push 00400040

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15399401963.4C21C1E43.21531
Date: Fri, 19 Oct 2018 09:09:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390#c26">Commen=
t # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] Repeated system crashes under graphics load, E[PFI=
FO] DMA_PUSHER 0x00406040 and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390">bug 70390<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
meszaros.gergely&#64;gmail.com" title=3D"Gergely M=C3=A9sz=C3=A1ros &lt;mes=
zaros.gergely&#64;gmail.com&gt;"> <span class=3D"fn">Gergely M=C3=A9sz=C3=
=A1ros</span></a>
</span></b>
        <pre>Similar problem and symptoms here, X and keyboard freeze ssh i=
s working &#64;
NVIDIA GT218 (GeForce 210). I have two invalid commands however (00502031 a=
nd
00400040)

nouveau 0000:03:00.0: fifo: DMA_PUSHER - ch 3 [systemd-logind[5633]] get
0020026b94 put 002002accc ib_get 000002fd ib_put 000002fe state 80004861 (e=
rr:
INVALID_CMD) push 00502031

nouveau 0000:03:00.0: fifo: DMA_PUSHER - ch 3 [systemd-logind[5633]] get
002002accc put 002002accc ib_get 000002fd ib_put 000002fe state 80000000 (e=
rr:
INVALID_CMD) push 00400040</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15399401963.4C21C1E43.21531--

--===============0837443673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0837443673==--
