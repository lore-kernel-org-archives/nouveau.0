From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Sat, 06 Oct 2018 07:35:03 +0000
Message-ID: <bug-100228-8800-57rZmiigDj@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0560498680=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0560498680==
Content-Type: multipart/alternative; boundary="15388113034.a8D8b.10338"
Content-Transfer-Encoding: 7bit


--15388113034.a8D8b.10338
Date: Sat, 6 Oct 2018 07:35:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

Mitchell Keith Bloch <bazald-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bazald-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #28 from Mitchell Keith Bloch <bazald-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Not sure what to add to this. Running a system with a GeForce GT 1030
GV-N1030SL-2GL. It worked fine when passed through to a Windows VM, but when
attempting to use it as the Linux 4.18.12 GPU, I get this error. I can conf=
irm
that nouveau.runpm=3D0 has no apparent effect, while nouveau.noaccel=3D1 el=
iminates
the error. (startx, of course, fails.)

Running kernel 4.14.74, I'm not sure this error appears. It is as though
nouveau.noaccel=3D1 is in effect from the beginning. Perhaps the card is "b=
etter"
supported with the 4.18 series.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15388113034.a8D8b.10338
Date: Sat, 6 Oct 2018 07:35:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bazald&#6=
4;gmail.com" title=3D"Mitchell Keith Bloch &lt;bazald&#64;gmail.com&gt;"> <=
span class=3D"fn">Mitchell Keith Bloch</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>bazald&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bazald&#64;gmail.com" title=3D"Mitchell Keith Bloch &lt;bazald&#64;gmail.co=
m&gt;"> <span class=3D"fn">Mitchell Keith Bloch</span></a>
</span></b>
        <pre>Not sure what to add to this. Running a system with a GeForce =
GT 1030
GV-N1030SL-2GL. It worked fine when passed through to a Windows VM, but when
attempting to use it as the Linux 4.18.12 GPU, I get this error. I can conf=
irm
that nouveau.runpm=3D0 has no apparent effect, while nouveau.noaccel=3D1 el=
iminates
the error. (startx, of course, fails.)

Running kernel 4.14.74, I'm not sure this error appears. It is as though
nouveau.noaccel=3D1 is in effect from the beginning. Perhaps the card is &q=
uot;better&quot;
supported with the 4.18 series.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15388113034.a8D8b.10338--

--===============0560498680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0560498680==--
