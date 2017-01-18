From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Wed, 18 Jan 2017 21:51:35 +0000
Message-ID: <bug-95282-8800-4hp95VKbxv@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1758397417=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1758397417==
Content-Type: multipart/alternative; boundary="14847762940.DcE82.2345";
 charset="UTF-8"


--14847762940.DcE82.2345
Date: Wed, 18 Jan 2017 21:51:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95282

David Kredba <nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #18 from David Kredba <nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The same with VLC-2.2.4 (DVB-T stream), VDPAU, kernel 4.9.4, mesa-13.0.3,
xf86-video-nouveau-1.0.13. Any web browser crashes KDE Plasma - XOrg-server=
 the
same way - it does not react to anything or it tak=C3=A9 ages to react. Mpv
absolutely stable till now using opengl-hq profile.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14847762940.DcE82.2345
Date: Wed, 18 Jan 2017 21:51:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nheghathi=
vhistha&#64;gmail.com" title=3D"David Kredba &lt;nheghathivhistha&#64;gmail=
.com&gt;"> <span class=3D"fn">David Kredba</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
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
           <td>nheghathivhistha&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nheghathivhistha&#64;gmail.com" title=3D"David Kredba &lt;nheghathivhistha&=
#64;gmail.com&gt;"> <span class=3D"fn">David Kredba</span></a>
</span></b>
        <pre>The same with VLC-2.2.4 (DVB-T stream), VDPAU, kernel 4.9.4, m=
esa-13.0.3,
xf86-video-nouveau-1.0.13. Any web browser crashes KDE Plasma - XOrg-server=
 the
same way - it does not react to anything or it tak=C3=A9 ages to react. Mpv
absolutely stable till now using opengl-hq profile.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14847762940.DcE82.2345--

--===============1758397417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1758397417==--
