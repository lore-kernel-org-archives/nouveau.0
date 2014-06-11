From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79912] Nouveau unuseable with 3 monitors and a
	geforce GTX 670
Date: Wed, 11 Jun 2014 15:56:39 +0000
Message-ID: <bug-79912-8800-ILkWXeraYR@http.bugs.freedesktop.org/>
References: <bug-79912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0050958867=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79912-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0050958867==
Content-Type: multipart/alternative; boundary="1402502199.40Ad1.27534"; charset="us-ascii"


--1402502199.40Ad1.27534
Date: Wed, 11 Jun 2014 15:56:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79912

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If it's just memory that's too slow, you could try
http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next which should allow
you to try to change pstates via /sys/class/drm/card0/device/pstate. Note that
this is very experimental, and is more than likely just going to hang your
card. But worth a shot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402502199.40Ad1.27534
Date: Wed, 11 Jun 2014 15:56:39 +0000
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
   title="NEW --- - Nouveau unuseable with 3 monitors and a geforce GTX 670"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79912#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau unuseable with 3 monitors and a geforce GTX 670"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79912">bug 79912</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If it's just memory that's too slow, you could try
<a href="http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next">http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next</a> which should allow
you to try to change pstates via /sys/class/drm/card0/device/pstate. Note that
this is very experimental, and is more than likely just going to hang your
card. But worth a shot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402502199.40Ad1.27534--

--===============0050958867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0050958867==--
