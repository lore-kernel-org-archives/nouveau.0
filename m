From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Sun, 04 Aug 2013 00:55:36 +0000
Message-ID: <bug-67382-8800-unsa4pbeV8@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841945065=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0841945065==
Content-Type: multipart/alternative; boundary="1375577736.AadbC061.12184"; charset="us-ascii"


--1375577736.AadbC061.12184
Date: Sun, 4 Aug 2013 00:55:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D67382

--- Comment #29 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
I can confirm, that applying=20

>* remove the stabilisation
>+/*
> 	nv_wr32(priv, 0x61a00c + doff, 0x80000000);
>+*/

solves my issue.

The other two hunks weren't successful.

I suppose, testing the combination of those isn't needed after this result?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1375577736.AadbC061.12184
Date: Sun, 4 Aug 2013 00:55:36 +0000
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
   title=3D"NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be ava=
ilable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D67382#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be ava=
ilable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D67382">bug 67382<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
anonymous&#64;dodgeit.com" title=3D"Anonymous Helper &lt;anonymous&#64;dodg=
eit.com&gt;"> <span class=3D"fn">Anonymous Helper</span></a>
</span></b>
        <pre>I can confirm, that applying=20

<span class=3D"quote">&gt;* remove the stabilisation
&gt;+/*
&gt; 	nv_wr32(priv, 0x61a00c + doff, 0x80000000);
&gt;+*/</span >

solves my issue.

The other two hunks weren't successful.

I suppose, testing the combination of those isn't needed after this result?=
</pre>
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

--1375577736.AadbC061.12184--

--===============0841945065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0841945065==--
