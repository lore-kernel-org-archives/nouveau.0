From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
 working)
Date: Sun, 02 Dec 2018 23:12:51 +0000
Message-ID: <bug-92961-8800-odtczSbPhw@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703348899=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1703348899==
Content-Type: multipart/alternative; boundary="15437923711.0Dac1929F.23156"
Content-Transfer-Encoding: 7bit


--15437923711.0Dac1929F.23156
Date: Sun, 2 Dec 2018 23:12:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92961

Nic Soud=C3=A9e <nsoudee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nsoudee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #19 from Nic Soud=C3=A9e <nsoudee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 142692
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142692&action=3Dedit
Handle INTR 0x00800000 in gf100_fifo_intr

Attached is a patch I applied to kernel 4.19.5 to desperately thwart my DELL
E6420 from randomly getting its video busted (very similar symptons as Comm=
ent
#3 of this ticket, and is why I'm posting here). I don't have any experience
with such low-level programming but I just pretended I knew what I was doing
and cut and pasted a condition for that INTR 0x00800000 error which pops up
every time that catastrophic random event happens.

So far, my E6420 is working great despite receiving some of those INTRs, th=
anks
to this patch. I am posting this in hopes it might be on the right track
towards getting this fixed by someone who knows what they're doing...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15437923711.0Dac1929F.23156
Date: Sun, 2 Dec 2018 23:12:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nsoudee&#=
64;gmail.com" title=3D"Nic Soud=C3=A9e &lt;nsoudee&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nic Soud=C3=A9e</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>nsoudee&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nsoudee&#64;gmail.com" title=3D"Nic Soud=C3=A9e &lt;nsoudee&#64;gmail.com&g=
t;"> <span class=3D"fn">Nic Soud=C3=A9e</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142692=
" name=3D"attach_142692" title=3D"Handle INTR 0x00800000 in gf100_fifo_intr=
">attachment 142692</a> <a href=3D"attachment.cgi?id=3D142692&amp;action=3D=
edit" title=3D"Handle INTR 0x00800000 in gf100_fifo_intr">[details]</a></sp=
an> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D92961&amp;attachment=
=3D142692'>[review]</a>
Handle INTR 0x00800000 in gf100_fifo_intr

Attached is a patch I applied to kernel 4.19.5 to desperately thwart my DELL
E6420 from randomly getting its video busted (very similar symptons as Comm=
ent
#3 of this ticket, and is why I'm posting here). I don't have any experience
with such low-level programming but I just pretended I knew what I was doing
and cut and pasted a condition for that INTR 0x00800000 error which pops up
every time that catastrophic random event happens.

So far, my E6420 is working great despite receiving some of those INTRs, th=
anks
to this patch. I am posting this in hopes it might be on the right track
towards getting this fixed by someone who knows what they're doing...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15437923711.0Dac1929F.23156--

--===============1703348899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1703348899==--
