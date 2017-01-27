From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION,
 bisected] KMS can't initialize GeForce GTX 460 after commit
 a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
Date: Fri, 27 Jan 2017 18:04:53 +0000
Message-ID: <bug-97620-8800-RBIjORLkBi@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1258188338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1258188338==
Content-Type: multipart/alternative; boundary="14855402930.EDDc6Bc.15666";
 charset="UTF-8"


--14855402930.EDDc6Bc.15666
Date: Fri, 27 Jan 2017 18:04:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #31 from Carl Lucas <carl.lucas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello,

Is there any solution in sight for this? I have this card, and I am affecte=
d by
this issue. I'm currently using the bandaid suggested by Ilia in Comment #2=
9,
but obviously that's less than ideal, and I'd prefer to go back to using my
distro's stock kernel.

For reference, this particular card seems to have weird issues, even for ma=
ma
nVidia:
https://devtalk.nvidia.com/default/topic/959156/-quot-rminitadapter-failed-=
quot-with-370-23-but-367-35-works-fine/

No idea of the issue there is related at all, but it's another example of a
hard-to-track-down problem that affected ONLY this card. (I'm clucas84 in t=
hat
thread, btw - it was really frustrating at the time, because I couldn't get=
 X
at all, since nvidia was busted, and nouveau was affected by this issue).

I'm happy to do any debugging work that you want, including replicating any=
 of
the debug dumps already done by Luke Tidd if you think they will help, thou=
gh I
am time-constrained to the weekends for that sort of thing.

Otherwise, I think I'll give up on this card and get a new one - it's serve=
d me
well, but it seems like it's a bit too quirky.

In any case, thank you very much for your time, and everyone's excellent wo=
rk
on the nouveau driver!

Best,
Carl

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14855402930.EDDc6Bc.15666
Date: Fri, 27 Jan 2017 18:04:53 +0000
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
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c31">Commen=
t # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carl.lucas&#64;gmail.com" title=3D"Carl Lucas &lt;carl.lucas&#64;gmail.com&=
gt;"> <span class=3D"fn">Carl Lucas</span></a>
</span></b>
        <pre>Hello,

Is there any solution in sight for this? I have this card, and I am affecte=
d by
this issue. I'm currently using the bandaid suggested by Ilia in <a href=3D=
"show_bug.cgi?id=3D97620#c29">Comment #29</a>,
but obviously that's less than ideal, and I'd prefer to go back to using my
distro's stock kernel.

For reference, this particular card seems to have weird issues, even for ma=
ma
nVidia:
<a href=3D"https://devtalk.nvidia.com/default/topic/959156/-quot-rminitadap=
ter-failed-quot-with-370-23-but-367-35-works-fine/">https://devtalk.nvidia.=
com/default/topic/959156/-quot-rminitadapter-failed-quot-with-370-23-but-36=
7-35-works-fine/</a>

No idea of the issue there is related at all, but it's another example of a
hard-to-track-down problem that affected ONLY this card. (I'm clucas84 in t=
hat
thread, btw - it was really frustrating at the time, because I couldn't get=
 X
at all, since nvidia was busted, and nouveau was affected by this issue).

I'm happy to do any debugging work that you want, including replicating any=
 of
the debug dumps already done by Luke Tidd if you think they will help, thou=
gh I
am time-constrained to the weekends for that sort of thing.

Otherwise, I think I'll give up on this card and get a new one - it's serve=
d me
well, but it seems like it's a bit too quirky.

In any case, thank you very much for your time, and everyone's excellent wo=
rk
on the nouveau driver!

Best,
Carl</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14855402930.EDDc6Bc.15666--

--===============1258188338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1258188338==--
