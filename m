From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Sun, 29 Oct 2017 00:49:58 +0000
Message-ID: <bug-100228-8800-miB3yPwXVS@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2022351693=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2022351693==
Content-Type: multipart/alternative; boundary="15092381984.aa29413.29035";
 charset="UTF-8"


--15092381984.aa29413.29035
Date: Sun, 29 Oct 2017 00:49:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

Aaron Ball <nullspoon-f/Z1F5yPGLM@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nullspoon-f/Z1F5yPGLM@public.gmane.org

--- Comment #16 from Aaron Ball <nullspoon-f/Z1F5yPGLM@public.gmane.org> ---
Created attachment 135146
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135146&action=3Dedit
NVIDIA GTX 1050 Ti vbios.rom (GP107)

Got mine working (finally) with imirkin's help (thanks very much!). Per
harry_x's comment, I just had to modprobe nouveau with runpm=3D0.

ASUS ROG GL753VE with NVIDIA GTX 1050 Ti (see attached vbios rom, per
rhyskidd's request on irc)

Running kernel 4.14.0-rc6

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15092381984.aa29413.29035
Date: Sun, 29 Oct 2017 00:49:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nullspoon=
&#64;oper.io" title=3D"Aaron Ball &lt;nullspoon&#64;oper.io&gt;"> <span cla=
ss=3D"fn">Aaron Ball</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
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
           <td>nullspoon&#64;oper.io
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nullspoon&#64;oper.io" title=3D"Aaron Ball &lt;nullspoon&#64;oper.io&gt;"> =
<span class=3D"fn">Aaron Ball</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135146=
" name=3D"attach_135146" title=3D"NVIDIA GTX 1050 Ti vbios.rom (GP107)">att=
achment 135146</a> <a href=3D"attachment.cgi?id=3D135146&amp;action=3Dedit"=
 title=3D"NVIDIA GTX 1050 Ti vbios.rom (GP107)">[details]</a></span>
NVIDIA GTX 1050 Ti vbios.rom (GP107)

Got mine working (finally) with imirkin's help (thanks very much!). Per
harry_x's comment, I just had to modprobe nouveau with runpm=3D0.

ASUS ROG GL753VE with NVIDIA GTX 1050 Ti (see attached vbios rom, per
rhyskidd's request on irc)

Running kernel 4.14.0-rc6</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15092381984.aa29413.29035--

--===============2022351693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2022351693==--
