From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103889] [NV50/G86] disp: ERROR 1 [] 01 [] chid 0
 mthd 0000 data 00000000
Date: Sun, 30 Sep 2018 17:17:52 +0000
Message-ID: <bug-103889-8800-PGhSR61Tl7@http.bugs.freedesktop.org/>
References: <bug-103889-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1102236888=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103889-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1102236888==
Content-Type: multipart/alternative; boundary="15383278720.bfD17.25980"
Content-Transfer-Encoding: 7bit


--15383278720.bfD17.25980
Date: Sun, 30 Sep 2018 17:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103889

erhard_f-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #136018|0                           |1
        is obsolete|                            |

--- Comment #7 from erhard_f-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org ---
Created attachment 141806
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141806&action=3Dedit
dmesg output (kernel 4.19-rc5, nouveau.debug=3Ddebug log_buf_len=3D2M)

Some new debug info with kernel 4.19-rc5:

[  254.219918] nouveau 0001:06:00.0: fifo: DMA_PUSHER - ch 2 [X[285]] get
fffffffffc put 0000fffff8 ib_get 00000095 ib_put 00000096 state c0040026 (e=
rr:
MEM_FAULT) push 00406040
[  254.219940] nouveau 0001:06:00.0: fb: trapped read at fffffffffc on chan=
nel
2 [07aa0000 X[285]] engine 05 [PFIFO] client 08 [PFIFO_READ] subclient 00
[PUSHBUF] reason 00000000 [PT_NOT_PRESENT]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15383278720.bfD17.25980
Date: Sun, 30 Sep 2018 17:17:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:erhard_f&=
#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;mailbox.or=
g</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G86] disp: ERROR 1 [] 01 [] chid 0 mthd 0000 data 0=
0000000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103889">bug 10388=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #136018 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G86] disp: ERROR 1 [] 01 [] chid 0 mthd 0000 data 0=
0000000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103889#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G86] disp: ERROR 1 [] 01 [] chid 0 mthd 0000 data 0=
0000000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103889">bug 10388=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141806=
" name=3D"attach_141806" title=3D"dmesg output (kernel 4.19-rc5, nouveau.de=
bug=3Ddebug log_buf_len=3D2M)">attachment 141806</a> <a href=3D"attachment.=
cgi?id=3D141806&amp;action=3Dedit" title=3D"dmesg output (kernel 4.19-rc5, =
nouveau.debug=3Ddebug log_buf_len=3D2M)">[details]</a></span>
dmesg output (kernel 4.19-rc5, nouveau.debug=3Ddebug log_buf_len=3D2M)

Some new debug info with kernel 4.19-rc5:

[  254.219918] nouveau 0001:06:00.0: fifo: DMA_PUSHER - ch 2 [X[285]] get
fffffffffc put 0000fffff8 ib_get 00000095 ib_put 00000096 state c0040026 (e=
rr:
MEM_FAULT) push 00406040
[  254.219940] nouveau 0001:06:00.0: fb: trapped read at fffffffffc on chan=
nel
2 [07aa0000 X[285]] engine 05 [PFIFO] client 08 [PFIFO_READ] subclient 00
[PUSHBUF] reason 00000000 [PT_NOT_PRESENT]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15383278720.bfD17.25980--

--===============1102236888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1102236888==--
