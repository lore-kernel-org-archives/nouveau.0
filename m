From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49727] [nv30 gallium] wine 1.5.2 and 3Dmark2001se
 displays only black screen with FPS, on nv43/AGP
Date: Sat, 07 Sep 2013 20:46:44 +0000
Message-ID: <bug-49727-8800-WajuIFFNxp@http.bugs.freedesktop.org/>
References: <bug-49727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1699679381=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1699679381==
Content-Type: multipart/alternative; boundary="1378586804.07Cab1.14707"; charset="us-ascii"


--1378586804.07Cab1.14707
Date: Sat, 7 Sep 2013 20:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49727

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Yep, just like that. The thing I don't understand is

[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
BAD_ARGUMENT PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x1d6c data 0x00000000

method 0x1d6c is used for fencing within the nv30 gallium driver. It always
writes a 0 to that method, so... I don't know what's going on. I'm not really
familiar with the hardware, I was just following code paths around and noticed
the user_priv thing causing the crash.

The other patch (to disable ARB_framebuffer_object) is also required since the
hardware can't handle it in all cases. The driver could work around it, but
that extension isn't required until opengl 3.0 which can't be supported anyways
(I'm told).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378586804.07Cab1.14707
Date: Sat, 7 Sep 2013 20:46:44 +0000
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
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727">bug 49727</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Yep, just like that. The thing I don't understand is

[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
BAD_ARGUMENT PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x1d6c data 0x00000000

method 0x1d6c is used for fencing within the nv30 gallium driver. It always
writes a 0 to that method, so... I don't know what's going on. I'm not really
familiar with the hardware, I was just following code paths around and noticed
the user_priv thing causing the crash.

The other patch (to disable ARB_framebuffer_object) is also required since the
hardware can't handle it in all cases. The driver could work around it, but
that extension isn't required until opengl 3.0 which can't be supported anyways
(I'm told).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378586804.07Cab1.14707--

--===============1699679381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1699679381==--
