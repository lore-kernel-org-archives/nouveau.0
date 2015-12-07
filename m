From: Craig Garner <craigcgarner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 90887] PhiMovesPass in register allocator broken
Date: Mon, 7 Dec 2015 14:57:28 -0500
Message-ID: <CAGfK2pf1_qEhwNAcpFfOxKfK1s8EtFLV2dmPmq3AK4KH-x6nsQ@mail.gmail.com>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
 <bug-90887-8800-19WTPVxGXI@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0582327378=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-19WTPVxGXI-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0582327378==
Content-Type: multipart/alternative; boundary=001a1141bc5c46fba00526544441

--001a1141bc5c46fba00526544441
Content-Type: text/plain; charset=UTF-8

I'll be done with my current project in a couple days.  I can give you all
the info you want for my quad head setup.  I would like to be able to at
least keep up with Fedora Current :)

Tell me what you need so I'll have it before hand.  I have a laptop I can
still communicate with people and a full workstation backup.


On Mon, Dec 7, 2015 at 2:50 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 40 <https://bugs.freedesktop.org/show_bug.cgi?id=90887#c40> on
> bug 90887 <https://bugs.freedesktop.org/show_bug.cgi?id=90887> from jr
> <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> *
>
> Created attachment 120393 <https://bugs.freedesktop.org/attachment.cgi?id=120393> [details] <https://bugs.freedesktop.org/attachment.cgi?id=120393&action=edit> [review] <https://bugs.freedesktop.org/page.cgi?id=splinter.html&bug=90887&attachment=120393>
> Patch to simplify test case creation
>
> Thanks. I finally had some time to look at the problem again. With the attached
> patch it is easier to recreate the problem, because it causes every if without
> an else clause to create a critical edge with the right property (i.e. not
> being the first incoming edge).
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the QA Contact for the bug.
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--001a1141bc5c46fba00526544441
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ll be done with my current project in a couple =
days.=C2=A0 I can give you all the info you want for my quad head setup.=C2=
=A0 I would like to be able to at least keep up with Fedora Current :)<br><=
br></div>Tell me what you need so I&#39;ll have it before hand.=C2=A0 I hav=
e a laptop I can still communicate with people and a full workstation backu=
p.<br><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Mon, Dec 7, 2015 at 2:50 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bug=
zilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org" target=3D"_blank">bugzilla-daemon@freedesktop=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
   =20
     =20
   =20
    <div>
      <p>
        </p><div>
            <b><a title=3D"NEW - PhiMovesPass in register allocator broken"=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887#c40" target=
=3D"_blank">Comment # 40</a>
              on <a title=3D"NEW - PhiMovesPass in register allocator broke=
n" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887" target=3D"=
_blank">bug 90887</a>
              from <span><a href=3D"mailto:j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org" title=3D"jr &lt;j=
-r@online.de&gt;" target=3D"_blank"> <span>jr</span></a>
</span></b>
        <pre>Created <span><a href=3D"https://bugs.freedesktop.org/attachme=
nt.cgi?id=3D120393" name=3D"1517dfee26fdf8a6_attach_120393" title=3D"Patch =
to simplify test case creation" target=3D"_blank">attachment 120393</a> <a =
href=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D120393&amp;action=
=3Dedit" title=3D"Patch to simplify test case creation" target=3D"_blank">[=
details]</a></span> <a href=3D"https://bugs.freedesktop.org/page.cgi?id=3Ds=
plinter.html&amp;bug=3D90887&amp;attachment=3D120393" target=3D"_blank">[re=
view]</a>
Patch to simplify test case creation

Thanks. I finally had some time to look at the problem again. With the atta=
ched
patch it is easier to recreate the problem, because it causes every if with=
out
an else clause to create a critical edge with the right property (i.e. not
being the first incoming edge).</pre>
        </div>
      <p></p>
      <hr>
      <span>You are receiving this mail because:</span>
     =20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </div>

<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
<br></blockquote></div><br></div>

--001a1141bc5c46fba00526544441--

--===============0582327378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0582327378==--
