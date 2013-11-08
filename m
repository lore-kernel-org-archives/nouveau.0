From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] Nouveau dmesg error, computer hangs
Date: Fri, 08 Nov 2013 16:03:20 +0000
Message-ID: <bug-71382-8800-tcyZa6cQo2@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0313683030=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0313683030==
Content-Type: multipart/alternative; boundary="1383926600.3b7fF82.8244"; charset="us-ascii"


--1383926600.3b7fF82.8244
Date: Fri, 8 Nov 2013 16:03:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I see you're using Ubuntu, I think its newer packages are compiled with
gcc-4.8, and we recently fixed a nastly bug that shows up on libdrm compiled
with gcc-4.8:
http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1

Could you either try this with libdrm compiled with clang or gcc-4.7 (or
earlier), or alternatively try a libdrm with that patch applied?

There's a deb here that should have the fix:
http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb

Although no idea if it'll install correctly on your system.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383926600.3b7fF82.8244
Date: Fri, 8 Nov 2013 16:03:20 +0000
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
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I see you're using Ubuntu, I think its newer packages are compiled with
gcc-4.8, and we recently fixed a nastly bug that shows up on libdrm compiled
with gcc-4.8:
<a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1">http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1</a>

Could you either try this with libdrm compiled with clang or gcc-4.7 (or
earlier), or alternatively try a libdrm with that patch applied?

There's a deb here that should have the fix:
<a href="http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb">http://ftp.de.debian.org/debian/pool/main/libd/libdrm/libdrm-nouveau2_2.4.46-4_amd64.deb</a>

Although no idea if it'll install correctly on your system.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383926600.3b7fF82.8244--

--===============0313683030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0313683030==--
