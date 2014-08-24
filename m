From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83021] Separate X screens --> Xvideo is vsynced to
 primary screen only
Date: Sun, 24 Aug 2014 20:57:04 +0000
Message-ID: <bug-83021-8800-6bEzG9JwFo@http.bugs.freedesktop.org/>
References: <bug-83021-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647253596=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83021-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1647253596==
Content-Type: multipart/alternative; boundary="1408913824.AeE52.29826"; charset="us-ascii"


--1408913824.AeE52.29826
Date: Sun, 24 Aug 2014 20:57:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83021

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There have been a bunch of fixes to this logic in git -- does this issue still
happen with http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/ ?
Specifically I'm thinking of
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=6ad053788e804f3a8bd36ee3653ec95e7df62623

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408913824.AeE52.29826
Date: Sun, 24 Aug 2014 20:57:04 +0000
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
   title="NEW --- - Separate X screens --&gt; Xvideo is vsynced to primary screen only"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83021#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Separate X screens --&gt; Xvideo is vsynced to primary screen only"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83021">bug 83021</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There have been a bunch of fixes to this logic in git -- does this issue still
happen with <a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/</a> ?
Specifically I'm thinking of
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=6ad053788e804f3a8bd36ee3653ec95e7df62623">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=6ad053788e804f3a8bd36ee3653ec95e7df62623</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408913824.AeE52.29826--

--===============1647253596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1647253596==--
