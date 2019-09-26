From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108615] [NVE7] changing resolution causes blank
 screen
Date: Thu, 26 Sep 2019 18:44:29 +0000
Message-ID: <bug-108615-8800-cf3yWf0QtU@http.bugs.freedesktop.org/>
References: <bug-108615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0120968533=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0120968533==
Content-Type: multipart/alternative; boundary="15695234693.Adf752Bce.17896"
Content-Transfer-Encoding: 7bit


--15695234693.Adf752Bce.17896
Date: Thu, 26 Sep 2019 18:44:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108615

Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #8 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 145527
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145527&action=3Dedit
Kernel log with a switch from native to lower resolution

Phil Turmel =E2=80=93 I am not certain if your issue is the same as the rep=
orter has.
I do have exactly same symptoms =E2=80=93 after changing resolution to not =
native, I
get black screen with backlight on. It is not an DE or WM issue, as I was
testing with bare xinit session. If there are other outputs active, they st=
ill
show picture just fine (split screen or clone mode). Thus, as jbytecoder wr=
ote,
X is still fine, just nothing goes to particular output device.

G98M (NV50 family) card tested with kernel 5.0 and 5.3.

Attached dmesg was generated after a reboot, stopping sddm, starting xinit
session and changing resolution to 1024x768 (native is 1440x900).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695234693.Adf752Bce.17896
Date: Thu, 26 Sep 2019 18:44:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:maris.nar=
tiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;gmail.com&=
gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
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
           <td>maris.nartiss&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maris.nartiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;g=
mail.com&gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145527=
" name=3D"attach_145527" title=3D"Kernel log with a switch from native to l=
ower resolution">attachment 145527</a> <a href=3D"attachment.cgi?id=3D14552=
7&amp;action=3Dedit" title=3D"Kernel log with a switch from native to lower=
 resolution">[details]</a></span>
Kernel log with a switch from native to lower resolution

Phil Turmel =E2=80=93 I am not certain if your issue is the same as the rep=
orter has.
I do have exactly same symptoms =E2=80=93 after changing resolution to not =
native, I
get black screen with backlight on. It is not an DE or WM issue, as I was
testing with bare xinit session. If there are other outputs active, they st=
ill
show picture just fine (split screen or clone mode). Thus, as jbytecoder wr=
ote,
X is still fine, just nothing goes to particular output device.

G98M (NV50 family) card tested with kernel 5.0 and 5.3.

Attached dmesg was generated after a reboot, stopping sddm, starting xinit
session and changing resolution to 1024x768 (native is 1440x900).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695234693.Adf752Bce.17896--

--===============0120968533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0120968533==--
