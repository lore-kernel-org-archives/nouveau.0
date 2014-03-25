From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71620] nouveau_fence_wait_uevent NULL pointer
	dereference
Date: Tue, 25 Mar 2014 12:20:59 +0000
Message-ID: <bug-71620-8800-mAK6VItkzG@http.bugs.freedesktop.org/>
References: <bug-71620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0291451039=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0291451039==
Content-Type: multipart/alternative; boundary="1395750059.AA5E62.13135"; charset="us-ascii"


--1395750059.AA5E62.13135
Date: Tue, 25 Mar 2014 12:20:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71620

--- Comment #3 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 96364
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D96364&action=3Dedit
stacktrace from kernel oops

same here (with a slightly different stack trace), see attachment
(using 10de:06e4 (GeForce 8400 GS Rev. 2)).

Was simply using fluxbox/firefox after a resumed. It's the first time it
happens, (but I changed a couple of kernel options only 2 days ago).
I will attach the .config diff in case there's something related.

Will try the patch later if I can get the oops frequently enough.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395750059.AA5E62.13135
Date: Tue, 25 Mar 2014 12:20:59 +0000
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
   title=3D"NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71620#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71620">bug 71620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D96364"=
 name=3D"attach_96364" title=3D"stacktrace from kernel oops">attachment 963=
64</a> <a href=3D"attachment.cgi?id=3D96364&amp;action=3Dedit" title=3D"sta=
cktrace from kernel oops">[details]</a></span>
stacktrace from kernel oops

same here (with a slightly different stack trace), see attachment
(using 10de:06e4 (GeForce 8400 GS Rev. 2)).

Was simply using fluxbox/firefox after a resumed. It's the first time it
happens, (but I changed a couple of kernel options only 2 days ago).
I will attach the .config diff in case there's something related.

Will try the patch later if I can get the oops frequently enough.</pre>
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

--1395750059.AA5E62.13135--

--===============0291451039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0291451039==--
