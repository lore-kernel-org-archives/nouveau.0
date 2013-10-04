From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] [nv34 PowerMac G5] gnome-shell random crashes
 and rendering issues
Date: Fri, 04 Oct 2013 16:50:41 +0000
Message-ID: <bug-70135-8800-wblLmsne3i@http.bugs.freedesktop.org/>
References: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1230488623=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1230488623==
Content-Type: multipart/alternative; boundary="1380905440.3c87b1.15742"; charset="us-ascii"


--1380905440.3c87b1.15742
Date: Fri, 4 Oct 2013 16:50:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I just posted a pair of patches that disable ARB_framebuffer_object on
nv30/nv40 cards. I believe that is the cause of this error:

[  254.402384] nouveau E[  PGRAPH][0000:f0:10.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  254.402411] nouveau E[  PGRAPH][0000:f0:10.0] ch 3 [gnome-shell[2575]] subc
7 class 0x0697 mthd 0x0208 data 0x04060348

These should be "harmless" though (in that they'll just cause rendering to
fail, not apps to crash). You can grab the patches at

http://lists.freedesktop.org/archives/nouveau/2013-October/014671.html
http://lists.freedesktop.org/archives/nouveau/2013-October/014672.html

They should apply on top of mesa-git. Also, you didn't mention what version of
mesa you're using, but there's a nv30/40-specific bug in the 9.2.0 release
which is known to be triggered by gnome-shell. It is already fixed in mesa-git
on both master and the 9.2 branches.

However this:

[  258.941658] gnome-shell[2575]: unhandled signal 11 at 00000000 nip 0be2f384
lr 0be2f2d8 code 30001

appears to be a bug in gnome-shell (or one of its libraries... so I guess it's
possible it's in mesa/nouveau as well). Perhaps run it in gdb and look at the
backtrace? Or maybe it indicates some trouble in its stdout/stderr, not sure
where that goes in your setup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380905440.3c87b1.15742
Date: Fri, 4 Oct 2013 16:50:40 +0000
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
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I just posted a pair of patches that disable ARB_framebuffer_object on
nv30/nv40 cards. I believe that is the cause of this error:

[  254.402384] nouveau E[  PGRAPH][0000:f0:10.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  254.402411] nouveau E[  PGRAPH][0000:f0:10.0] ch 3 [gnome-shell[2575]] subc
7 class 0x0697 mthd 0x0208 data 0x04060348

These should be &quot;harmless&quot; though (in that they'll just cause rendering to
fail, not apps to crash). You can grab the patches at

<a href="http://lists.freedesktop.org/archives/nouveau/2013-October/014671.html">http://lists.freedesktop.org/archives/nouveau/2013-October/014671.html</a>
<a href="http://lists.freedesktop.org/archives/nouveau/2013-October/014672.html">http://lists.freedesktop.org/archives/nouveau/2013-October/014672.html</a>

They should apply on top of mesa-git. Also, you didn't mention what version of
mesa you're using, but there's a nv30/40-specific bug in the 9.2.0 release
which is known to be triggered by gnome-shell. It is already fixed in mesa-git
on both master and the 9.2 branches.

However this:

[  258.941658] gnome-shell[2575]: unhandled signal 11 at 00000000 nip 0be2f384
lr 0be2f2d8 code 30001

appears to be a bug in gnome-shell (or one of its libraries... so I guess it's
possible it's in mesa/nouveau as well). Perhaps run it in gdb and look at the
backtrace? Or maybe it indicates some trouble in its stdout/stderr, not sure
where that goes in your setup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380905440.3c87b1.15742--

--===============1230488623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1230488623==--
