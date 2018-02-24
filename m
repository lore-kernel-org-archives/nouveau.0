From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Sat, 24 Feb 2018 20:55:52 +0000
Message-ID: <bug-105174-8800-MWlBSDETwj@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0044683590=="
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


--===============0044683590==
Content-Type: multipart/alternative; boundary="15195057521.376f3.14705"
Content-Transfer-Encoding: 7bit


--15195057521.376f3.14705
Date: Sat, 24 Feb 2018 20:55:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |NEW

--- Comment #7 from D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> ---
I got here by googling for "IP: nouveau_mem_host+0x47/0x1b0 [nouveau]".  Th=
is
leads me to think that my problem is (partly) this problem.

As I type this (using a different computer) my screen is hung.  But my comp=
uter
is working.

The machine is running Fedora 27 with all updates (except the latest
proprietary nvidia driver, which fails).  The kernel is 4.15.4-300.fc27.x86=
_64

I'm intending that the nouveau driver be suppressed in favour of the nvidia
driver.  Historically (i.e. for about 3 years) nouveau didn't work on this
setup (GTX 650 driving a Seiki UltraHD monitor at 30Hz).

For some reason, nouveau is running and the nvidia driver is not.  Even tho=
ugh
I have these kernel parameters:
rd.driver.blacklist=3Dnouveau modprobe.blacklist=3Dnouveau nvidia-drm.modes=
et=3D1

In any case, nouveau is now running, and I can log in, but when I start fir=
efox
(with a LOT of tabs), nouveau dereferences a NULL and the screen freezes (b=
ut
not the mouse).

I seem to remember that when I tried nouveau in the past, it would hang in a
similar way.  My hypothesis (untested) was that my large number of firefox =
tabs
would exhaust some nouveau resource.  I did not have that problem with the
nvidia proprietary driver.

So I have multiple problems, but one of them is this nouveau bug.  I don't
expect a solution to my other problems to come up in this bz.

I will attach a dmesg.

PS: why is the status NEEDSINFO?  I don't see where there is an outstanding
request for info.  I will try to change the status to NEW.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15195057521.376f3.14705
Date: Sat, 24 Feb 2018 20:55:52 +0000
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
           <td style=3D"text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>NEW
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c7">Commen=
t # 7</a>
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
        <pre>I got here by googling for &quot;IP: nouveau_mem_host+0x47/0x1=
b0 [nouveau]&quot;.  This
leads me to think that my problem is (partly) this problem.

As I type this (using a different computer) my screen is hung.  But my comp=
uter
is working.

The machine is running Fedora 27 with all updates (except the latest
proprietary nvidia driver, which fails).  The kernel is 4.15.4-300.fc27.x86=
_64

I'm intending that the nouveau driver be suppressed in favour of the nvidia
driver.  Historically (i.e. for about 3 years) nouveau didn't work on this
setup (GTX 650 driving a Seiki UltraHD monitor at 30Hz).

For some reason, nouveau is running and the nvidia driver is not.  Even tho=
ugh
I have these kernel parameters:
rd.driver.blacklist=3Dnouveau modprobe.blacklist=3Dnouveau nvidia-drm.modes=
et=3D1

In any case, nouveau is now running, and I can log in, but when I start fir=
efox
(with a LOT of tabs), nouveau dereferences a NULL and the screen freezes (b=
ut
not the mouse).

I seem to remember that when I tried nouveau in the past, it would hang in a
similar way.  My hypothesis (untested) was that my large number of firefox =
tabs
would exhaust some nouveau resource.  I did not have that problem with the
nvidia proprietary driver.

So I have multiple problems, but one of them is this nouveau bug.  I don't
expect a solution to my other problems to come up in this bz.

I will attach a dmesg.

PS: why is the status NEEDSINFO?  I don't see where there is an outstanding
request for info.  I will try to change the status to NEW.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15195057521.376f3.14705--

--===============0044683590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0044683590==--
