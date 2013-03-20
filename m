From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Wed, 20 Mar 2013 09:57:24 +0000
Message-ID: <bug-59168-8800-TJIqNxvRSh@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1784454589=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1784454589==
Content-Type: multipart/alternative; boundary="1363773444.ffAD2.3049"; charset="us-ascii"


--1363773444.ffAD2.3049
Date: Wed, 20 Mar 2013 09:57:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D59168

Bogdan R=C4=83dulescu <bogdan_radulescu99-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bogdan_radulescu99-/E1597aS9LQ@public.gmane.org
                   |                            |m

--- Comment #31 from Bogdan R=C4=83dulescu <bogdan_radulescu99-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> -=
--
Also happens here with Linux 3.8.3. It used to happen with all the 3.7 vers=
ions
I tested.

The card as reported by lspci is:
01:00.0 VGA compatible controller: nVidia Corporation GF108 [GeForce GT 540=
M]
(rev a1)
        Subsystem: Sony Corporation Device 9089
        Kernel driver in use: nouveau

My messages in dmesg are:
[  487.986709] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fb8c000]
[  487.986718] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa2040a04

Hope this nouveau bug will get fixed soon as it's really annoying.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1363773444.ffAD2.3049
Date: Wed, 20 Mar 2013 09:57:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bogdan_ra=
dulescu99&#64;yahoo.com" title=3D"Bogdan R=C4=83dulescu &lt;bogdan_radulesc=
u99&#64;yahoo.com&gt;"> <span class=3D"fn">Bogdan R=C4=83dulescu</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/=
corruption/noise on resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59168">bug 59168<=
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
           <td>bogdan_radulescu99&#64;yahoo.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/=
corruption/noise on resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59168#c31">Commen=
t # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/=
corruption/noise on resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59168">bug 59168<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bogdan_radulescu99&#64;yahoo.com" title=3D"Bogdan R=C4=83dulescu &lt;bogdan=
_radulescu99&#64;yahoo.com&gt;"> <span class=3D"fn">Bogdan R=C4=83dulescu</=
span></a>
</span></b>
        <pre>Also happens here with Linux 3.8.3. It used to happen with all=
 the 3.7 versions
I tested.

The card as reported by lspci is:
01:00.0 VGA compatible controller: nVidia Corporation GF108 [GeForce GT 540=
M]
(rev a1)
        Subsystem: Sony Corporation Device 9089
        Kernel driver in use: nouveau

My messages in dmesg are:
[  487.986709] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fb8c000]
[  487.986718] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa2040a04

Hope this nouveau bug will get fixed soon as it's really annoying.</pre>
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

--1363773444.ffAD2.3049--

--===============1784454589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1784454589==--
