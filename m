From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] [NV84] gpu hang on resume from suspend to ram
Date: Mon, 10 Nov 2014 19:05:37 +0000
Message-ID: <bug-86115-8800-rnPIU6xMLr@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1588673853=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1588673853==
Content-Type: multipart/alternative; boundary="1415646337.ad40de62.9007"; charset="UTF-8"


--1415646337.ad40de62.9007
Date: Mon, 10 Nov 2014 19:05:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D86115

Lars M=C3=BCller <lars-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #109227|0                           |1
        is obsolete|                            |

--- Comment #9 from Lars M=C3=BCller <lars-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> ---
Created attachment 109236
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D109236&action=3Dedit
Retest S3 after calling: echo 0 > /sys/power/pm_async

With /sys/power/pm_async set to 0 the system no longer crashes while resume.

I'm able to ssh into the system but x.org doesn't come back.  The two scree=
ns
stay black.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1415646337.ad40de62.9007
Date: Mon, 10 Nov 2014 19:05:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lars&#64;=
samba.org" title=3D"Lars M=C3=BCller &lt;lars&#64;samba.org&gt;"> <span cla=
ss=3D"fn">Lars M=C3=BCller</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115">bug 86115<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #109227 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115">bug 86115<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lars&#64;samba.org" title=3D"Lars M=C3=BCller &lt;lars&#64;samba.org&gt;"> =
<span class=3D"fn">Lars M=C3=BCller</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D109236=
" name=3D"attach_109236" title=3D"Retest S3 after calling: echo 0 &gt; /sys=
/power/pm_async">attachment 109236</a> <a href=3D"attachment.cgi?id=3D10923=
6&amp;action=3Dedit" title=3D"Retest S3 after calling: echo 0 &gt; /sys/pow=
er/pm_async">[details]</a></span>
Retest S3 after calling: echo 0 &gt; /sys/power/pm_async

With /sys/power/pm_async set to 0 the system no longer crashes while resume.

I'm able to ssh into the system but x.org doesn't come back.  The two scree=
ns
stay black.</pre>
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

--1415646337.ad40de62.9007--

--===============1588673853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1588673853==--
