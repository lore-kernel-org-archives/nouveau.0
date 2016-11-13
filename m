From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98709] [NV84] fifo intr 00c00000,
	subchan mapping messed up
Date: Sun, 13 Nov 2016 19:03:51 +0000
Message-ID: <bug-98709-8800-dMVtFu1hPZ@http.bugs.freedesktop.org/>
References: <bug-98709-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2106800113=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98709-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2106800113==
Content-Type: multipart/alternative; boundary="14790638310.AbAA0B5c.23764";
 charset="UTF-8"


--14790638310.AbAA0B5c.23764
Date: Sun, 13 Nov 2016 19:03:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98709

--- Comment #2 from Thibaud CANALE <thican+freedesktop-RcM+vJdHk5GsTnJN9+BGXg@public.gmane.org> ---
Hello again,

I managed to get through apitrace a replay which provokes the crash while
replaying it.
But because the files are way too big for the bugtracker (respectively 25MiB
and 859kiB for the trace and its dump both compressed with XZ), I am hosting
those files:
(Note: if you don't have CAcert's root certificate in your store, you will
encounter a error with HTTPS, accept the warning or remove the S in HTTPS)
https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A47%2B01%3A00.dump=
.xz
https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A47%2B01%3A00.xz

Hash SHA512:
cb0982861cdbd998e9f42baacf0f5b6cf26766fa2a102edcc12c3411041f7b03545b3df23dd=
8398ab776fd0c5bf9d150f8afe2f6fdb43fee474cf05e92e68a93
 Hacknet_2016-11-13 19:13:47+01:00.dump.xz
5a76c30adf031680f72c458935807ba83a5ff835e7bcc126a90ba92371e829850f267c37719=
e7b450a77359cdcda58bad4c900c8e1c0fa8a74a0ae1be3b5a102
 Hacknet_2016-11-13 19:13:47+01:00.xz

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14790638310.AbAA0B5c.23764
Date: Sun, 13 Nov 2016 19:03:51 +0000
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
   title=3D"NEW - [NV84] fifo intr 00c00000, subchan mapping messed up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98709#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] fifo intr 00c00000, subchan mapping messed up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98709">bug 98709<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
thican+freedesktop&#64;thican.net" title=3D"Thibaud CANALE &lt;thican+freed=
esktop&#64;thican.net&gt;"> <span class=3D"fn">Thibaud CANALE</span></a>
</span></b>
        <pre>Hello again,

I managed to get through apitrace a replay which provokes the crash while
replaying it.
But because the files are way too big for the bugtracker (respectively 25MiB
and 859kiB for the trace and its dump both compressed with XZ), I am hosting
those files:
(Note: if you don't have CAcert's root certificate in your store, you will
encounter a error with HTTPS, accept the warning or remove the S in HTTPS)
<a href=3D"https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A47%2B0=
1%3A00.dump.xz">https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A4=
7%2B01%3A00.dump.xz</a>
<a href=3D"https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A47%2B0=
1%3A00.xz">https://thican.net/~thican/Hacknet_2016-11-13%2019%3A13%3A47%2B0=
1%3A00.xz</a>

Hash SHA512:
cb0982861cdbd998e9f42baacf0f5b6cf26766fa2a102edcc12c3411041f7b03545b3df23dd=
8398ab776fd0c5bf9d150f8afe2f6fdb43fee474cf05e92e68a93
 Hacknet_2016-11-13 19:13:47+01:00.dump.xz
5a76c30adf031680f72c458935807ba83a5ff835e7bcc126a90ba92371e829850f267c37719=
e7b450a77359cdcda58bad4c900c8e1c0fa8a74a0ae1be3b5a102
 Hacknet_2016-11-13 19:13:47+01:00.xz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14790638310.AbAA0B5c.23764--

--===============2106800113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2106800113==--
