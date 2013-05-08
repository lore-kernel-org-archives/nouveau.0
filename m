From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Wed, 08 May 2013 17:37:02 +0000
Message-ID: <bug-62914-8800-RVQZp0b0bM@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0032461654=="
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


--===============0032461654==
Content-Type: multipart/alternative; boundary="1368034622.DB3301.2832"; charset="us-ascii"


--1368034622.DB3301.2832
Date: Wed, 8 May 2013 17:37:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #9 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Can reproduce the issue but there is no "good" combination on my system, i.e.
any combination of 

xf86-video-nouveau -> 1.0.6-1  1.0.7-1
xorg-server -> 1.13.2.901-1  1.14.0-2

produces "Failed to set drm interface version"


In terms of "how to bisect" the links provided are quite nice
Although I would suggest to confirm which package exactly caused the issue,
before jumping into blind bisection

1. Revert xorg-server to previous version (1.13.2.901-1)
2. Keep xf86-video-nouveau 1.0.7-1, but rebuild it on top of the old/good
xserver

and vice versa

Note: to avoid rebuilding the input drivers have SSH handy and observe Xorg.log
for the offending lines

Note: if unsure about the specific build options, patches and others take a
look at the distro packaging system

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368034622.DB3301.2832
Date: Wed, 8 May 2013 17:37:02 +0000
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
   title="NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Can reproduce the issue but there is no &quot;good&quot; combination on my system, i.e.
any combination of 

xf86-video-nouveau -&gt; 1.0.6-1  1.0.7-1
xorg-server -&gt; 1.13.2.901-1  1.14.0-2

produces &quot;Failed to set drm interface version&quot;


In terms of &quot;how to bisect&quot; the links provided are quite nice
Although I would suggest to confirm which package exactly caused the issue,
before jumping into blind bisection

1. Revert xorg-server to previous version (1.13.2.901-1)
2. Keep xf86-video-nouveau 1.0.7-1, but rebuild it on top of the old/good
xserver

and vice versa

Note: to avoid rebuilding the input drivers have SSH handy and observe Xorg.log
for the offending lines

Note: if unsure about the specific build options, patches and others take a
look at the distro packaging system</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368034622.DB3301.2832--

--===============0032461654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0032461654==--
