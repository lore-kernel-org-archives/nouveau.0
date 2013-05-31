From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Fri, 31 May 2013 04:28:58 +0000
Message-ID: <bug-62914-8800-WSf970kkq8@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0669290292=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0669290292==
Content-Type: multipart/alternative; boundary="1369974538.76Db5B12.990"; charset="us-ascii"


--1369974538.76Db5B12.990
Date: Fri, 31 May 2013 04:28:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #24 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you post the disassembly of the function? Would like to see exactly where
in that method it's dying. (I wonder if it's crtc->randr_crtc... something with
a 0x2d0 struct offset.)

Also, the latest version of that code has added a #ifdef NOUVEAU_PIXMAP_SHARING
around the added code in drmmode_set_mode_major... (which I assume you've tried
running as well). What happens if you just remove that whole ifdef? (But leave
the rest of the commit in.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369974538.76Db5B12.990
Date: Fri, 31 May 2013 04:28:58 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you post the disassembly of the function? Would like to see exactly where
in that method it's dying. (I wonder if it's crtc-&gt;randr_crtc... something with
a 0x2d0 struct offset.)

Also, the latest version of that code has added a #ifdef NOUVEAU_PIXMAP_SHARING
around the added code in drmmode_set_mode_major... (which I assume you've tried
running as well). What happens if you just remove that whole ifdef? (But leave
the rest of the commit in.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369974538.76Db5B12.990--

--===============0669290292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0669290292==--
