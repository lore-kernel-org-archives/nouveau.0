From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28152] [NV36] corruption in FVWM window decorations
Date: Thu, 21 Aug 2014 19:58:28 +0000
Message-ID: <bug-28152-8800-4m7A92Fk0c@http.bugs.freedesktop.org/>
References: <bug-28152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0823693728=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0823693728==
Content-Type: multipart/alternative; boundary="1408651108.0dBa5581.9556"; charset="us-ascii"


--1408651108.0dBa5581.9556
Date: Thu, 21 Aug 2014 19:58:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28152

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Potentially of interest to you, here's something that helped a lot in tracking
down some rendering issues on NV1x:

rendercheck -f a8r8g8b8 -t blend,composite,cacomposite

In the nv1x case, some of the cacomposite stuff was broken. If this all works
out, try other formats, or other tests. The gradient test fails for me on all
hw I've tried it on, so don't worry about that one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408651108.0dBa5581.9556
Date: Thu, 21 Aug 2014 19:58:28 +0000
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
   title="REOPENED --- - [NV36] corruption in FVWM window decorations"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28152#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV36] corruption in FVWM window decorations"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28152">bug 28152</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Potentially of interest to you, here's something that helped a lot in tracking
down some rendering issues on NV1x:

rendercheck -f a8r8g8b8 -t blend,composite,cacomposite

In the nv1x case, some of the cacomposite stuff was broken. If this all works
out, try other formats, or other tests. The gradient test fails for me on all
hw I've tried it on, so don't worry about that one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408651108.0dBa5581.9556--

--===============0823693728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0823693728==--
