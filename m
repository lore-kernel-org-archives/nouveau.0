From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107167] constantly firing events while screen
 attached to NVIDIA card is disabled
Date: Mon, 09 Jul 2018 16:04:41 +0000
Message-ID: <bug-107167-8800-XjePxqN93z@http.bugs.freedesktop.org/>
References: <bug-107167-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0740442543=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107167-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0740442543==
Content-Type: multipart/alternative; boundary="15311522810.Da5e4.10725"
Content-Transfer-Encoding: 7bit


--15311522810.Da5e4.10725
Date: Mon, 9 Jul 2018 16:04:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107167

Sam Morris <sam-qkiumcfQ8OTe9xe1eoZjHA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #140523|0                           |1
        is obsolete|                            |

--- Comment #4 from Sam Morris <sam-qkiumcfQ8OTe9xe1eoZjHA@public.gmane.org> ---
Created attachment 140527
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140527&action=3Dedit
full kernel log

Here's 'journalctl -k' which goes back to the system boot.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15311522810.Da5e4.10725
Date: Mon, 9 Jul 2018 16:04:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sam&#64;r=
obots.org.uk" title=3D"Sam Morris &lt;sam&#64;robots.org.uk&gt;"> <span cla=
ss=3D"fn">Sam Morris</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - constantly firing events while screen attached to NV=
IDIA card is disabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107167">bug 10716=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #140523 is obsolete</=
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - constantly firing events while screen attached to NV=
IDIA card is disabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107167#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - constantly firing events while screen attached to NV=
IDIA card is disabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107167">bug 10716=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sam&#64;robots.org.uk" title=3D"Sam Morris &lt;sam&#64;robots.org.uk&gt;"> =
<span class=3D"fn">Sam Morris</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140527=
" name=3D"attach_140527" title=3D"full kernel log">attachment 140527</a> <a=
 href=3D"attachment.cgi?id=3D140527&amp;action=3Dedit" title=3D"full kernel=
 log">[details]</a></span>
full kernel log

Here's 'journalctl -k' which goes back to the system boot.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15311522810.Da5e4.10725--

--===============0740442543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0740442543==--
