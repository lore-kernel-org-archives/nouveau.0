From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] [NVA5] Monitor not restored after resume
 [regression] [bisected]
Date: Mon, 22 Sep 2014 09:17:52 +0000
Message-ID: <bug-83550-8800-27SzzSKt7b@http.bugs.freedesktop.org/>
References: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1977442884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1977442884==
Content-Type: multipart/alternative; boundary="1411377472.a0C22.11742"; charset="us-ascii"


--1411377472.a0C22.11742
Date: Mon, 22 Sep 2014 09:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83550

Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #106559|0                           |1
        is obsolete|                            |

--- Comment #7 from Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> ---
Created attachment 106662
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D106662&action=3Dedit
log of last good commit

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1411377472.a0C22.11742
Date: Mon, 22 Sep 2014 09:17:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:odi&#64;o=
di.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span class=3D"f=
n">Ortwin Gl=C3=BCck</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVA5] Monitor not restored after resume [regression]=
 [bisected]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83550">bug 83550<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #106559 is obsolete</=
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
   title=3D"NEW --- - [NVA5] Monitor not restored after resume [regression]=
 [bisected]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83550#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVA5] Monitor not restored after resume [regression]=
 [bisected]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83550">bug 83550<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
odi&#64;odi.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span c=
lass=3D"fn">Ortwin Gl=C3=BCck</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D106662=
" name=3D"attach_106662" title=3D"log of last good commit">attachment 10666=
2</a> <a href=3D"attachment.cgi?id=3D106662&amp;action=3Dedit" title=3D"log=
 of last good commit">[details]</a></span>
log of last good commit</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411377472.a0C22.11742--

--===============1977442884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1977442884==--
