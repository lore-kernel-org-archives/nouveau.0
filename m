From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75189] [NV34] Fails to hibernate
Date: Wed, 19 Feb 2014 18:18:32 +0000
Message-ID: <bug-75189-8800-ICdjXw4mtt@http.bugs.freedesktop.org/>
References: <bug-75189-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217228633=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75189-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0217228633==
Content-Type: multipart/alternative; boundary="1392833912.A60D72.21497"; charset="us-ascii"


--1392833912.A60D72.21497
Date: Wed, 19 Feb 2014 18:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75189

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[  209.500014] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]

Does this happen every time you try to hibernate, or just that one time? I
believe the rest is fallout from incorrect logic in restoring stuff on an
aborted hibernate. I guess some bo doesn't get restored and the
nouveau_bo_write() tries to write to address 0x0.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392833912.A60D72.21497
Date: Wed, 19 Feb 2014 18:18:32 +0000
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
   title="NEW --- - [NV34] Fails to hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75189#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] Fails to hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75189">bug 75189</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[  209.500014] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]

Does this happen every time you try to hibernate, or just that one time? I
believe the rest is fallout from incorrect logic in restoring stuff on an
aborted hibernate. I guess some bo doesn't get restored and the
nouveau_bo_write() tries to write to address 0x0.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392833912.A60D72.21497--

--===============0217228633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0217228633==--
