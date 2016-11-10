From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98677] [NVAC] iMac9,
 1 effective backlight brightness range changes after S3
Date: Thu, 10 Nov 2016 21:23:30 +0000
Message-ID: <bug-98677-8800-JEh5IyXMoO@http.bugs.freedesktop.org/>
References: <bug-98677-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0177373658=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98677-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0177373658==
Content-Type: multipart/alternative; boundary="14788130090.3dB86b8F.20424";
 charset="UTF-8"


--14788130090.3dB86b8F.20424
Date: Thu, 10 Nov 2016 21:23:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98677

--- Comment #8 from Jeffery Miller <jefferym-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I patched as suggested having it use the nva3_bl_ops. The backlight remained
dark in this case. I was able to get the backlight to turn on by setting va=
lues
with nvapoke to match values I had seen earlier:

nvapoke 0x0061c080 0x1
nvapoke 0x0061c084 0x80000401

I noticed from the mmiotrace of the binary driver that it seems to set these
two registers when the brightness changes.
I'm away from the machine at the moment to post the details that seemed
relevant to me.=20

I am not sure which registers might be important to check before and after.=
=20

I'll look at the trace again and pop into it for some questions

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14788130090.3dB86b8F.20424
Date: Thu, 10 Nov 2016 21:23:29 +0000
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
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677">bug 98677<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jefferym&#64;gmail.com" title=3D"Jeffery Miller &lt;jefferym&#64;gmail.com&=
gt;"> <span class=3D"fn">Jeffery Miller</span></a>
</span></b>
        <pre>I patched as suggested having it use the nva3_bl_ops. The back=
light remained
dark in this case. I was able to get the backlight to turn on by setting va=
lues
with nvapoke to match values I had seen earlier:

nvapoke 0x0061c080 0x1
nvapoke 0x0061c084 0x80000401

I noticed from the mmiotrace of the binary driver that it seems to set these
two registers when the brightness changes.
I'm away from the machine at the moment to post the details that seemed
relevant to me.=20

I am not sure which registers might be important to check before and after.=
=20

I'll look at the trace again and pop into it for some questions</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14788130090.3dB86b8F.20424--

--===============0177373658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0177373658==--
