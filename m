From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69375] [NV4E] GPU lockup when using chrome/flash
Date: Sat, 09 Nov 2013 20:14:02 +0000
Message-ID: <bug-69375-8800-BnK7HAqwk8@http.bugs.freedesktop.org/>
References: <bug-69375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1750362654=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1750362654==
Content-Type: multipart/alternative; boundary="1384028042.Fa10B3.30474"; charset="us-ascii"


--1384028042.Fa10B3.30474
Date: Sat, 9 Nov 2013 20:14:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69375

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Some recent relocation failures have been traced down to undefined behaviour in
libdrm which gcc-4.8 interprets differently than gcc-4.7 and earlier. A fix has
been submitted:
http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1
and I believe this deb contains the fix:
http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb.
Please try it either with a libdrm that contains that patch, or with libdrm
compiled with gcc-4.7 or clang.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384028042.Fa10B3.30474
Date: Sat, 9 Nov 2013 20:14:02 +0000
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
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375">bug 69375</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Some recent relocation failures have been traced down to undefined behaviour in
libdrm which gcc-4.8 interprets differently than gcc-4.7 and earlier. A fix has
been submitted:
<a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1">http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1</a>
and I believe this deb contains the fix:
<a href="http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb">http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb</a>.
Please try it either with a libdrm that contains that patch, or with libdrm
compiled with gcc-4.7 or clang.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384028042.Fa10B3.30474--

--===============1750362654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1750362654==--
