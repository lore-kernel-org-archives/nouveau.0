From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97537] nvc0 occasionally crashes in glDrawArrays in
 a multi-threaded app
Date: Mon, 29 Aug 2016 21:05:33 +0000
Message-ID: <bug-97537-8800-sIbZ3OENg4@http.bugs.freedesktop.org/>
References: <bug-97537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618033873=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0618033873==
Content-Type: multipart/alternative; boundary="14725047320.a2a1AF.18471";
 charset="UTF-8"


--14725047320.a2a1AF.18471
Date: Mon, 29 Aug 2016 21:05:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97537

--- Comment #2 from shinji.suzuki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Yes, each thread writes to its own context without any explicit synchroniza=
tion
other than GL-fences to synchronize access on shared resources (texture and
PBO) with.

Thank you for the info. I'll examine the branch and wet my feet in building
mesa myself.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14725047320.a2a1AF.18471
Date: Mon, 29 Aug 2016 21:05:32 +0000
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
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537">bug 97537<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shinji.suzuki&#64;gmail.com" title=3D"shinji.suzuki&#64;gmail.com">shinji.s=
uzuki&#64;gmail.com</a>
</span></b>
        <pre>Yes, each thread writes to its own context without any explici=
t synchronization
other than GL-fences to synchronize access on shared resources (texture and
PBO) with.

Thank you for the info. I'll examine the branch and wet my feet in building
mesa myself.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14725047320.a2a1AF.18471--

--===============0618033873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0618033873==--
