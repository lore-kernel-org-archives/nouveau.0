From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Sat, 24 Feb 2018 20:59:09 +0000
Message-ID: <bug-105174-8800-CVDyEoXmq8@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1977309604=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105174-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1977309604==
Content-Type: multipart/alternative; boundary="15195059493.eBcd6.15414"
Content-Transfer-Encoding: 7bit


--15195059493.eBcd6.15414
Date: Sat, 24 Feb 2018 20:59:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org

--- Comment #8 from D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> ---
Created attachment 137583
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137583&action=3Dedit
dmesg from hang on Hugh's system

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15195059493.eBcd6.15414
Date: Sat, 24 Feb 2018 20:59:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:hugh&#64;=
mimosa.com" title=3D"D. Hugh Redelmeier &lt;hugh&#64;mimosa.com&gt;"> <span=
 class=3D"fn">D. Hugh Redelmeier</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
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
           <td>hugh&#64;mimosa.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hugh&#64;mimosa.com" title=3D"D. Hugh Redelmeier &lt;hugh&#64;mimosa.com&gt=
;"> <span class=3D"fn">D. Hugh Redelmeier</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137583=
" name=3D"attach_137583" title=3D"dmesg from hang on Hugh's system">attachm=
ent 137583</a> <a href=3D"attachment.cgi?id=3D137583&amp;action=3Dedit" tit=
le=3D"dmesg from hang on Hugh's system">[details]</a></span>
dmesg from hang on Hugh's system</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15195059493.eBcd6.15414--

--===============1977309604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1977309604==--
