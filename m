From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104181] [NV50/G94] system freeze on youtube with
 epiphany 3.26
Date: Tue, 14 Aug 2018 10:51:35 +0000
Message-ID: <bug-104181-8800-xvJmPst6gN@http.bugs.freedesktop.org/>
References: <bug-104181-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0600603099=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104181-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0600603099==
Content-Type: multipart/alternative; boundary="15342438950.B3ffBc.26243"
Content-Transfer-Encoding: 7bit


--15342438950.B3ffBc.26243
Date: Tue, 14 Aug 2018 10:51:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104181

guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high
                 CC|                            |guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org
           Severity|normal                      |major

--- Comment #1 from guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org ---
It happens also with more recent versions, such as any kernel ranging from
4.10.5 to very recent 4.17.10, latest mesa (18.1.5) and libdrm (2.4.93).

Aug 13 21:42:50 vortex kernel: [  216.549941] nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 8 [ositorWorkQueue[5050]] get 002015efe4 put 0020160044 ib_=
get
000000f7 ib_put 000000f8 state 80007698 (err: INVALID_CMD) push 00400040
Aug 13 21:44:02 vortex kernel: [  287.658593] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: multiple instances of buffer 3 on validation list
Aug 13 21:44:02 vortex kernel: [  287.658600] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate_init
Aug 13 21:44:02 vortex kernel: [  287.658602] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate: -22
Aug 13 21:44:02 vortex kernel: [  287.661076] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: multiple instances of buffer 3 on validation list
Aug 13 21:44:02 vortex kernel: [  287.661085] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate_init
Aug 13 21:44:02 vortex kernel: [  287.661089] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate: -22
Aug 13 21:44:02 vortex kernel: [  287.698020] show_signal_msg: 441 callbacks
suppressed
Aug 13 21:44:02 vortex kernel: [  287.698028] gstglcontext[5213]: segfault =
at
7f64f24b1000 ip 00007f644f46d137 sp 00007f63e0f11408 error 4 in
nouveau_dri.so[7f644ebae000+c01000]
Aug 13 21:44:10 vortex kernel: [  296.368787] ositorWorkQueue[5234]: segfau=
lt
at 8 ip 00007f9a41da9e3c sp 00007f9a7e5d6330 error 4 in
libdrm_nouveau.so.2.0.0[7f9a41da5000+8000]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15342438950.B3ffBc.26243
Date: Tue, 14 Aug 2018 10:51:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:guido&#64=
;trentalancia.com" title=3D"guido&#64;trentalancia.com">guido&#64;trentalan=
cia.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181">bug 10418=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>guido&#64;trentalancia.com
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>major
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181">bug 10418=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
guido&#64;trentalancia.com" title=3D"guido&#64;trentalancia.com">guido&#64;=
trentalancia.com</a>
</span></b>
        <pre>It happens also with more recent versions, such as any kernel =
ranging from
4.10.5 to very recent 4.17.10, latest mesa (18.1.5) and libdrm (2.4.93).

Aug 13 21:42:50 vortex kernel: [  216.549941] nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 8 [ositorWorkQueue[5050]] get 002015efe4 put 0020160044 ib_=
get
000000f7 ib_put 000000f8 state 80007698 (err: INVALID_CMD) push 00400040
Aug 13 21:44:02 vortex kernel: [  287.658593] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: multiple instances of buffer 3 on validation list
Aug 13 21:44:02 vortex kernel: [  287.658600] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate_init
Aug 13 21:44:02 vortex kernel: [  287.658602] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate: -22
Aug 13 21:44:02 vortex kernel: [  287.661076] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: multiple instances of buffer 3 on validation list
Aug 13 21:44:02 vortex kernel: [  287.661085] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate_init
Aug 13 21:44:02 vortex kernel: [  287.661089] nouveau 0000:01:00.0:
ositorWorkQueue[5150]: validate: -22
Aug 13 21:44:02 vortex kernel: [  287.698020] show_signal_msg: 441 callbacks
suppressed
Aug 13 21:44:02 vortex kernel: [  287.698028] gstglcontext[5213]: segfault =
at
7f64f24b1000 ip 00007f644f46d137 sp 00007f63e0f11408 error 4 in
nouveau_dri.so[7f644ebae000+c01000]
Aug 13 21:44:10 vortex kernel: [  296.368787] ositorWorkQueue[5234]: segfau=
lt
at 8 ip 00007f9a41da9e3c sp 00007f9a7e5d6330 error 4 in
libdrm_nouveau.so.2.0.0[7f9a41da5000+8000]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15342438950.B3ffBc.26243--

--===============0600603099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0600603099==--
