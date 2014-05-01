From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69827] [NVC1] Uneven, jerky mouse movement,
 increasing CPU usage
Date: Thu, 01 May 2014 06:21:44 +0000
Message-ID: <bug-69827-8800-TSCXVHDPkT@http.bugs.freedesktop.org/>
References: <bug-69827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1621731419=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1621731419==
Content-Type: multipart/alternative; boundary="1398925304.bB143fa42.22558"; charset="us-ascii"


--1398925304.bB143fa42.22558
Date: Thu, 1 May 2014 06:21:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69827

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As always, step 1 is "try the latest". That means kernel 3.14.x, mesa 10.1. I'm
specifically thinking about commit 7d3428cd4b2ad51af86fdbdf8284ca38fa95e601 in
the kernel, which fixed some lag issues for a compton user.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398925304.bB143fa42.22558
Date: Thu, 1 May 2014 06:21:44 +0000
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
   title="REOPENED --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827">bug 69827</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As always, step 1 is &quot;try the latest&quot;. That means kernel 3.14.x, mesa 10.1. I'm
specifically thinking about commit 7d3428cd4b2ad51af86fdbdf8284ca38fa95e601 in
the kernel, which fixed some lag issues for a compton user.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398925304.bB143fa42.22558--

--===============1621731419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1621731419==--
