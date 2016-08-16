From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Tue, 16 Aug 2016 14:06:11 +0000
Message-ID: <bug-31122-8800-9W5ZBYoOII@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2000201722=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2000201722==
Content-Type: multipart/alternative; boundary="14713563710.9633FC.20828";
 charset="UTF-8"


--14713563710.9633FC.20828
Date: Tue, 16 Aug 2016 14:06:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

A. Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #125547|0                           |1
        is obsolete|                            |
 Attachment #125561|0                           |1
        is obsolete|                            |
 Attachment #125642|0                           |1
        is obsolete|                            |

--- Comment #20 from A. Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> ---
Created attachment 125817
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125817&action=3Dedit
backlight control w/ gpio check

I've fixed the formatting.  Hopefully this new version is now fully complia=
nt.

However I've one question.  Is that GPIO check necessary considering the ma=
in
init function already checks for LVDS and eDP?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14713563710.9633FC.20828
Date: Tue, 16 Aug 2016 14:06:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nvbugz&#6=
4;sparklabs.me" title=3D"A. Chaud &lt;nvbugz&#64;sparklabs.me&gt;"> <span c=
lass=3D"fn">A. Chaud</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #125547 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #125561 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #125642 is obsolete</=
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
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvbugz&#64;sparklabs.me" title=3D"A. Chaud &lt;nvbugz&#64;sparklabs.me&gt;"=
> <span class=3D"fn">A. Chaud</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125817=
" name=3D"attach_125817" title=3D"backlight control w/ gpio check">attachme=
nt 125817</a> <a href=3D"attachment.cgi?id=3D125817&amp;action=3Dedit" titl=
e=3D"backlight control w/ gpio check">[details]</a></span> <a href=3D'page.=
cgi?id=3Dsplinter.html&amp;bug=3D31122&amp;attachment=3D125817'>[review]</a>
backlight control w/ gpio check

I've fixed the formatting.  Hopefully this new version is now fully complia=
nt.

However I've one question.  Is that GPIO check necessary considering the ma=
in
init function already checks for LVDS and eDP?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14713563710.9633FC.20828--

--===============2000201722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2000201722==--
