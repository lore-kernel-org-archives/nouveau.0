From: Craig Garner <craigcgarner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 90887] PhiMovesPass in register allocator broken
Date: Mon, 7 Dec 2015 15:04:43 -0500
Message-ID: <CAGfK2pfN3DLKd_XJ3XQcBZLgivVHxA5iy=AfWTifFnEjKSbtvw@mail.gmail.com>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
 <bug-90887-8800-goEQduK9MX@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1319783865=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-goEQduK9MX-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

--===============1319783865==
Content-Type: multipart/alternative; boundary=001a11409e024123cc0526545ecd

--001a11409e024123cc0526545ecd
Content-Type: text/plain; charset=UTF-8

I'll give you my 2 cents worth when there is an update to the driver, X, or
whatever is causing the issue in fc23.  If I push it, I might be able to
test something tomorrow if there are any updates for fc22->fc23.

Thanks for all your hard work!!!

Craig


On Mon, Dec 7, 2015 at 2:56 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> changed bug 90887
> <https://bugs.freedesktop.org/show_bug.cgi?id=90887>
> What Removed Added Status NEW RESOLVED Resolution --- FIXED
>
> *Comment # 41 <https://bugs.freedesktop.org/show_bug.cgi?id=90887#c41> on
> bug 90887 <https://bugs.freedesktop.org/show_bug.cgi?id=90887> from jr
> <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> *
>
> After doing some tests with this change I'm sure that the reported problem is
> fully fixed by Ilja's patch. That splitting more edges seems to help in some
> cases most probably has a different cause. I'll try to take another look at the
> hearthstone shaders (may not be soon).
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

--001a11409e024123cc0526545ecd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I&#39;ll give you my 2 cents worth when there is=
 an update to the driver, X, or whatever is causing the issue in fc23.=C2=
=A0 If I push it, I might be able to test something tomorrow if there are a=
ny updates for fc22-&gt;fc23.<br><br></div>Thanks for all your hard work!!!=
<br><br></div>Craig<br><br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Dec 7, 2015 at 2:56 PM,  <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org" target=3D"_blank">bugzilla-=
daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
   =20
     =20
   =20
    <div><span><a href=3D"mailto:j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org" title=3D"jr &lt;j-r@online.=
de&gt;" target=3D"_blank"> <span>jr</span></a>
</span> changed
              <a title=3D"RESOLVED FIXED - PhiMovesPass in register allocat=
or broken" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887" ta=
rget=3D"_blank">bug 90887</a>
          <br>
             <table cellpadding=3D"8" cellspacing=3D"0" border=3D"1">
          <tbody><tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></tbody></table>
      <p>
        </p><div>
            <b><a title=3D"RESOLVED FIXED - PhiMovesPass in register alloca=
tor broken" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887#c4=
1" target=3D"_blank">Comment # 41</a>
              on <a title=3D"RESOLVED FIXED - PhiMovesPass in register allo=
cator broken" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887"=
 target=3D"_blank">bug 90887</a>
              from <span><a href=3D"mailto:j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org" title=3D"jr &lt;j=
-r@online.de&gt;" target=3D"_blank"> <span>jr</span></a>
</span></b>
        <pre>After doing some tests with this change I&#39;m sure that the =
reported problem is
fully fixed by Ilja&#39;s patch. That splitting more edges seems to help in=
 some
cases most probably has a different cause. I&#39;ll try to take another loo=
k at the
hearthstone shaders (may not be soon).</pre>
        </div>
      <p></p><span class=3D"">
      <hr>
      <span>You are receiving this mail because:</span>
     =20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </span></div>

<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
<br></blockquote></div><br></div>

--001a11409e024123cc0526545ecd--

--===============1319783865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1319783865==--
