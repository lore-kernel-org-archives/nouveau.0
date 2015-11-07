From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] specifying higher than EDID-preferred
 4:3 mode on DVI-I -> VGA adapter causes output to be compressed into small
 fraction of CRT's top scan lines
Date: Sat, 07 Nov 2015 08:09:47 +0000
Message-ID: <bug-69083-8800-5YmWoRuntI@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2088087003=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2088087003==
Content-Type: multipart/alternative; boundary="1446883787.eC586CC1.3099"; charset="UTF-8"


--1446883787.eC586CC1.3099
Date: Sat, 7 Nov 2015 08:09:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Up until recently, we defaulted to forcing panel scaling by default (except for
VGA). Perhaps we were misdetecting something wrt auto-enabling it (normally
disabled for VGA). Does this still happen with recent kernels? Or with the
randr property 'scaling mode' set to 'None'?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446883787.eC586CC1.3099
Date: Sat, 7 Nov 2015 08:09:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Up until recently, we defaulted to forcing panel scaling by default (except for
VGA). Perhaps we were misdetecting something wrt auto-enabling it (normally
disabled for VGA). Does this still happen with recent kernels? Or with the
randr property 'scaling mode' set to 'None'?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446883787.eC586CC1.3099--

--===============2088087003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2088087003==--
