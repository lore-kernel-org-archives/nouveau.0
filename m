From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Tue, 10 Jun 2014 01:28:27 +0000
Message-ID: <bug-75761-8800-xbsBS5nefd@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1906984922=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1906984922==
Content-Type: multipart/alternative; boundary="1402363707.f8b436d5.23564"; charset="us-ascii"


--1402363707.f8b436d5.23564
Date: Tue, 10 Jun 2014 01:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A few pageflip-related commits landed in the repo:

http://cgit.freedesktop.org/~darktama/nouveau/

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ff527544b0048d41a56097a66ff954fb9b0a2c75

Seems related to what was going on here. Give it a shot... (you'll need to
build it against the latest drm-next tree from
http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next). Or try to apply
the patches to whatever kernel tree you're on -- should probably work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402363707.f8b436d5.23564
Date: Tue, 10 Jun 2014 01:28:27 +0000
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
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A few pageflip-related commits landed in the repo:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.freedesktop.org/~darktama/nouveau/</a>

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ff527544b0048d41a56097a66ff954fb9b0a2c75">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ff527544b0048d41a56097a66ff954fb9b0a2c75</a>

Seems related to what was going on here. Give it a shot... (you'll need to
build it against the latest drm-next tree from
<a href="http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next">http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next</a>). Or try to apply
the patches to whatever kernel tree you're on -- should probably work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402363707.f8b436d5.23564--

--===============1906984922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1906984922==--
