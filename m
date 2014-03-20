From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76414] [NVE4] Flash player triggers freeze with:
 PFIFO: read fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ...
Date: Thu, 20 Mar 2014 22:55:47 +0000
Message-ID: <bug-76414-8800-KmVWE3gjX5@http.bugs.freedesktop.org/>
References: <bug-76414-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0791951441=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76414-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0791951441==
Content-Type: multipart/alternative; boundary="1395356147.b70e1.5975"; charset="us-ascii"


--1395356147.b70e1.5975
Date: Thu, 20 Mar 2014 22:55:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76414

--- Comment #3 from Timoth=C3=A9e Ravier <tim-m/3gSgDDTkE@public.gmane.org> ---
Created attachment 96127
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D96127&action=3Dedit
dmesg log with "updated" nouveau module

I've tried with nouveau from git://people.freedesktop.org/~darktama/nouveau=
 on
the same kernel (3.14.rc7.r28 (commit ea1cd65)). This still froze, but not =
the
first time. I had to open the website twice.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395356147.b70e1.5975
Date: Thu, 20 Mar 2014 22:55:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE4] Flash player triggers freeze with: PFIFO: read=
 fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ..."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76414#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE4] Flash player triggers freeze with: PFIFO: read=
 fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ..."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76414">bug 76414<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tim&#64;siosm.fr" title=3D"Timoth=C3=A9e Ravier &lt;tim&#64;siosm.fr&gt;"> =
<span class=3D"fn">Timoth=C3=A9e Ravier</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D96127"=
 name=3D"attach_96127" title=3D"dmesg log with &quot;updated&quot; nouveau =
module">attachment 96127</a> <a href=3D"attachment.cgi?id=3D96127&amp;actio=
n=3Dedit" title=3D"dmesg log with &quot;updated&quot; nouveau module">[deta=
ils]</a></span>
dmesg log with &quot;updated&quot; nouveau module

I've tried with nouveau from git://people.freedesktop.org/~darktama/nouveau=
 on
the same kernel (3.14.rc7.r28 (commit ea1cd65)). This still froze, but not =
the
first time. I had to open the website twice.</pre>
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

--1395356147.b70e1.5975--

--===============0791951441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0791951441==--
