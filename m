From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Thu, 01 Mar 2018 18:22:26 +0000
Message-ID: <bug-105174-8800-MP1q4lvUOR@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0722898218=="
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


--===============0722898218==
Content-Type: multipart/alternative; boundary="15199285460.Ee85eAba.20144"
Content-Transfer-Encoding: 7bit


--15199285460.Ee85eAba.20144
Date: Thu, 1 Mar 2018 18:22:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

--- Comment #9 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 137731
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137731&action=3Dedit
Proposed patch

Could anyone please try the attached patch (from
https://github.com/skeggsb/nouveau/pull/1)?

(In reply to D. Hugh Redelmeier from comment #7)
> PS: why is the status NEEDSINFO?  I don't see where there is an outstandi=
ng
> request for info.  I will try to change the status to NEW.

Simply because no one changed the status since the information was provided.
:-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199285460.Ee85eAba.20144
Date: Thu, 1 Mar 2018 18:22:26 +0000
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
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF108][Regression] Unable to handle NULL pointer derefer=
ence in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137731=
" name=3D"attach_137731" title=3D"Proposed patch">attachment 137731</a> <a =
href=3D"attachment.cgi?id=3D137731&amp;action=3Dedit" title=3D"Proposed pat=
ch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D1=
05174&amp;attachment=3D137731'>[review]</a>
Proposed patch

Could anyone please try the attached patch (from
<a href=3D"https://github.com/skeggsb/nouveau/pull/1">https://github.com/sk=
eggsb/nouveau/pull/1</a>)?

(In reply to D. Hugh Redelmeier from <a href=3D"show_bug.cgi?id=3D105174#c7=
">comment #7</a>)
<span class=3D"quote">&gt; PS: why is the status NEEDSINFO?  I don't see wh=
ere there is an outstanding
&gt; request for info.  I will try to change the status to NEW.</span >

Simply because no one changed the status since the information was provided.
:-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199285460.Ee85eAba.20144--

--===============0722898218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0722898218==--
