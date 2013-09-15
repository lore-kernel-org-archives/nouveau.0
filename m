From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69376] F19 Gnome-3 does not display icons for All
	Applications
Date: Sun, 15 Sep 2013 13:34:28 +0000
Message-ID: <bug-69376-8800-WaWiSMAxNR@http.bugs.freedesktop.org/>
References: <bug-69376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0185113494=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69376-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0185113494==
Content-Type: multipart/alternative; boundary="1379252068.CbA8B2.18550"; charset="us-ascii"


--1379252068.CbA8B2.18550
Date: Sun, 15 Sep 2013 13:34:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69376

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Can you try a mesa containing this

commit 3282697621241e646247b85327c50747416a766b
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sun Sep 1 12:38:52 2013 -0400

    nv30: find first unused texcoord rather than bailing if first is used

    This fixes shaders produced by supertuxkart.

    Cc: "9.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>


Which at the current stage is available only in the master branch in the mesa
tree [1]. I'm expecting this commit to be part of 9.2.1 in due course 


[1] http://cgit.freedesktop.org/mesa/mesa/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379252068.CbA8B2.18550
Date: Sun, 15 Sep 2013 13:34:28 +0000
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
   title="NEW --- - F19 Gnome-3 does not display icons for All Applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69376#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - F19 Gnome-3 does not display icons for All Applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69376">bug 69376</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Can you try a mesa containing this

commit 3282697621241e646247b85327c50747416a766b
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Sun Sep 1 12:38:52 2013 -0400

    nv30: find first unused texcoord rather than bailing if first is used

    This fixes shaders produced by supertuxkart.

    Cc: &quot;9.2&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;


Which at the current stage is available only in the master branch in the mesa
tree [1]. I'm expecting this commit to be part of 9.2.1 in due course 


[1] <a href="http://cgit.freedesktop.org/mesa/mesa/">http://cgit.freedesktop.org/mesa/mesa/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379252068.CbA8B2.18550--

--===============0185113494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0185113494==--
