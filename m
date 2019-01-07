From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109230] [crash] Xorg is crashing on startup with
 enabled xinerama
Date: Mon, 07 Jan 2019 08:45:26 +0000
Message-ID: <bug-109230-8800-jO1S0f2pfV@http.bugs.freedesktop.org/>
References: <bug-109230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0525557055=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109230-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0525557055==
Content-Type: multipart/alternative; boundary="15468507260.B593DC49.25235"
Content-Transfer-Encoding: 7bit


--15468507260.B593DC49.25235
Date: Mon, 7 Jan 2019 08:45:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109230

Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Driver/nouveau              |Driver/Radeon
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                   |rg                          |

--- Comment #9 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
I was able to collect proper backtrace with symbols. And it seems the probl=
em
is the radeon.
I am attaching full backtrace.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15468507260.B593DC49.25235
Date: Mon, 7 Jan 2019 08:45:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:manio&#64=
;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;skyboo.net=
&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230">bug 10923=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Driver/nouveau
           </td>
           <td>Driver/Radeon
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>xorg-driver-ati&#64;lists.x.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230">bug 10923=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>I was able to collect proper backtrace with symbols. And it se=
ems the problem
is the radeon.
I am attaching full backtrace.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15468507260.B593DC49.25235--

--===============0525557055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0525557055==--
