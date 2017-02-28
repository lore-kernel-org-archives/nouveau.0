From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 28 Feb 2017 09:01:54 +0000
Message-ID: <bug-99900-8800-uITpmGEjSI@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1445040106=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1445040106==
Content-Type: multipart/alternative; boundary="14882725141.64cB7.24834";
 charset="UTF-8"


--14882725141.64cB7.24834
Date: Tue, 28 Feb 2017 09:01:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #7 from Ralph Gauges <r.gauges-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
One last note, hopefully.

I went back to kernel 4.9. The error can still be triggered using the latest
version of VirtualBox with a Windows 10 guest and guest additions installed.
During boot up of the VM, probably when the guest additions are loaded, the=
 VM
stops.

Again I gets the error messages in kern.log and Xorg.log but with kernel 4.=
9 it
takes a lot longer for the system to freeze. Actually it didn't crash, it j=
ust
wouldn't accept any input after some minutes. The mouse pointer was still
moving, but neither keyboard input nor mouse clicks hat any effect. I also
couldn't switch to a text console with ALT-F1 any more.

Hope that helps in reproducing the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14882725141.64cB7.24834
Date: Tue, 28 Feb 2017 09:01:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
r.gauges&#64;hotmail.com" title=3D"Ralph Gauges &lt;r.gauges&#64;hotmail.co=
m&gt;"> <span class=3D"fn">Ralph Gauges</span></a>
</span></b>
        <pre>One last note, hopefully.

I went back to kernel 4.9. The error can still be triggered using the latest
version of VirtualBox with a Windows 10 guest and guest additions installed.
During boot up of the VM, probably when the guest additions are loaded, the=
 VM
stops.

Again I gets the error messages in kern.log and Xorg.log but with kernel 4.=
9 it
takes a lot longer for the system to freeze. Actually it didn't crash, it j=
ust
wouldn't accept any input after some minutes. The mouse pointer was still
moving, but neither keyboard input nor mouse clicks hat any effect. I also
couldn't switch to a text console with ALT-F1 any more.

Hope that helps in reproducing the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14882725141.64cB7.24834--

--===============1445040106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1445040106==--
