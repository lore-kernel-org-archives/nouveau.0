From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Wed, 11 Jun 2014 12:12:48 +0000
Message-ID: <bug-79823-8800-VCNJ260hi0@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686343723=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0686343723==
Content-Type: multipart/alternative; boundary="1402488767.DCDBaDa0.11792"; charset="us-ascii"


--1402488767.DCDBaDa0.11792
Date: Wed, 11 Jun 2014 12:12:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #10 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
Bisect complete, I was right.

507f0230d4ca2238c818006499e21abb4c133203 is the first bad commit
commit 507f0230d4ca2238c818006499e21abb4c133203
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Wed Mar 5 22:25:55 2014 -0500

    nouveau: fix fence waiting logic in screen destroy

    nouveau_fence_wait has the expectation that an external entity is
    holding onto the fence being waited on, not that it is merely held onto
    by the current pointer. Fixes a use-after-free in nouveau_fence_wait
    when used on the screen's current fence.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=75279
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Reviewed-by: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
    Cc: "9.2 10.0 10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

:040000 040000 46ad31dd95db1695a8c91fffbf38ee7822d8a31f
cdf816d872018460b33f69949010f09dcdcbf38e M src

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402488767.DCDBaDa0.11792
Date: Wed, 11 Jun 2014 12:12:47 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>Bisect complete, I was right.

507f0230d4ca2238c818006499e21abb4c133203 is the first bad commit
commit 507f0230d4ca2238c818006499e21abb4c133203
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Wed Mar 5 22:25:55 2014 -0500

    nouveau: fix fence waiting logic in screen destroy

    nouveau_fence_wait has the expectation that an external entity is
    holding onto the fence being waited on, not that it is merely held onto
    by the current pointer. Fixes a use-after-free in nouveau_fence_wait
    when used on the screen's current fence.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="show_bug.cgi?id=75279">https://bugs.freedesktop.org/show_bug.cgi?id=75279</a>
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Reviewed-by: Christoph Bumiller &lt;<a href="mailto:e0425955&#64;student.tuwien.ac.at">e0425955&#64;student.tuwien.ac.at</a>&gt;
    Cc: &quot;9.2 10.0 10.1&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;

:040000 040000 46ad31dd95db1695a8c91fffbf38ee7822d8a31f
cdf816d872018460b33f69949010f09dcdcbf38e M src</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402488767.DCDBaDa0.11792--

--===============0686343723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0686343723==--
